---
title: Global Storage tool (GlobalStorage.exe)
description: GlobalStorage.exe is used to manage title global storage in test sandboxes, before publish to RETAIL.
kindex: Global Storage tool (GlobalStorage.exe)
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: 03/12/2018
edited: 00/00/0000
security: public
---

# Global Storage tool (GlobalStorage.exe)

Global title storage is used to store data that everyone can read, such as rosters, maps, challenges, or art resources.

The Global Storage tool is used to manage global title storage in test sandboxes.
Data must still be published to RETAIL via Partner Center.

This command-line tool is part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).

Custom tools can be created with the [Dev Tools library](https://www.nuget.org/packages/Microsoft.Xbox.Services.DevTools).

GlobalStorage.exe is used to manage title global storage in test sandboxes, before publish to RETAIL.
XblDevAccount.exe signin is required to be called at least once before first use.

#### Usage:
***quota:*** Get title global storage quota information.
```
GlobalStorage.exe quota –scid xxx --sandbox xxx
```


Success output:
```
Your global storage quota: used bytes {usedBytes}, total bytes {totalBytes}
```

***list:*** Gets a list of blob meta-data under a given path for the title global storage.
```
GlobalStorage list --scid xxx --max-items 10 --path path --sandbox xxx
```
Success output:
```
Total 12 items found, Displaying item 0 to 12
        test.txt,       Config,         2
        ...
        tool.zip,       Binary,         1874772
```

***delete:*** Deletes a blob from title storage.
```
GlobalStorage delete --scid xxx --blob-path foo\bar\blob.txt --sandbox xxx --type Json
```

***download:*** Downloads blob data from title storage.
```
GlobalStorage download --scid xxx --output c:\test.txt --blob-path \text.txt --sandbox xxx --type Json
```

***upload:*** Uploads blob data to title storage.
```
GlobalStorage upload --scid xxx --file c:\test.txt --blob-path \text.txt --sandbox xxx --type Json
```