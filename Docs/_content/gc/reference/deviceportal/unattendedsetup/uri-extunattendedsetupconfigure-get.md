---
author: aablackm
title: GET (/ext/unattendedsetup/configure)
description: Retrieves configuration data for how scripts are run.
kindex: GET, /ext/unattendedsetup/configure
ms.author: mstahl
ms.topic: conceptual
edited: 00/00/0000
security: public
---

# GET (/ext/unattendedsetup/configure)
Retrieves configuration data for how scripts are run.   
   *  [URI parameters](#ID4ET)  
   *  [Required request headers](#ID4E1)  
   *  [Required request body](#ID4EBB)  
   *  [Response](#ID4EIB)  

 
<a id="ID4ET"></a>

   

## URI parameters  
   
  
None.   
  
<a id="ID4E1"></a>

   

## Required request headers  
   
  
None.   
  
<a id="ID4EBB"></a>

   

## Required request body   
   
  
None.   
  
<a id="ID4EIB"></a>

   

## Response  
   
  
If the call is successful, the service will return a JSON object with the following members.  
   

| Member| Description| 
| --- | --- | 
| RunOobeScript| Boolean value that indicates whether we should run any one-time script on the next boot (expected script name is oobe.cmd).| 
| BlockUsbScript| Boolean value that indicates whether we should block unattended scripts from running when on a USB device.| 
| SkipAbortToast| Boolean value that indicates whether we should run scripts immediately on boot instead of waiting for an abort window.| 
| BlockAllScripts| Boolean value that indicates whether we should block unattended scripts from running.| 
| HasScript| Boolean value that indicates whether the target console currently has a boot script.| 

 
<a id="ID4E2C"></a>

   

### HTTP status codes   
   
  
The service returns one of the status codes in this section in response to a request made with this method on this resource.   
   

| Code| Description| 
| --- | --- | --- | --- | 
| 200| The operation was successful.| 
| 4XX| Error codes. | 
| 5XX| Error codes. | 

   
<a id="ID4ECE"></a>

   

## See also  
 
<a id="ID4EEE"></a>

   

##### Parent  
 [/ext/unattendedsetup/configure](uri-extunattendedsetupconfigure.md)

   