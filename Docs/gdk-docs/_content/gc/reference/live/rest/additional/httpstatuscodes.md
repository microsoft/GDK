---
title: Standard HTTP status codes
description: " Standard HTTP status codes"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Standard HTTP status codes
 
The Hypertext Transport Protocol (HTTP) standard describes a number of status codes that are returned by the server in response to a client request. Xbox Live Services methods return HTTP protocol-compliant status codes to describe the status of the request.
 
Here is a list of status codes returned by Xbox Live Services, and their typical meanings.
 
<a id="ID4EAB"></a>

 
## Xbox Live Services Status Codes
 
| Code| Reason phrase| Description| 
| --- | --- | --- | 
| 200| OK| The request was successful.| 
| 201| Created| The entity was created.| 
| 202| Accepted| The request was accepted, but has not been completed yet.| 
| 204| No Content| The request has completed, but does not have content to return.| 
| 301| Moved Permanently| The service has moved to a different URI.| 
| 302| Found| The requested resource resides temporarily under a different URI.| 
| 307| Temporary Redirect| The URI for this resource has temporarily changed.| 
| 400| Bad Request| Service could not understand malformed request. Typically an invalid parameter.| 
| 401| Unauthorized| The request requires user authentication.| 
| 403| Forbidden| The request is not allowed for the user or service.| 
| 404| Not Found| The specified resource could not be found.| 
| 406| Not Acceptable| Resource version is not supported.| 
| 408| Request Timeout| The request took too long to complete.| 
| 409| Conflict| The request was not completed due to a conflict with the current state of the resource.| 
| 410| Gone| The requested resource is no longer available.| 
| 412| Precondition Failed| The server does not meet one of the preconditions that the requester put on the request.| 
| 416| Requested Range Not Satisfiable| The requested range is not available.| 
| 500| Internal Server Error| The server encountered an unexpected condition which prevented it from fulfilling the request.| 
| 501| Not Implemented| The server does not support the functionality required to fulfill the request.| 
| 503| Service Unavailable| Request has been throttled, try the request again after the client-retry value in seconds (e.g. 5 seconds later).| 
 

> **Note:**   
> Some resources and methods provide specific information about the meaning of particular status codes within the context of that resource or method. For more details, refer to the documentation for the resources or methods that you are using. 

  
<a id="ID4E3BAC"></a>

 
## See also
 
<a id="ID4E5BAC"></a>

 
##### Parent  

[Additional Reference](atoc-xboxlivews-reference-additional.md)

  
<a id="ID4EKCAC"></a>

 
##### Reference  [Universal Resource Identifier (URI) Reference](../uri/atoc-xboxlivews-reference-uris.md)

 [Additional Reference](atoc-xboxlivews-reference-additional.md)

  
<a id="ID4EZCAC"></a>

 
##### External links  [W3.org: HTTP/1.1 Status Code Definitions](https://www.w3.org/Protocols/rfc2616/rfc2616-sec10.html#sec10)

   