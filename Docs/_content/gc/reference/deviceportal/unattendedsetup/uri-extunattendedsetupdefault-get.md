---
author: aablackm
title: GET (/ext/unattendedsetup/default)
description: Retrieves the boot script on the target Xbox One development console.
kindex: GET, /ext/unattendedsetup/default
ms.author: mstahl
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# GET (/ext/unattendedsetup/default)
Retrieves the boot script on the target Xbox One development console.   
   *  [URI parameters](#ID4EX)  
   *  [Required request headers](#ID4E5)  
   *  [Required request body](#ID4EFB)  
   *  [Response](#ID4EMB)  

 
<a id="ID4EX"></a>

   

## URI parameters  
   
  
None.   
  
<a id="ID4E5"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4EFB"></a>

   

## Required request body   
   
  
None.   
  
<a id="ID4EMB"></a>

   

## Response  
   
  
If the call is successful, the service will return the script file as a multi-part conforming HTTP body.  
 
<a id="ID4ESB"></a>

   

### HTTP status codes   
   
  
The service returns one of the status codes in this section in response to a request made with this method on this resource.   
   

| Code| Description| 
| --- | --- | 
| 200/204| The operation was successful.| 
| 4XX| Error codes. | 
| 5XX| Error codes. | 

   
<a id="ID4EZC"></a>

   

## See also  
 
<a id="ID4E2C"></a>

   

##### Parent  
 [/ext/unattendedsetup/default](uri-extunattendedsetupdefault.md)

   