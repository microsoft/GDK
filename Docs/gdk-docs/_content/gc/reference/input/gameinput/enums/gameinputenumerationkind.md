---
author: M-Stahl
title: GameInputEnumerationKind
description: Enumerates types of behavior for enumerating input devices.
kindex: GameInputEnumerationKind
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputEnumerationKind  

Enumerates types of behavior for enumerating input devices.  

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputEnumerationKind    
{  
    GameInputNoEnumeration = 0,  
    GameInputAsyncEnumeration = 1,  
    GameInputBlockingEnumeration = 2  
} GameInputEnumerationKind  
```  
  
<a id="constantsSection"></a>

## Constants  
  
| Constant | Description |
| --- | --- |
| GameInputNoEnumeration | Input devices will not be enumerated. |  
| GameInputAsyncEnumeration | Input devices will be enumerated asynchronously. |  
| GameInputBlockingEnumeration | Input devices will be enumerated synchronously. |  
  
<a id="remarksSection"></a>

## Remarks  
  
This enumeration is used by the [IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md) method. Both `GameInputAsyncEnumeration` and `GameInputBlockingEnumeration` cause an initial round of callbacks to be generated. `GameInputBlockingEnumeration` causes `RegisterDeviceCallback` to block until all initial callbacks are called. 

For more information, see [GameInput callbacks](../../../../input/advanced/input-callbacks.md). 

<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[IGameInput::RegisterDeviceCallback](../interfaces/igameinput/methods/igameinput_registerdevicecallback.md)  
[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  