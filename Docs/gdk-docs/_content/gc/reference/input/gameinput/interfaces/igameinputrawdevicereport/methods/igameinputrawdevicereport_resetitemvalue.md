---
author: M-Stahl
title: ResetItemValue
description: Resets a device report item to its original "rest" value.
kindex: ResetItemValue
ms.author: angillie
ms.topic: reference
edited: 07/02/2019
quality: good
security: public
---

# IGameInputRawDeviceReport::ResetItemValue  
> [!NOTE]
> This function is not yet implemented.

Resets a device report item to its original "rest" value. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
bool ResetItemValue(  
         uint32_t itemIndex  
)  
```  
  
<a id="parametersSection"></a>

### Parameters  
  
*itemIndex* &nbsp;&nbsp;\_In\_  
Type: uint32_t  
  
Index of the report item within the device report buffer.  

<a id="retvalSection"></a>

### Return value  

Type: bool  
  
Returns true on success; returns false otherwise.  
    
<a id="remarksSection"></a>

## Remarks  

The original "rest" value is the initial value for the item when an output or feature report is created via the [CreateRawDeviceReport](../../igameinputdevice/methods/igameinputdevice_createrawdevicereport.md) method of the [IGameInputDevice](../../igameinputdevice/igameinputdevice.md) interface. 

Valid indexes for report items are based on the *itemCount* member of [GameInputRawDeviceReportInfo](../../../structs/gameinputrawdevicereportinfo.md).  
  
The [SetItemValue](igameinputrawdevicereport_setitemvalue.md), `ResetItemValue`, and [ResetAllItems](igameinputrawdevicereport_resetallitems.md) methods can be called only for output and feature reports. All of these methods return very quickly and are safe to call from any context.  
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Library:** xgameruntime.lib
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../../../input/overviews/input-overview.md)  
[IGameInputRawDeviceReport](../igameinputrawdevicereport.md)  
[GameInput](../../../gameinput_members.md)  
  