---
author: M-Stahl
title: XGameStreamingGetClientIPAddress
description: Gets the IP address of the streaming client.
kindex: XGameStreamingGetClientIPAddress
ms.author: sashapir
ms.topic: reference
security: public
applies-to: pc-gdk
edited: 00/00/0000
---

# XGameStreamingGetClientIPAddress  

This API returns an IP address for the end user client device that is being used to stream content via the xbox game streaming service. This API and associated information should only be used when complying with microsoft standard privacy guidelines with respect to informing end users of the information collection. If you have any questions or concerns regarding the compliant usage of this API reach out to your Microsoft representative.

## Syntax  
  
```cpp
HRESULT XGameStreamingGetClientIPAddress(  
         XGameStreamingClientId client,  
         size_t ipAddressSize,  
         char* ipAddress  
)  
```  
  
### Parameters  
  
*client* &nbsp;&nbsp;\_In\_  
Type: XGameStreamingClientId  
  
The streaming client that is being queried.
  
*ipAddressSize* &nbsp;&nbsp;\_In\_  
Type: size_t  
  
The maximum size of the `ipAddress` buffer that is being provided. Typically the value of this should just be the **ClientIPAddressMaxBytes**.
  
*ipAddress* &nbsp;&nbsp;\_Out\_writes\_z\_(ipAddressSize)  
Type: char*  
  
The buffer that will populated with the IP address of the specified client.
  
### Return value
Type: HRESULT
  
Returns **S_OK** if successful; otherwise, returns an error code.

#### Potential Errors

| Error Code | Error Value | Reason for Error |
| --- | --- | --- | 
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs.
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later. |
| E_NOT_SUFFICIENT_BUFFER | 0x7A  | *ipAddress* is not large enough to hold the IP address and null terminating character. |


For a list of error codes, see [Error Codes](../../../errorcodes.md).  

## Remarks  

The `ipAddress` can be either an IPv4 address (1.2.3.4) or an IPv6 address (1:2:3:4:5:6:7:8). [ParseNetworkString](/windows/win32/api/iphlpapi/nf-iphlpapi-parsenetworkstring) can be used to parse the string if desired. 

The IP address returned is what the Xbox has received from the streaming client. If the streaming client is using a VPN or is behind a NAT then utilizing the IP address for geolocation may have issues.> [!NOTE]
> Private IP addresses may be returned during development or remote play scenarios where the streaming client and the Xbox are on the same private network.  


## Example

```C++
void GameStreamingClientManager::GetClientIPAddress(XGameStreamingClientId client)
{
    // Create the output buffer for the IP address
    char ipAddress[ClientIPAddressMaxBytes]; 

    // Get the IP address of the client 
    HRESULT hr = XGameStreamingGetClientIPAddress(client, ClientIPAddressMaxBytes, ipAddress); 

    if (SUCCEEDED(hr)) 
    { 
        // Game logic to use IP address
    } 
    else if (hr == E_GAMESTREAMING_CLIENT_NO_DATA) 
    { 
        // Game logic handles no data on client case 
    } 
    else 
    { 
        // In case of error just log and proceed as if there was no data 
        LogFormat(L"XGameStreamingGetClientIPAddress failed %x", hr); 
    } 
}
```

## Requirements  
  
**Header:** xgamestreaming.h  
**Library:** xgameruntime.lib  
**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  
  
## See also  
[XGameStreaming](../xgamestreaming_members.md)  
  
  