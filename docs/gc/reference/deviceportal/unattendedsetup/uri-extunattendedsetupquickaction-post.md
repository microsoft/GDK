---
author: aablackm
title: POST (/ext/unattendedsetup/quickaction)
description: Changes the script assigned to one of the front panel buttons or runs one of the front panel scripts on the target Xbox One development console.
kindex: POST, /ext/unattendedsetup/quickaction
ms.author: jaswill
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# POST (/ext/unattendedsetup/quickaction)
Changes the script assigned to one of the front panel buttons or runs one of the front panel scripts on the target Xbox One development console.
   *  [URI parameters](#ID4EX)  
   *  [Required request headers](#ID4E5)  
   *  [Required request body](#ID4EFB)  
   *  [Optional request body](#ID4EZB)
   *  [Response](#ID4EMB)  

 
<a id="ID4EX"></a>

   

## URI parameters  
   
  
| Parameter| Description|  | 
| --- | --- | --- | 
| ButtonNumber| number| Optional number of the front panel button we are dealing with. If this is not provided, this is a request to add a new custom script to the console.|   
| Name| base64-encoded string| Optional string indicating the name of the script we are applying to a button. If this is not provided then the current script associated with ButtonNumber is run instead.|    
| IsBuiltIn| boolean| Optional bool indicating whether or not the script we are applying is a built in script provided with the system or a custom script previously added to the console by the user.|
  
<a id="ID4E5"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4EFB"></a>

   

## Required request body   
   
  
None.   

<a id="ID4EZB"></a>

## Optional request body  
   
If no ButtonNumber was provided, the call requires a multi-part conforming HTTP body that contains the script file to add to the console.
   
<a id="ID4EMB"></a>

## Response  
   
  
If the call is successful and the request was to run the action associated with a button, the service will return a JSON object with the following members:
   

| Member| Description| 
| --- | --- | 
| Output| string| The output from running the script associated with the requested button. |

If the call was to apply a script to a button or add a new custom script, there is no response body.
 
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
 [/ext/unattendedsetup/quickaction](uri-extunattendedsetupquickaction.md)

   