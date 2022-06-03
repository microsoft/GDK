---
author: M-Stahl
title: XLaunchUri
description: Launches a URI on behalf of a user.
kindex: XLaunchUri
ms.author: michaelk
ms.topic: reference
edited: 02/10/2020
security: public
applies-to: pc-gdk
---

# XLaunchUri  

The Microsoft Game Development Kit (GDK) Launcher API provides a mechanism that enables games to launch an experience by invoking a URI.


## Syntax  
  
```cpp
HRESULT XLaunchUri(  
         XUserHandle requestingUser,  
         const char* uri  
)  
```  
  
### Parameters  
  
*requestingUser* &nbsp;&nbsp;\_In\_opt\_  
Type: XUserHandle  

  
Defines a handle identifying the user that makes the request.  


*uri* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
String that indicates the URI to launch.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code. 

Returns S_OK if successful; otherwise it returns an error code. For a list of error codes, see [Error Codes](../../../errorcodes.md).
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This launches a URI on behalf of a user, and consists of only one method, LaunchUri. It also accepts an optional user context and a required URI. 

If successful, the destination URI is launched. Otherwise, an error is returned. This method is not considered time critical, and blocks until the underlying async system operation is completed, and either the destination URI has been launched, or an error has occurred. 
 
If no app exists to handle the given URI’s protocol scheme, the system  displays a prompt to the user asking if they would like to search the Windows Store for an application that handles that scheme. 
 

## Requirements  
  
**Header:** XLauncher.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XLauncher](../xlauncher_members.md)
  
  