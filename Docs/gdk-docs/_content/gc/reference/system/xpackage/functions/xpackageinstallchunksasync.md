---
author: M-Stahl
title: XPackageInstallChunksAsync
description: Starts installation of chunks.
kindex: XPackageInstallChunksAsync
ms.author: brianpe
ms.topic: reference
edited: 05/18/2019
quality: good
security: public
applies-to: pc-gdk
---

# XPackageInstallChunksAsync  

Starts the installation of chunks.  

## Syntax  
  
```cpp
HRESULT XPackageInstallChunksAsync(  
         const char* packageIdentifier,  
         uint32_t selectorCount,  
         XPackageChunkSelector* selectors,  
         uint32_t minimumUpdateIntervalMs,  
         bool suppressUserConfirmation,  
         XAsyncBlock* asyncBlock  
)  
```  
  
### Parameters  
  
*packageIdentifier* &nbsp;&nbsp;\_In\_z\_  
Type: char*  

  
A string that uniquely identifies the installed package on the disk. For more information about package identifiers, see [Manage and license downloadable content (DLC)](../../../../commerce/fundamentals/xstore-manage-and-license-optional-packages.md).    


*selectorCount* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The number of selectors in the *selectors* parameter.  


*selectors* &nbsp;&nbsp;\_In\_reads\_(selectorCount)  
Type: [XPackageChunkSelector*](../structs/xpackagechunkselector.md)  

  
An array of selectors that specify the chunks to be installed.   


*minimumUpdateIntervalMs* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

  
The interval between updates, in milliseconds.  

*suppressUserConfirmation* &nbsp;&nbsp;\_In\_  
Type: bool  

 
If the chunks to be installed exceed a preset size, then a confirmation prompt will be displayed. If *suppressUserConfirmation* is true, then no prompt will be displayed and the installation will progress as if the user accepted. This lets the game present its own UI. If the game uses this, it should also call [XPackageEstimateDownloadSize](xpackageestimatedownloadsize.md) to get the size that will be presented to the user. [XPackageEstimateDownloadSize](xpackageestimatedownloadsize.md) also returns a Boolean, to indicate whether the size is large enough that a prompt is to be displayed. If a download confirmation is needed, then the game must either show it by using its own UI or let **XPackageInstallChunks** show it.  


*asyncBlock* &nbsp;&nbsp;\_Inout\_  
Type: [XAsyncBlock*](../../xasync/structs/xasyncblock.md)  

  
An **XAsyncBlock** for monitoring the status of the asynchronous call.  


  
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