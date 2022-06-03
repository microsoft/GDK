---
author: M-Stahl
title: set_legacy_era_uwp_compat_mode_enabled
description: Indicates whether the legacy ERA and Windows Platform (UWP) compatibility mode for Game Chat 2 should be enabled.
kindex: set_legacy_era_uwp_compat_mode_enabled
ms.author: jkepner
ms.topic: reference
ms.date: 01/02/2020
edited: '09/10/2020'
quality: good
security: public
applies-to: pc-gdk
---

# chat_manager::set_legacy_era_uwp_compat_mode_enabled
  
Indicates whether the legacy ERA and Windows Platform (UWP) compatibility mode for Game Chat 2 should be enabled.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
void set_legacy_era_uwp_compat_mode_enabled(  
    bool enabled
)  
```  
  
<a id="parametersSection"></a>
  
### Parameters
  
*enabled* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Indicates whether the legacy ERA and UWP compatibility mode should be enabled.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: void
  
None.
  
<a id="remarksSection"></a>
  
## Remarks
  
This method indicates whether the legacy ERA and UWP compatibility mode for Game Chat 2 should be enabled. Enabling legacy ERA and UWP compatibility mode allows interoperability between Microsoft Game Development Kit (GDK) versions of Game Chat 2 and console ERA and Windows Platform (UWP) versions of Game Chat 2.  
  
This method may be called at any time before or after [chat_manager::initialize](chat_manager_initialize.md) is called, and takes effect on the following call to `chat_manager::initialize`. The legacy ERA and UWP compatibility mode setting is persisted across subsequent calls to [chat_manager::cleanup](chat_manager_cleanup.md) and `chat_manager::initialize`.  
  
Game Chat 2 uses a legacy codec when legacy ERA and UWP compatibility mode is enabled, so audio quality and performance may be reduced. New titles should not use the legacy ERA and UWP compatibility mode unless interoperability with legacy clients is required. This mode may be deprecated and removed in future versions of Game Chat 2.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** GameChat2.h  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>
  
## See also
  
[Intro to Game Chat 2](../../../../../../chat/overviews/game-chat2/game-chat-2-intro.md)  
[chat_manager](../chat_manager.md)  
  