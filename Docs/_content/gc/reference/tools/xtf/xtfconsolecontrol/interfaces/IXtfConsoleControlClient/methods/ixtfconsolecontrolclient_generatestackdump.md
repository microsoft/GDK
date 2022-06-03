---
author: aablackm
title: GenerateStackDump
description: Generates a stack dump.
ms.assetid: M:Windows.Xbox.xtfconsolecontrol.IXtfConsoleControlClient.GenerateStackDump(UINT32,UINT32,LPCWSTR,LPBSTR)
kindex:
- GenerateStackDump method
- IXtfConsoleControlClient--GenerateStackDump method
ms.author: scotmi
ms.topic: reference
edited: 07/24/2020
security: public
---

# IXtfConsoleControlClient::GenerateStackDump
  
Generates a stack dump.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT GenerateStackDump(
         UINT32 ProcessId,
         UINT32 DumpType,
         LPCWSTR ImageName,
         LPBSTR FilePath  
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*ProcessId*  
Type: UINT32  
  
The identifier of the process to create the stack dump for.  
  
*DumpType*  
Type: UINT32  
  
The type of stack dump to create.  Valid dump types are:  
  
| Value | Description |  
| -------- | ----------- |  
| 0 | Triage |  
| 1 | Mini |  
| 2 | Heap |  
  
*ImageName*  
Type: LPCWSTR  
  
The name of the image.  
  
*FilePath*  
Type: LPBSTR  
  
A pointer to a string that receives the file path to the created stack dump file.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code. If the function times out while waiting for a stack dump to complete, this function returns `E_MESSAGE_TIMED_OUT`.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function generates a stack dump from a specified process for an executable image on the development console. The stack dump is saved as a file on the scratch drive of the console, at the file path returned in `FilePath`.

The information captured by the stack dump, and the time it takes to capture that information, depends on the dump type specified in `DumpType`. This function times out after 5 minutes; if a stack dump is not returned by the console before the function times out, this function returns `E_MESSAGE_TIMED_OUT`. The following table describes the information returned by each stack dump type.  
  
| Dump Type | Description |  
| --------- | ----------- |  
| Triage | Collects stack traces for all threads, active OS handles, thread information, and information on unloaded modules. Triage dumps are scrubbed of personally identifiable information (PII). |  
| Mini | Collects data segments from all loaded modules, security-token–related data, thread information, and information on the unloaded modules. Mini dumps aren’t scrubbed of PII. |  
| Heap | Provides a full user-mode crash dump of all processes and memory that are running in the Game OS. Although this option provides the most information, it can take a few minutes to write out all the data. |  
  
For more information about available tool and automation APIs, such as Xbox Tools Framework (XTF), see [Tool and automation APIs (NDA topic)](../../../../../../../test-automation-publishing/test-automation-publishing-tools/tools-automation-apis/atoc-api-tools-dev-env.md).  
  
<a id="remarks_output"></a>
  
### Handling LPBSTR pointers
  
For more information about handling LPBSTR pointers returned by this function, see to [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfconsolecontrol.h  
  
**Library:** xtfconsolecontrol.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../../../xtfconsolecontrol_members.md)  
[Xbox Tools Framework](../../../../atoc-xbox-tools-framework.md)  
  