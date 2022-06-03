---
author: M-Stahl
title: XPackageGetUserLocale
description: Gets the current user locale.
kindex: XPackageGetUserLocale
ms.author: shanede
ms.topic: reference
edited: 05/18/2019
security: public
applies-to: pc-gdk
---

# XPackageGetUserLocale  

Gets the current user locale.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XPackageGetUserLocale(
    size_t localeSize,
    char* locale
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*localeSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
On success, the size of the string in *locale*.  
  
*locale* &nbsp;&nbsp;\_Out\_writes\_(localeSize)  
Type: char\*  
  
On success, contains the user locale.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
HRESULT success or error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  > [!NOTE]
> This function isn't safe to call on a time-sensitive thread. For more information, see [Time-sensitive threads](../../../../system/overviews/time-sensitive-threads.md).  
  
This function gets the user locale that most closely matches the package locale. If no locale information is declared for the package, this function succeeds but does not return a user locale in `locale`. If the package locale matches an installed user locale, the function succeeds and returns the user locale in `locale`. If the package locale does not exactly match an installed user locale, the function attempts to find the closest matching installed user locale. If the function cannot find a close match, an error occurs; otherwise, the function succeeds and the closest matching installed user locale is returned in `locale`.  
  
If you are using Intelligent Delivery to control which languages are installed for your game, it’s possible that the locale to which the user has set the console has chunks that are not currently installed. This requires a game to always verify that the necessary chunks are installed, and to fall back to another language if they are not: a procedure that requires considerable knowledge about locales and how they fall back to their closest languages. This function provides a way to get the current user locale, or the closest matching fallback, without the need to implement your own locale analysis and fallback procedure.  
  
The following code sample demonstrates how to use this function.  
  
```cpp
char gameLocale[LOCALE_NAME_MAX_LENGTH];

// Get the best user locale that is installed
HRESULT hr = XPackageGetUserLocale(_countof(gameLocale), gameLocale);
if (SUCCEEDED(hr))
{
    printf("Game using locale: %s\n", gameLocale);
}
```  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** XPackage.h  
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)  
  