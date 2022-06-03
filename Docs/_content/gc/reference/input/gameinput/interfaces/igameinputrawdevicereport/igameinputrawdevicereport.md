---
author: M-Stahl
title: IGameInputRawDeviceReport (Interface contents)
description: Represents a raw byte buffer passed to or from an input device.
kindex: IGameInputRawDeviceReport
ms.author: angillie
ms.topic: navigation
edited: 06/05/2019
security: public
---

# IGameInputRawDeviceReport  
> [!NOTE]
> This interface is not yet implemented.

Represents a raw byte buffer passed to or from an input device.
Encapsulates  input, output, and feature reports. This allows the GameInput implementation to control ownership of the memory buffers, track which device the raw report is associated with, and account for any differences in headers/formatting between the various supported device protocols.

## Syntax  
  
```cpp  
class IGameInputRawDeviceReport : public IUnknown  
```  
  
  
## Methods  
  
| Method | Description |  
| --- | --- |  
| [GetDevice](methods/igameinputrawdevicereport_getdevice.md) | Retrieves the device associated with the raw device report. |  
| [GetItemValue](methods/igameinputrawdevicereport_getitemvalue.md) | IGameInputRawDeviceReport GetItemValue API reference |  
| [GetRawData](methods/igameinputrawdevicereport_getrawdata.md) | Retrieves the report buffer contents in raw byte form. |  
| [GetRawDataSize](methods/igameinputrawdevicereport_getrawdatasize.md) | Returns the size of the raw report buffer in bytes. |  
| [IGameInputRawDeviceReport::GetReportInfo](methods/igameinputrawdevicereport_getreportinfo.md) | Returns a pointer to a raw device report. |  
| [ResetAllItems](methods/igameinputrawdevicereport_resetallitems.md) | IGameInputRawDeviceReport ResetAllItems API reference |  
| [ResetItemValue](methods/igameinputrawdevicereport_resetitemvalue.md) | Resets a device report item to its original "rest" value. |  
| [SetItemValue](methods/igameinputrawdevicereport_setitemvalue.md) | IGameInputRawDeviceReport SetItemValue API reference |  
| [SetRawData](methods/igameinputrawdevicereport_setrawdata.md) | Sets the contents of the report buffer. |  
  

  
## Remarks  
  
This is used for "raw" devices. Generally meant for OEMs that want to publish SDKs for their raw devices or to expose some additional functionality beyond what the GameInput API allows.  
  
## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
## See also  

[Input API Overview](../../../../../input/overviews/input-overview.md)  
[GameInput](../../gameinput_members.md)  
  
  
  