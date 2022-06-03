---
title: VerifyStringResult (JSON)
description: " VerifyStringResult (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# VerifyStringResult (JSON)
Result codes corresponding to each string submitted to [/system/strings/validate](../uri/stringserver/uri-systemstringsvalidate.md).
<a id="ID4ER"></a>


## VerifyStringResult

The VerifyStringResult object has the following specification.

| Member| Type| Description|
| --- | --- | --- |
| resultCode| 32-bit unsigned integer| Required. HResult code corresponding to submitted string.|
| offendingString| string| Required. String value that caused a string to be rejected.|

<a id="ID4EXB"></a>


## Sample JSON syntax


```json
{
    "verifyStringResult":
    [
        {"resultCode": "1", "offendingString": "badword"},
        {"resultCode": "0", "offendingString": ""},
        {"resultCode": "0", "offendingString": ""},
        {"resultCode": "0", "offendingString": ""},
    ]
}

```


#### Common HResult Values

| Value| Error Name|
| --- | --- | --- | --- | --- |
| 0| Success|
| 1| Offensive string|
| 2| String too long|
| 3| Unknown error|

<a id="ID4ELD"></a>


## See also

<a id="ID4END"></a>


##### Parent

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)


<a id="ID4EXD"></a>


##### Reference

[POST (/system/strings/validate)](../uri/stringserver/uri-systemstringsvalidatepost.md)