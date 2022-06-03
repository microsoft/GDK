---
author: M-Stahl
title: Dynamic chunk reordering
description: Describes how a title can change the order in which data is installed in response to user input.
kindex: Dynamic chunk reordering
ms.author: brianhud
ms.topic: conceptual
edited: '08/07/2019'
security: public
---

# Dynamic reordering of chunks 
   
  
When installation of a title begins, the installation system acquires and copies *chunks*, collections of files to be installed as a group, according to the default order defined by you. After the chunks that are required for the title to run have been installed, the title can provide a custom order for installation of the remaining chunks, which will be processed by the installation system before it returns to the default order of installation.  
   
  
In this manner, titles can control the acquisition order of content in response to a number of different situations or kinds of input from users. This dynamic reordering can minimize the time that users spend waiting for content to be installed, and it offers them a choice of what they want to have available first.  
   
  
After the installation order is changed, if chunks are required for gameplay or for use of the title, it can monitor the status of installation by using one of the methods described in [Streaming Installation: status](packaging-installstatus.md).  
   

## How to change the order in which chunks are installed  

In the following example code, a game needs access to a file soon to allow the user to keep playing. The **PrioritizeChunk** function is defined and checks the current installation status of a chunk.

* If the chunk isn't already installed, the function asks the streaming system to install that chunk first and then returns an installation monitor of the chunk's progress. 

* If the chunk is already installed, the function returns a null monitor.
  
```cpp   
template<> 
struct std::default_delete<XPackageInstallationMonitorHandle> { 
    typedef XPackageInstallationMonitorHandle pointer; 
    void operator()(XPackageInstallationMonitorHandle handle) const noexcept  
    {   
        XPackageCloseInstallationMonitorHandle(handle);  
    } 
}; 
 
HRESULT PrioritizeChunk(uint32_t chunkId, XPackageInstallationMonitorHandle* monitor) 
{ 
    char id[PACKAGE_IDENTIFIER_MAX_LENGTH]; 
 
    *monitor = nullptr; 
    RETURN_IF_FAILED(XPackageGetCurrentProcessPackageIdentifier(_countof(id), id)); 
 
    XPackageChunkSelector selector; 
    selector.type = XPackageChunkSelectorType::Chunk; 
    selector.chunk = chunkId; 
 
    XPackageInstallationMonitorHandle temp; 
    RETURN_IF_FAILED(XPackageCreateInstallationMonitor(id, 1, &selector, 1000, queue, &temp)); 
    std::unique_ptr<XPackageInstallationMonitorHandle> localMonitor(temp); 
 
    XPackageInstallationProgress progress; 
    XPackageGetInstallationProgress(localMonitor.get(), &progress); 
 
    if (!progress.completed) 
    { 
        RETURN_IF_FAILED(XPackageChangeChunkInstallOrder(id, 1, &selector)); 
        *monitor = localMonitor.release(); 
    } 
 
    return S_OK; 
} 
```        
  
  