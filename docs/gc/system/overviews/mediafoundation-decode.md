---
author: M-Stahl
title: Media Foundation transform decoding
description: Describes how to implement H.264 hardware decoding by using the Source Reader in the Xbox One Game OS.
ms.assetid: 70cc1a26-1dc7-dcb4-c4bc-e819ab23d7cf
kindex:
- Media Foundation Transform Decoding
- MFT decode
- H.264/H.265 decode
ms.author: kaslatt
ms.topic: conceptual
edited: 04/08/2020
security: public
---

# Media Foundation transform decoding
   
  
The Xbox Game Development Kit (GDK) supports hardware and software decoding of H264 and HEVC files/data streams via the Media foundation Source Reader Interface. Compared to the desktop version of [Source Reader](/windows/win32/medfound/source-reader) the Xbox GDK version only supports a subset of the desktop feature set.

## Supported codecs

### Hardware decode

| Codec | Max Resolution/Frame rate (fps) | Profiles | Console Type |
| ---| :---: | :--- | :--- |
| H264  | upto 1080p/30 | Baseline/Main/High |All Xbox consoles
| HEVC | upto 1080p/30 | Main/Main10 |Xbox One S, Xbox One X|
| HEVC | upto 4k/30 | Main/Main10 |Xbox Series S, Xbox Series X |


### Software decode
H264 software decode is supported upto 4096x2160@30 fps (level 5.2). However, note that performance will be dependent on the console type with the Xbox Series S/X able to decode > 1080p resolutions comfortably. 

HEVC software decode is supported as well upto 1920x1080@30 fps with varying degree of performance depending on the console type. However, we recommend using hardware decode for HEVC since it is significantly more CPU intensive when compared to H264 software decode.


