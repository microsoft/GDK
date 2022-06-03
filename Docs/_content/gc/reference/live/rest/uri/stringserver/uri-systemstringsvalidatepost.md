---
title: POST (/system/strings/validate)
description: " POST (/system/strings/validate)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST (/system/strings/validate)
Accepts an array of strings for validation and returns an array of results of equal size. 
The domain for these URIs is `client-strings.xboxlive.com`.
 
  * [Remarks](#ID4EV)
  * [Required Request Headers](#ID4EIB)
  * [Request body](#ID4ELC)
  * [HTTP status codes](#ID4E4C)
  * [Response body](#ID4ETF)
 
<a id="ID4EV"></a>

 
## Remarks
 
Each result indicates whether the corresponding string is acceptable on Xbox LIVE, and contains the offending string if applicable.
 
Identical strings will always give identical results. If you receive a non-successful result, analyze the result and modify the string accordingly.
 
 

> **Note:**   
> The resulting <b>VerifyStringResult</b> will only report the first offending word in the string. There might be additional offending words within the string. If you plan to replace the offending words to make the string usable, you should replace the offending word or substring and then re-verify the string to look for additional offending substrings.  

 
  
<a id="ID4EIB"></a>

 
## Required Request Headers
 
| Header| Description| 
| --- | --- | --- | 
| Authorization| Authentication Token. Example: XBL3.0 x=[hash];[token].| 
| x-xbl-contract-version| Integer API contract version. Must be 1 or 2 for this API.| 
  
<a id="ID4ELC"></a>

 
## Request body
 
The request body is an array of strings, with no limits on the size of the array, and 512 characters per string.
 
<a id="ID4ETC"></a>

 
### Sample request
 

```cpp
{
    "stringstoVerify":
    [
        "Poppycock",
        "The quick brown fox jumped over the lazy dog.",
        "Hey, want to play games together?",
        "oh noes"
    ]
}
      
```

   
<a id="ID4E4C"></a>

 
## HTTP status codes
 
The service returns one of the status codes in this section in response to a request made with this method on this resource. For a complete list of standard HTTP status codes used with Xbox Live Services, see [Standard HTTP status codes](../../additional/httpstatuscodes.md).
 
| Code| Reason phrase| Description| 
| --- | --- | --- | --- | --- | --- | 
| 200| OK| All strings were processed successfully. This does not necessarily mean all strings had positive HResults.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 406| Not Acceptable| Missing <b>Content-type: application/json</b> header.| 
| 408| Request Timeout| Service could not understand malformed request. Typically an invalid parameter.| 
  
<a id="ID4ETF"></a>

 
## Response body
 
Returns an array of [VerifyStringResult (JSON)](../../json/json-verifystringresult.md), of the same size as the request array.
  
<a id="ID4EAG"></a>

 
## See also
 
<a id="ID4ECG"></a>

 
##### Parent 

[/system/strings/validate](uri-systemstringsvalidate.md)

   