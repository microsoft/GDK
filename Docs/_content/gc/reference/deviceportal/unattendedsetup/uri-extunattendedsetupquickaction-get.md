---
author: aablackm
title: GET (/ext/unattendedsetup/quickaction)
description: Retrieves the information about the scripts applied to and available to the front panel buttons on the target Xbox One development console.
kindex: GET, /ext/unattendedsetup/quickaction
ms.author: jaswill
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# GET (/ext/unattendedsetup/quickaction)
Retrieves the information about the scripts applied to and available to the front panel buttons on the target Xbox One development console.
   *  [URI parameters](#ID4EX)  
   *  [Required request headers](#ID4E5)  
   *  [Required request body](#ID4EFB)  
   *  [Response](#ID4EMB)  

 
<a id="ID4EX"></a>

   

## URI parameters  
   
  
| Parameter| Description|  | 
| --- | --- | --- | 
| Name| base64-encoded string| Optional string indicating we want the contents of a script.|   
| IsBuiltIn| boolean| Optional bool indicating if this is a built in script provided with the system or a custom script added to the console by the user.|    
  
<a id="ID4E5"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4EFB"></a>

   

## Required request body   
   
  
None.   
  
<a id="ID4EMB"></a>

   

## Response  
   
  
If the call is successful and a script was requested by name, the service will return the script file as a multi-part conforming HTTP body.

If a script was not requested, the service will return a JSON object with the following members:
   

| Member| Description| 
| --- | --- | 
| IsAvailable| boolean| Whether or not front panel scripts are available on this console. This will be true for the Xbox One X Devkit and false for other devkit types. If this is false, no other members will be returned. | 
| QuickActions| Array of JSON objects| An array containing all the available quick actions on this console. | 
| AssignedActions| Array of JSON objects| An array containing the 5 quick actions which are assigned to the front panel buttons on this console. |

Quick actions JSON objects have the following members:

| Member| Description| 
| --- | --- | 
| Name| base64-encoded string| The name of the script on the console.|   
| IsBuiltIn| boolean| Whether or not this is a built in script provided with the system or a custom script added to the console by the user.|
 
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

   