## Decoding Media Data
Decoding media data using the Source Reader involves the following steps.   
   
   1. [Create the Source Reader](#create)  
   1. [Use hardware (or software) acceleration](#hardware_accel)
   1. [Enumerate the output formats](#enum_output_format)
   1. [Set the output formats](#set_output_format)
   1. [Process media data](#process)
   1. [Synchronization with graphics (or other D3D12) command queues](#synchronize)
   1. [Format and colorspace conversions](#videoprocess)

Please refer to the Mp4Reader sample provided with GDK samples for reference code (the code snippets here are from Mp4reader to make it easier to follow along).

<a id="create"></a>

## Step 1: Create the Source Reader  
   
  
To create an instance of the Source Reader, call the [MFCreateSourceReaderFromByteStream](https://msdn.microsoft.com/library/dd388106(v=vs.85).aspx) function, which takes a pointer to a byte stream. This function also uses the Source Resolver to create the media source.   
  
The `pByteStream` parameter of the `MFCreateSourceReaderFromByteStream` function takes a pointer to an [IMFAttributes](https://msdn.microsoft.com/library/ms704598(v=vs.85).aspx) interface that's used to set various options on the Source Reader (as described in the reference topics for the `IMFAttributes::Set` methods). Setting this parameter to `nullptr` uses the default behavior, which we don't recommend. At a minimum, the Source Reader should always specify the `MF_SOURCE_READER_D3D_MANAGER` attribute to enable hardware-accelerated decoding. The `MFCreateSourceReaderFromByteStream` function outputs a pointer to an [IMFSourceReader](https://msdn.microsoft.com/library/dd374655(v=vs.85).aspx) interface.

One can specify a m3u8 or a Smoothstreaming manifest URL as well as input to create the source reader as well for basic HLS/Smoothstreaming support. For Mp4 file input, there are some restrictions:
1. AAC-LC audio and AC3 are the only audio formats supported.
2. For HEVC data, the format tag must be 'hvc1' ('hev1' is not supported).

**C++**  
```cpp
    // Initialize the Media Foundation platform.
    DX::ThrowIfFailed(MFStartup(MF_VERSION));

    // Call the MFCreateDXGIDeviceManager function to create the Direct3D device manager
    DX::ThrowIfFailed(MFCreateDXGIDeviceManager(&uResetToken, &pDXVAManager));

    // Call the MFResetDXGIDeviceManagerX function with a pointer to the Direct3D device
    DX::ThrowIfFailed(MFResetDXGIDeviceManagerX(pDXVAManager.Get(), device, uResetToken));

    // Create an attribute store
    DX::ThrowIfFailed(pDXVAManager.AsIID(__uuidof(IUnknown), &punkDeviceMgr));
    DX::ThrowIfFailed(MFCreateAttributes(&pMFAttributes, 3));
    DX::ThrowIfFailed(pMFAttributes->SetUnknown(MF_SOURCE_READER_D3D_MANAGER, punkDeviceMgr.Get()));
    DX::ThrowIfFailed(pMFAttributes->SetUINT32(MF_READWRITE_ENABLE_HARDWARE_TRANSFORMS, TRUE));
    DX::ThrowIfFailed(pMFAttributes->SetUINT32(MF_SOURCE_READER_DISABLE_DXVA, FALSE));
    // Don't set the MF_SOURCE_READER_ENABLE_VIDEO_PROCESSING MFAttribute to TRUE. It is too slow.

    // Create the source reader.
    DX::ThrowIfFailed(MFCreateSourceReaderFromURL(INPUT_FILE_PATH, pMFAttributes.Get(), &m_pReader));

```
  
<a id="hardware_accel"></a>

   

## Step 2: Use hardware (or software) acceleration
   
  
The Source Reader is compatible with Microsoft DirectX Video Acceleration (DXVA) 2.0 for hardware-accelerated video decoding. To use DXVA with the Source Reader, perform the following steps.   
   
   1. Call the [MFCreateDXGIDeviceManager](/windows/desktop/api/mfapi/nf-mfapi-mfcreatedxgidevicemanager) function to create the Direct3D device manager. This function takes a pointer to the [IMFDXGIDeviceManager](/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager) interface.   
   1. Call the `MFResetDXGIDeviceManagerX` method with a pointer to the Direct3D device.   
   1. Create an attribute store by calling the [MFCreateAttributes](/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes) function.  
   1. Call [SetUnknown](/windows/desktop/api/mfobjects/nf-mfobjects-imfattributes-setunknown) to set the `MF_SOURCE_READER_D3D_MANAGER` attribute to the [IMFDXGIDeviceManager](/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager) interface.
   1. Also enable `MF_READWRITE_ENABLE_HARDWARE_TRANSFORMS` and set `MF_SOURCE_READER_DISABLE_DXVA` to FALSE.
   1. Create the Source Reader. Pass the attribute store in the `pAttributes` parameter of the creation function.  


### Software Decode

To enable software decoding, just set `MF_SOURCE_READER_DISABLE_DXVA` to TRUE. With software decode, one can configure a bunch of other parameters as shown below for fine grained thread control on the video decoder such as the Thread Affinity Mask, the number of worker threads and the thread priority levels.

**C++**
```cpp
    // Set some threading parameters for software decode
    Microsoft::WRL::ComPtr<IMFTransform> transform;
    Microsoft::WRL::ComPtr<IMFAttributes> attributes;
    DX::ThrowIfFailed(m_pReader->GetServiceForStream(MF_SOURCE_READER_FIRST_VIDEO_STREAM, GUID_NULL, IID_PPV_ARGS(transform.GetAddressOf())));
    transform->GetAttributes(attributes.GetAddressOf());
    attributes->SetUINT32(CODECAPI_AVDecVideoThreadAffinityMask, 0x0F); // Use the first 4 cores. Input value is the same as Win32 SetThreadAffinityMask
    attributes->SetUINT32(CODECAPI_AVDecNumWorkerThreads, 0x4); // 4 threads
    attributes->SetUINT32(CODECAPI_AVPriorityControl, THREAD_PRIORITY_HIGHEST); // Set thread priority. Same as Win32 SetThreadPriority for priorty levels
```




<a id="enum_output_format"></a>

   

## Step 3: Enumerate the output formats   
   
  
Every media source has at least one stream. For example, a video file might contain a video stream and an audio stream. The format of each stream is described by using a media type, represented by the [IMFMediaType](https://msdn.microsoft.com/library/ms704850(v=vs.85).aspx) interface. For more information about media types, see [Media Types](https://msdn.microsoft.com/library/ms698724(v=vs.85).aspx). You must examine the media type to understand the format of the data that you get from the Source Reader.  
   
  
Initially, every stream has a default format, which you can find by calling the [IMFSourceReader::GetCurrentMediaType](https://msdn.microsoft.com/library/dd374660(v=vs.85).aspx) method.  
   
  
For each stream, the media source offers a list of possible media types for that stream. The number of types depends on the source. If the source represents a media file, there's typically only one type per stream. A webcam, on the other hand, might be able to stream video in several different formats. In that case, the app can select which format to use from the list of media types.  
   
  
To get one of the media types for a stream, call the [IMFSourceReader::GetNativeMediaType](https://msdn.microsoft.com/library/dd374661(v=vs.85).aspx) method. This method takes two index parameters: the index of the stream and an index into the list of media types for the stream. To enumerate all the types for a stream, increment the list index while keeping the stream index constant. When the list index goes out of bounds, `GetNativeMediaType` returns `MF_E_NO_MORE_TYPES`, as shown in the following code.   
   

**C++**  
```cpp
HRESULT EnumerateTypesForStream(IMFSourceReader *pReader, DWORD dwStreamIndex)
{
  HRESULT hr = S_OK;
  DWORD dwMediaTypeIndex = 0;

  while (SUCCEEDED(hr))
  {
    IMFMediaType *pType = NULL;
    hr = pReader->GetNativeMediaType(dwStreamIndex, dwMediaTypeIndex, &pType);
    if (hr == MF_E_NO_MORE_TYPES)
    {
      hr = S_OK;
      break;
    }
    else if (SUCCEEDED(hr))
    {
      // Examine the media type here.

      pType->Release();
    }
    ++dwMediaTypeIndex;
  }
  return hr;
}  
```
   
  
To enumerate the media types for every stream, increment the stream index. When the stream index goes out of bounds, [IMFSourceReader::GetNativeMediaType](/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-getnativemediatype) returns `MF_E_INVALIDSTREAMNUMBER`.   
  
<a id="set_output_format"></a>

   

## Step 4: Set the output formats  
   
  
To decode the stream, create a new media type that describes the uncompressed format that you want. In the case of the decoder, create the media type as follows.   
   
   1. Call [MFCreateMediaType](/windows/desktop/api/mfapi/nf-mfapi-mfcreatemediatype) to create a new media type.   
   1. Set the [MF_MT_MAJOR_TYPE](/windows/desktop/medfound/mf-mt-major-type-attribute) attribute to specify audio or video.   
   1. Set the [MF_MT_SUBTYPE](/windows/desktop/medfound/mf-mt-subtype-attribute) attribute to specify the subtype of the decoding format. For available subtypes, see [Audio Subtype GUIDs](https://msdn.microsoft.com/library/aa372553(v=vs.85).aspx) and [Video Subtype GUIDs](https://msdn.microsoft.com/library/aa370819(v=vs.85).aspx). On the Xbox, we only support NV12 for 8-bit video decode and P010 for 10-bit video decode.
   1. Call [SetCurrentMediaType](/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype).   

   
  
The Source Reader will automatically load the decoder. To get the complete details of the decoded format, call [IMFMediaTypeHandler::GetCurrentMediaType](/windows/desktop/api/mfidl/nf-mfidl-imfmediatypehandler-getcurrentmediatype) after the call to [SetCurrentMediaType](/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentmediatype). The following code configures the video stream for NV12 and the audio stream for floating point audio.   
   

**C++**  
```cpp
HRESULT ConfigureDecoder(IMFSourceReader *pReader, DWORD dwStreamIndex)
{
    ComPtr<IMFMediaType> pNativeType;
    ComPtr<IMFMediaType> pType;
    GUID majorType, subtype;

    // Find the native format of the stream.
    DX::ThrowIfFailed(pReader->GetNativeMediaType(dwStreamIndex, 0, &pNativeType));

    // Find the major type.
    DX::ThrowIfFailed(pNativeType->GetGUID(MF_MT_MAJOR_TYPE, &majorType));

    // Define the output type.
    DX::ThrowIfFailed(MFCreateMediaType(&pType));

    DX::ThrowIfFailed(pType->SetGUID(MF_MT_MAJOR_TYPE, majorType));

    // Select a subtype.
    if (majorType == MFMediaType_Video)
    {
        // NV12 for 8 bit (or P010 for 10 bit)are the only supported output types of Xbox One HW decoders
        subtype = MFVideoFormat_NV12;
    }
    else if (majorType == MFMediaType_Audio)
    {
        subtype = MFAudioFormat_Float;
    }
    else
    {
        // Unrecognized type. Skip.
        return;
    }

    DX::ThrowIfFailed(pType->SetGUID(MF_MT_SUBTYPE, subtype));

    // Set the uncompressed format.
    DX::ThrowIfFailed(pReader->SetCurrentMediaType(dwStreamIndex, nullptr, pType.Get()));
}  
```
  
<a id="process"></a>

   

## Step 5: Process the media data  
   
  
To get media data from the source, call the [IMFSourceReader::ReadSample](https://msdn.microsoft.com/library/dd374665(v=vs.85).aspx) method, as shown in the following code.   
   

**C++**  
```cpp
DWORD streamIndex, flags;
LONGLONG llTimeStamp;

hr = pReader->ReadSample(
  MF_SOURCE_READER_ANY_STREAM,    // Stream index.
  0,                              // Flags.
  &streamIndex,                   // Receives the actual stream index.
  &flags,                         // Receives status flags.
  &llTimeStamp,                   // Receives the time stamp.
  &pSample                        // Receives the sample or nullptr.
  );  
```
   
  
The first parameter is the index of the stream that you want to get data for. You can also specify `MF_SOURCE_READER_ANY_STREAM` to get the next available data from any stream. The second parameter contains optional flags. For a list of these flags, see [MF_SOURCE_READER_CONTROL_FLAG](https://msdn.microsoft.com/library/dd375771(v=vs.85).aspx). The third parameter receives the index of the stream that actually produces the data. You will need this information if you set the first parameter to `MF_SOURCE_READER_ANY_STREAM`. The fourth parameter receives status flags, indicating various events that can occur while reading the data, such as format changes in the stream. For a list of status flags, see [MF_SOURCE_READER_FLAG](https://msdn.microsoft.com/library/dd375773(v=vs.85).aspx).  
   
  
If the media source is able to produce data for the requested stream, the last parameter of [ReadSample](https://msdn.microsoft.com/library/dd374665(v=vs.85).aspx) receives a pointer to the [IMFSample](https://msdn.microsoft.com/library/ms702192(v=vs.85).aspx) interface of a media sample object. Use the media sample to:  
   
   *  Get a pointer to the media data.  
   *  Get the presentation time and sample duration.  
   *  Get attributes that describe interlacing, field dominance, and other aspects of the sample.  

   
  
The contents of the media data depend on the format of the stream. For an uncompressed video stream, each media sample contains a single video frame. For an uncompressed audio stream, each media sample contains a sequence of audio frames.  
   
  
The [ReadSample](https://msdn.microsoft.com/library/dd374665(v=vs.85).aspx) method can return `S_OK` and yet not return a media sample in the `pSample` parameter. For example, when you reach the end of the file, `ReadSample` sets the `MF_SOURCE_READERF_ENDOFSTREAM` flag in `dwFlags` and sets `pSample` to `nullptr`. In this case, the `ReadSample` method returns `S_OK` because no error has occurred, even though the `pSample` parameter is set to `nullptr`. Therefore, always check the value of `pSample` before you dereference it.  
   
  
Video samples require some addtional handling after the call to [ReadSample](https://msdn.microsoft.com/library/dd374665(v=vs.85).aspx). This includes determining the video width and height from the [MF_MT_FRAME_SIZE](/windows/win32/medfound/mf-mt-frame-size-attribute) or the [MF_MT_MINIMUM_DISPLAY_APERTURE](/windows/win32/medfound/mf-mt-minimum-display-aperture-attribute) attributes and handling synchronization. 

The following code snippet calls `ReadSample` and then checks the information returned by the method for the first video stream. Please refer to the Mp4reader sample on how to handle audio stream data. The next section will cover the synchronization required for hardware video decode operations.

**C++**  
```cpp
  // Retreive sample from source reader
    ComPtr<IMFSample> pOutputSample;

    hr = m_pReader->ReadSample(
        uint32_t(MF_SOURCE_READER_FIRST_VIDEO_STREAM), // Stream index.
        0,                                             // Flags.
        &streamIndex,                                  // Receives the actual stream index. 
        &dwStreamFlags,                                // Receives status flags.
        &llTimestamp,                                  // Receives the time stamp.
        &pOutputSample                                 // Receives the sample or nullptr. If this parameter receives a non-NULL pointer, the caller must release the  
                                                        // interface.
    );

    if (SUCCEEDED(hr))
    {
        if (dwStreamFlags & MF_SOURCE_READERF_ENDOFSTREAM)
        {
            m_videoDone = true;
        }

        if (dwStreamFlags & MF_SOURCE_READERF_NATIVEMEDIATYPECHANGED)
        {
            // The format changed. Reconfigure the decoder.
            ConfigureSourceReaderOutput(m_pReader.Get(), streamIndex);
        }

        if (pOutputSample)
        {
            if (m_videoWidth == 0 || m_videoHeight == 0
                || (dwStreamFlags & MF_SOURCE_READERF_NATIVEMEDIATYPECHANGED) || (dwStreamFlags & MF_SOURCE_READERF_CURRENTMEDIATYPECHANGED))
            {
                // Update video width and height
                ComPtr<IMFMediaType> pMediaType;

                if (SUCCEEDED(m_pReader->GetCurrentMediaType(uint32_t(MF_SOURCE_READER_FIRST_VIDEO_STREAM), &pMediaType)))
                {
                    MFVideoArea videoArea = {};
                    if (SUCCEEDED(pMediaType->GetBlob(MF_MT_MINIMUM_DISPLAY_APERTURE, (uint8_t*)&videoArea, sizeof(MFVideoArea), nullptr)))
                    {
                        m_videoWidth = UINT(videoArea.Area.cx);
                        m_videoHeight = UINT(videoArea.Area.cy);
                    }
                    else
                    {
                        DX::ThrowIfFailed(MFGetAttributeSize(pMediaType.Get(), MF_MT_FRAME_SIZE, &m_videoWidth, &m_videoHeight));
                    }
                }
            }

            if (m_pOutputVideoSample)
            {
                DX::ThrowIfFailed(MFD3D12GpuSignalSampleFree(m_pVideoRender->GetVideoProcessCommandQueue(), m_pOutputVideoSample.Get()));
                m_pOutputVideoSample.Reset();
            }

            // The output buffer may still used by decoding ( although decode returns the buffer from CPU), put a wait single on the GPU to wait to the decoding to complete
            DX::ThrowIfFailed(MFD3D12GpuWaitForSampleReady(m_pVideoRender->GetVideoProcessCommandQueue(), pOutputSample.Get()));

            m_pOutputVideoSample = pOutputSample;
            ++m_numberOfFramesDecoded;
        }
    }
```

Seeking is supported via the [IMFSourceReader::SetCurrentPosition](/windows/win32/api/mfreadwrite/nf-mfreadwrite-imfsourcereader-setcurrentposition) API.

**C++**
```cpp
    PROPVARIANT position;
    position.vt = VT_I8;
    position.hVal.QuadPart = hnsPosition;
    m_pReader->SetCurrentPosition(GUID_NULL, position);
```

<a id="synchronize"></a>

## Step 6: Synchronization with Graphics (or other D3D12 command Queues) 
   
  
In the Xbox GDK, it is up to the caller to ensure that video samples from the hardware decoder are correctly synchronized with the graphics or other D3D12 queues.  There are 2 new APIs which help with this:
1. `EnqueueResourceReadyWait` will add a wait in the passed in command queue to ensure that it waits for the decode to be completed before processing the sample. This has to be called right after `ReadSample` and before other queue start processing the video sample.
2. `EnqueueResourceRelease` will ensure that the decoder waits on the any pending operations in the passed in command queue (it will ask the command queue to Signal an internal fence). This has to be called after all processing has finished on the other command queues to return the sample back to the pool for reuse.

**C++**
```cpp
    // For D3D12, application must call MFD3D12GpuSignalForSampleFree after it has finished processing the video sample
    HRESULT MFD3D12GpuSignalSampleFree(
        _In_ ID3D12CommandQueue* pCmdQueue,
        _In_ IMFSample* pVideoSample)
    {       
        ComPtr<IMFMediaBuffer> pBuffer;
        HRESULT hr = pVideoSample->GetBufferByIndex(0, &pBuffer);
        if (SUCCEEDED(hr))
        {
            ComPtr<IMFDXGIBuffer>  pDXGIBuffer;
            hr = pBuffer->QueryInterface<IMFDXGIBuffer>(&pDXGIBuffer);
            if (SUCCEEDED(hr))
            {
                ComPtr<IMFD3D12SynchronizationObjectCommands> pMFSyncObj;
                hr = pDXGIBuffer->GetUnknown(MF_D3D12_SYNCHRONIZATION_OBJECT, IID_PPV_ARGS(&pMFSyncObj));
                if (SUCCEEDED(hr))
                {
                    //GPU signal the sample can be freed for decoding
                    hr = pMFSyncObj->EnqueueResourceRelease(pCmdQueue);
                }
            }
        }
        return hr;
    }

    // For D3D12, application must call MFD3D12GpuWaitForSampleReady to make sure the GPU waits for decode to complete before process the sample using GPU code
    HRESULT MFD3D12GpuWaitForSampleReady(
        _In_ ID3D12CommandQueue* pCmdQueue,
        _In_ IMFSample* pVideoSample)
    {
        ComPtr<IMFMediaBuffer> pBuffer;
        HRESULT hr = pVideoSample->GetBufferByIndex(0, &pBuffer);
        if (SUCCEEDED(hr))
        {
            ComPtr<IMFDXGIBuffer> pDXGIBuffer;
            hr = pBuffer->QueryInterface<IMFDXGIBuffer>(&pDXGIBuffer);
            if (SUCCEEDED(hr))
            {
                ComPtr<IMFD3D12SynchronizationObjectCommands> pMFSyncObj;
                hr = pDXGIBuffer->GetUnknown(MF_D3D12_SYNCHRONIZATION_OBJECT, IID_PPV_ARGS(&pMFSyncObj));
                if (SUCCEEDED(hr))
                {
                    // GPU wait until the decoding completed
                    hr = pMFSyncObj->EnqueueResourceReadyWait(pCmdQueue);
                }
            }
        }
        return hr;
    }
``` 

 Software decode does not require these synchronization calls. The sample returned from `ReadSample` will always have entire complete decoded frame.

<a id="videoprocess"></a>

## Step 7: Format and colorspace conversions
Colorspace conversions and format conversions of the decoded output can now be performed using the D3D12 Video Processor APIs. The Xbox GDK only supports YUV (`DXGI_FORMAT_NV12`/`DXGI_FORMAT_P010`) to RGB (`DXGI_FORMAT_R10G10B10A2_UNORM`/`DXGI_FORMAT_R8G8B8A8_UNORM` including other 8-bit RGB/typeless variants) format conversions.

 In addition to YUV-RGB format conversions, one can use the video processor to do colorspace conversions at the same time if required. Supported conversions include:

1. BT.2020 to BT.709
1. BT.709 to BT.2020 

Refer to the [DXGI_COLOR_SPACE_TYPE](/windows/win32/api/dxgicommon/ne-dxgicommon-dxgi_color_space_type) enums for the appropriate colorspace types.

### Creating a video processor

Call [ID3D12VideoDevice::CreateVideoProcessor](/windows/desktop/api/d3d12video/nf-d3d12video-id3d12videodevice-createvideoprocessor) to create an instance of the `ID3D12VideoProcessor`. The video processor holds state for a video processing session, including required intermediate memory, cached processing data, or other temporary working space. The video processor creation arguments specify which operations are performed or are available at `ID3D12VideoProcessCommandList1::ProcessFrames` time. 

**C++**
```cpp
    D3D12_VIDEO_PROCESS_INPUT_STREAM_DESC inputStreamDesc{};
    inputStreamDesc.Format = DXGI_FORMAT_NV12;
    inputStreamDesc.ColorSpace = DXGI_COLOR_SPACE_YCBCR_STUDIO_G22_LEFT_P709;
    inputStreamDesc.SourceSizeRange = D3D12_VIDEO_SIZE_RANGE{ g_MaxVideoWidth, g_MaxVideoHeight, 1, 1 };
    inputStreamDesc.DestinationSizeRange = D3D12_VIDEO_SIZE_RANGE{ g_MaxVideoWidth, g_MaxVideoHeight, 1, 1 };

    D3D12_VIDEO_PROCESS_OUTPUT_STREAM_DESC outputStreamDesc{};
    outputStreamDesc.Format = DXGI_FORMAT_R8G8B8A8_UNORM;
    outputStreamDesc.ColorSpace = DXGI_COLOR_SPACE_RGB_STUDIO_G22_NONE_P709;

    hr = pVideoDevice->CreateVideoProcessor(0, &outputStreamDesc, 1, &inputStreamDesc, IID_GRAPHICS_PPV_ARGS(m_pVideoProcessor.GetAddressOf()));
```

The video processor can be used to record commands from multiple command lists, but may only be associated with one command list at a time. The application is responsible for synchronizing access to the video processor. The application must also record video processing commands against the video processor in the order that they are executed on the GPU.

### Querying the output texture from an IMFSample

The following code snippet shows how to query for the decoded D3D12 output texture from an IMFSample for use in video processing or other graphics operations

**C++**
```cpp
    IMFSample* pSample = pOutputDecodedSample;
    HRESULT hr = pSample->GetBufferCount(&bufferCount);
    if (FAILED(hr))
        return hr;
    assert(bufferCount == 1);

    ComPtr<IMFMediaBuffer> spBuffer;
    hr = pSample->GetBufferByIndex(0, spBuffer.GetAddressOf());
    if (FAILED(hr))
        return hr;

    ComPtr<IMFDXGIBuffer> spDXGIBuffer;
    hr = spBuffer.Get()->QueryInterface(spDXGIBuffer.GetAddressOf());
    if (FAILED(hr))
        return hr;

    ComPtr<ID3D12Resource> spResourceTexture;
    hr = spDXGIBuffer->GetResource(IID_GRAPHICS_PPV_ARGS(spResourceTexture.GetAddressOf()));
    if (FAILED(hr))
        return hr;

    UINT32 uiIndexSrc;
    hr = spDXGIBuffer->GetSubresourceIndex(&uiIndexSrc);
    if (FAILED(hr))
        return hr;
```

### Video processor command execution
Creating and executing video processor commands uses the standard D3D12 work submission model using the `D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS` command list/queue/allocator. The sample code below shows how to create them:

**C++**
```cpp
HRESULT hr = pDevice->CreateCommandAllocator(D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS, IID_GRAPHICS_PPV_ARGS(m_pVpCommandAllocator.GetAddressOf()));
    if (FAILED(hr))
        return hr;

    D3D12_COMMAND_QUEUE_DESC descQueue{};
    descQueue.Type = D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS;
    descQueue.Priority = 0;
    descQueue.Flags = D3D12_COMMAND_QUEUE_FLAG_NONE;

    hr = pDevice->CreateCommandQueue(&descQueue, IID_GRAPHICS_PPV_ARGS(m_pVpCommandQueue.GetAddressOf()));
    if (FAILED(hr))
        return hr;

    hr = pDevice->CreateCommandList(0, D3D12_COMMAND_LIST_TYPE_VIDEO_PROCESS, m_pVpCommandAllocator.Get(), nullptr, __uuidof(ID3D12CommandList), reinterpret_cast<void**>(m_pVpCommandList.GetAddressOf()));
    if (FAILED(hr))
        return hr;
		
```

All input and output arguments for the video processing operations are organized into an input argument structure, [D3D12_VIDEO_PROCESS_INPUT_STREAM_ARGUMENTS](/windows/desktop/api/d3d12video/ns-d3d12video-d3d12_video_process_input_stream_arguments), and an output argument structure, [D3D12_VIDEO_PROCESS_OUTPUT_STREAM_ARGUMENTS](/windows/win32/api/d3d12video/ns-d3d12video-d3d12_video_process_output_stream_arguments). The application must call [ID3D12VideoProcessCommandList::ProcessFrames](/windows/win32/api/d3d12video/nf-d3d12video-id3d12videoprocesscommandlist-processframes) to record the video processing operation it wants to execute.

When the command list is recorded, call `ID3D12CommandQueue::ExecuteCommandLists` on the video processor command queue to submit the frame processing to the GPU. Note on the Xbox Series S/X one needs to synchronize access to the video processor command queue and the graphics command queue as multithreaded access may cause unexpected behaviour.

