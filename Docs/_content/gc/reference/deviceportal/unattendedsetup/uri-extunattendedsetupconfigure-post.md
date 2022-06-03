---
author: aablackm
title: POST (/ext/unattendedsetup/configure)
description: Sets configuration data for how scripts are run.
kindex: POST, /ext/unattendedsetup/configure
ms.author: mstahl
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# POST (/ext/unattendedsetup/configure)
Sets configuration data for how scripts are run.   
   *  [URI parameters](#ID4ET)  
   *  [Required request headers](#ID4E1)  
   *  [Required request body](#ID4EBB)  
   *  [Response](#ID4EOC)  

 
<a id="ID4ET"></a>

   

## URI parameters  
   
  
None.   
  
<a id="ID4E1"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4EBB"></a>

   

## Required request body   
   
  
The request must contain a JSON body that has the following members.   
   

| Member| Description| 
| --- | --- | 
| RunOobeScript| Boolean value that indicates whether we should run any one-time script on the next boot (expected script name is oobe.cmd).| 
| BlockUsbScript| Boolean value that indicates whether we should block unattended scripts from running when on a USB device.| 
| SkipAbortToast| Boolean value that indicates whether we should run scripts immediately on boot instead of waiting for an abort window.| 
| BlockAllScripts| Boolean value that indicates whether we should block unattended scripts from running.| 

  
<a id="ID4EOC"></a>

   

## Response  
 
<a id="ID4EUC"></a>

   

### HTTP status codes   
   
  
The service returns one of the status codes in this section in response to a request made with this method on this resource.   
   

| Code| Description| 
| --- | --- | --- | --- | 
| 200| The operation was successful.| 
| 4XX| Error codes. | 
| 5XX| Error codes. | 

   
<a id="ID4E2D"></a>

   

## See also  
 
<a id="ID4E4D"></a>

   

##### Parent  
 [/ext/unattendedsetup/configure](uri-extunattendedsetupconfigure.md)

   