---
author: M-Stahl
title: XPackageInstallChunksResult
description: Retrieves the result of a call to [XPackageInstallChunksAsync](xpackageinstallchunksasync.md).
kindex: XPackageInstallChunksResult
ms.author: brianpe
ms.topic: reference
edited: 00/00/0000
quality: good
security: public
applies-to: pc-gdk
---

# XPackageInstallChunksResult  

Retrieves the result of a call to [XPackageInstallChunksAsync](xpackageinstallchunksasync.md).  

## Syntax  
  
```cpp
HRESULT XPackageInstallChunksResult(  
         XAsyncBlock* asyncBlock,  
         XPackageInstallationMonitorHandle* installationMonitor  
)  
```  
  
### Parameters  
  
*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
The **XAsyncBlock** passed to [XPackageInstallChunksAsync](xpackageinstallchunksasync.md).  


*installationMonitor* &nbsp;&nbsp;\_Out\_  
Type: XPackageInstallationMonitorHandle*  

  
On return, contains an installation monitor for the installation.  


  
### Return value
Type: HRESULT
  
HRESULT success or error code.    

## Remarks

[XPackageInstallChunks](xpackageinstallchunks.md) has an async variant. Installation of chunks might involve prompting the user to accept the download size.

This example shows how BigMaps are installed by using the asynchronous APIs: 

```cpp
void CALLBACK BigMapsInstallProgress(
    void* /* context */,
    XPackageInstallationMonitorHandle monitor)
{
    XPackageInstallationProgress progress;
    XPackageGetInstallationProgress(monitor, &progress);
    if (progress.completed)
    {
        printf("BigMaps Installed\n");
        XPackageCloseInstallationMonitorHandle(monitor);
    }
}

void CALLBACK BigMapsAsyncInstallComplete(XAsyncBlock* asyncBlock)
{
    XPackageInstallationMonitorHandle monitor;
    HRESULT hr = XPackageInstallChunksResult(asyncBlock, &monitor);
    delete asyncBlock;

    if (SUCCEEDED(hr))
    {
        XTaskQueueRegistrationToken token;
        if (FAILED(XPackageRegisterInstallationProgressChanged(
            monitor,
            nullptr,
            BigMapsInstallProgress, &token)))
        {
            XPackageCloseInstallationMonitorHandle(monitor);
        }
    }
}

HRESULT InstallBigMapsAsync(XTaskQueueHandle queue)
{
    char id[XPACKAGE_IDENTIFIER_MAX_LENGTH];
    HRESULT hr = XPackageGetCurrentProcessPackageIdentifier(_countof(id), id);
    if (FAILED(hr)) return hr;

    XPackageChunkSelector selector;
    selector.type = XPackageChunkSelectorType::Tag;
    selector.tag = "BigMaps";

    XAsyncBlock* asyncBlock = new (std::nothrow) XAsyncBlock{};
    asyncBlock->callback = BigMapsAsyncInstallComplete;
    asyncBlock->queue = queue;

    hr = XPackageInstallChunksAsync(
        id, 1, &selector, 1000,
        false, asyncBlock);

    if (FAILED(hr))
    {
        delete asyncBlock;
    }

    return hr;
}
```  

## Requirements  
  
**Header:** XPackage.h
  
**Library:** xgameruntime.lib  
  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XPackage](../xpackage_members.md)  
[Streaming Installation and Intelligent Delivery](../../../../packaging/overviews/streaming_install-intelligent_delivery.md)     
[XPackageInstallChunks](xpackageinstallchunks.md)
  
  