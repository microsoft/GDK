---
author: aablackm
title: OnDeployInitialized
description: Callback invoked when deployment begins.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfDeployCallback.OnDeployInitialized
kindex:
- OnDeployInitialized method
- IXtfDeployCallback--OnDeployInitialized method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
quality: good
---

# IXtfDeployCallback::OnDeployInitialized Method
  
Callback invoked when deployment begins.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT OnDeployInitialized()  
```
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` to continue deployment, or an HRESULT error code to cancel the deployment.  
  
## Remarks
  
This callback is invoked once, to indicate that the deployment system has successfully initialized and is beginning the deployment process. If your code needs to store a starting time to measure deployment time, or to initialize a progress dialog, this is a good place to do it.  For more information about when callbacks are invoked during the deployment process, see [IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md).  
  
As with the other callbacks for `IXtfDeployCallback`, the deployment process continues if this callback returns `S_OK`. If this callback returns any `HRESULT` error code, then the deployment process is canceled immediately. Files that have already been transferred or deleted remain as they are, and partially transferred files are closed in their truncated form. Another deployment must be completed to ensure that all files on the console are complete and up to date.  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfDeployCallback Interface](../ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  