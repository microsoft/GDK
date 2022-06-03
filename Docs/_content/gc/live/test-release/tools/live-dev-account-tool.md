---
title: Developer Account tool (XblDevAccount.exe)
description: Manages authentication of a developer account and saves the credentials to be used across other Xbox Live executables.
kindex:
- Xbox Live Developer Account tool (XblDevAccount.exe)
- Dev Account tool
- XblDevAccount.exe
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 03/12/2018
edited: 00/00/0000
security: public
---

# Xbox Live Developer Account tool (XblDevAccount.exe)

The Xbox Live Developer Account tool is used to manage authentication of a developer account.
This tool is needed to interact with other developer tools that require a developer credential, such as Player Reset and Global Storage.

This command-line tool is part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).

This executable is used to signin/out dev accounts and to save the credentials to be used across other Xbox Live executables that require dev credentials.


## Usage:

***signin:*** This command will pop up UI if needed. The last used account information will be saved for further use across all other executables.
``` 
XblDevAccount.exe signin --name xxx --source XDP|WindowsDevCenter
```

***Success output example:***
```
Developer account {Name} has successfully signed in.
    ID: {id}
    AccountID: {accountId}
    AccountType: {accountType}
    AccountMoniker: {accountMoniker}
    AccountSource: {accountSource}
```

***signout:*** This command will delete the last signed in account information, and clear up cached tokens.

```
XblDevAccount.exe signout
```

***Success output example:***
```
Developer account {Name} has successfully signed out.
```