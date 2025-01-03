# Utilities

This repository contains the utility scripts that can help reduce the work and automate things. _.sh_ scripts are for ![Linux Logo](https://cdn-icons-png.flaticon.com/16/6124/6124995.png) Linux (Can be run in windows with [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/)) and _.bash_ scripts are for ![Windows Logo](https://cdn-icons-png.flaticon.com/16/270/270831.png) Windows.

---

## ![Linux Logo](https://cdn-icons-png.flaticon.com/24/6124/6124995.png) Linux

### [Git update all subfolders](git-update-all-subfolders.sh)

The script can update all the branches of the git subfolders and remove the stale branches. It will not resolve the conflict.
Download the script and run the script.

```Shell
wget https://raw.githubusercontent.com/dhavalgajjarin/utilities/main/git-update-all-subfolders.sh
# git-update-all-subfolders.sh {path-to-parent-folder}
git-update-all-subfolders.sh /opt/repos
```

---

## ![Windows Logo](https://cdn-icons-png.flaticon.com/16/270/270831.png) Windows

### [Safe start windows service (Cmd)](SafeServiceStart.bat)

The script is used to start remote/local windows service and wait for service is started. To run these scripts, _**you should be a user with administration rights on the target machine and running this from a computer that is a member of the same domain.**_

```Batchfile
# SafeServiceStart.bat [target-system] [service-name]
SafeServiceStart.bat TEST-APP-SERVER Application
```

### [Safe stop windows service (Cmd)](SafeServiceStop.bat)

The script is used to stop remote/local windows service and wait for service is stopped. To run these scripts, _**you should be a user with administration rights on the target machine and running this from a computer that is a member of the same domain.**_

```Batchfile
# SafeServiceStop.bat [target-system] [service-name]
SafeServiceStop.bat TEST-APP-SERVER Application
```

### [Safe restart windows service (Cmd)](SafeServiceRestart.bat)

The script is used to restart remote/local windows service and wait for service is stopped and started. To run these scripts, _**you should be a user with administration rights on the target machine and running this from a computer that is a member of the same domain.**_

```Batchfile
# SafeServiceRestart.bat [target-system] [service-name]
SafeServiceRestart.bat TEST-APP-SERVER Application
```

---

## 🤝 Contributing

If you would like to help, please take a look at the list of [issues](https://github.com/dhavalgajjarin/utilities/issues/).

## 📜 License

- [**GNU General Public License v3.0**](https://github.com/dhavalgajjarin/utilities/blob/main/LICENSE)

## 📣 Feedback

- ⭐ This repository if this project helped you! :wink:
- Create An [🔧 Issue](https://github.com/dhavalgajjarin/utilities/issues/) if you need help / found a bug

## Connect & Say 👋

- **Follow** me on [👨‍💻 Github][github]
- **Follow** me on [🐦 Twitter][twitter]

<!-- Personl Links -->

[github]: https://github.com/dhavalgajjarin
[twitter]: https://twitter.com/dhavalgajjarin
