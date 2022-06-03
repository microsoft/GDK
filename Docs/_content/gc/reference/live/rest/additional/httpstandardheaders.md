---
title: Standard HTTP Request and Response Headers
description: " Standard HTTP Request and Response Headers"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Standard HTTP Request and Response Headers
 
<a id="ID4ES"></a>

 
## Request Headers
 
The following table lists the standard HTTP headers used when making Xbox Live Services requests.
 
| Header| Value| Description| 
| --- | --- | --- | 
| x-xbl-contract-version| 1| API contract version. Required on all Xbox Live Services requests.| 
| Authorization| STSTokenString| STS authentication token. The value for this header is retrieved from the <b>GetTokenAndSignatureResult.Token</b> property. | 
| Content-Type| application/xml, application/json, multipart/form-data or application/x-www-form-urlencoded| Specifies the type of content being submitted with a request.| 
| Content-Length| Integer value| Specifies the length of the data being submitted in a POST request.| 
| Accept-Language | String| Specifies how to localize any strings returned. See <a href="https://msdn.microsoft.com/en-us/library/bb975829.aspx">Advanced Xbox 360 Programming</a> for a list of valid language/locale combinations.| 
  
<a id="ID4E6C"></a>

 
## Response Headers
 
The following table lists the standard HTTP header used in Xbox Live Services responses.
 
| Header| Value| Description| 
| --- | --- | --- | --- | --- | --- | 
| Content-Type| application/xml, application/json| Specifies the type of content being returned.| 
| Content-Length| Integer value| Specifies the length of the data being returned.| 
  
<a id="ID4EEE"></a>

 
## See also
 
<a id="ID4EGE"></a>

 
##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)

   