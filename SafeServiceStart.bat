@echo off
:: This script originally authored by Eric Falsken

IF [%1]==[] GOTO usage
IF [%2]==[] GOTO usage

ping -n 1 %1 | FIND "TTL=" >NUL
IF errorlevel 1 GOTO SystemOffline
SC \\%1 query %2 | FIND "STATE" >NUL
IF errorlevel 1 GOTO SystemOffline

:ResolveInitialState
SC \\%1 query %2 | FIND "STATE" | FIND "STOPPED" >NUL
IF errorlevel 0 IF NOT errorlevel 1 GOTO StartService
SC \\%1 query %2 | FIND "STATE" | FIND "RUNNING" >NUL
IF errorlevel 0 IF NOT errorlevel 1 GOTO StartedService
SC \\%1 query %2 | FIND "STATE" | FIND "PAUSED" >NUL
IF errorlevel 0 IF NOT errorlevel 1 GOTO SystemOffline
echo Service State is changing, waiting for service to resolve its state before making changes
sc \\%1 query %2 | Find "STATE"
ping -n 2 127.0.0.1 >NUL
GOTO ResolveInitialState

:StartService
echo Starting %2 on \\%1
sc \\%1 start %2 >NUL

GOTO StartingService
:StartingServiceDelay
echo Waiting for %2 to start
ping -n 2 127.0.0.1 >NUL
:StartingService
SC \\%1 query %2 | FIND "STATE" | FIND "RUNNING" >NUL
IF errorlevel 1 GOTO StartingServiceDelay

:StartedService
echo %2 on \\%1 is started
GOTO:eof

:SystemOffline
echo Server \\%1 is not accessible or is offline
GOTO:eof

:usage
echo %0 [system name] [service name]
echo Example: %0 server1 MyService
echo.
GOTO:eof