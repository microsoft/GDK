---
author: aablackm
title: POST (/ext/unattendedsetup/test)
description: Tests a script by running it on the target Xbox One development console.
kindex: POST, /ext/unattendedsetup/test
ms.author: mstahl
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# POST (/ext/unattendedsetup/test)
Tests a script by running it on the target Xbox One development console.   
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
   
  
Multi-part conforming HTTP body that contains the script file to run.   
  
<a id="ID4EMB"></a>

   

## Response  
   
  
If the call is successful, the service will return a JSON object with the script output and status code.  
 
<a id="ID4ESB"></a>

   

### HTTP status codes   
   
  
The service returns one of the status codes in this section in response to a request made with this method on this resource.   
   

| Code| Description| 
| --- | --- | 
| 200| The operation was successful.| 
| 4XX| Error codes. | 
| 5XX| Error codes. | 

   
<a id="ID4EZC"></a>

   

## See also  
 
<a id="ID4E2C"></a>

   

##### Parent  
 [/ext/unattendedsetup/test](uri-extunattendedsetuptest.md)

   