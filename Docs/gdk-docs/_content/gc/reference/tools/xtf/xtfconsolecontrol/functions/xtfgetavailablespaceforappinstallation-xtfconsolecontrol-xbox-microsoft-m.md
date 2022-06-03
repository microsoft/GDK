---
author: aablackm
title: XtfGetAvailableSpaceForAppInstallation
description: Gets the total number of bytes available on the specified storage device of a development console.
ms.assetid: M:Windows.Xbox.XtfGetAvailableSpaceForAppInstallation(LPCWSTR,LPCWSTR,UINT64@)
kindex: XtfGetAvailableSpaceForAppInstallation
ms.author: stevenpr
ms.topic: reference
edited: 06/29/2020
security: public
---

# XtfGetAvailableSpaceForAppInstallation
  
Gets the total number of bytes available on the specified storage device of a development console.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
HRESULT XtfGetAvailableSpaceForAppInstallation(
         LPCWSTR address,
         LPCWSTR storageName,
         UINT64 *bytes
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*address*  
Type: LPCWSTR  
  
\[in\] Address of the development console to check.  
  
*storageName*  
Type: LPCWSTR  
  
\[in\] The name of the storage device to check. The following values are allowed:  
  
| Value | Description |  
| ----- | ----------- |  
| `nullptr` | The default storage device. |  
| internal | The internal storage device. |  
  
*bytes*  
Type: UINT64\*  
  
\[out\] The total number of bytes available on the storage device specified in *storageName* for the development console specified in *address*.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, it returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This function gets the total number of bytes available on the specified storage device for a development console, allowing a tool developer writing a custom deployment tool for the console to check that there is enough space to install an app package before starting the install process. For more information about Xbox Tools Framework (XTF) tools, see [Command-line tools (NDA topic)](../../../../../tools-console/xbox-tools-and-apis/commandlinetools/commandlinetools.md).  
  
The following code sample shows how to calculate the space required for an app package.  
  
```cpp
#include <stdio.h>
#include <conio.h>
#include <Windows.h>
#include <xtfapi.h>

//Round up file sizes to the nearest 4K boundary to get a better estimate of the actual size of disk
#define ESTIMATED_FILE_SIZE_ON_DISK(fileSize) ((fileSize + ((4UI64 * 1024UI64) - 1)) & ~((4UI64 * 1024UI64) - 1))

//Size of the buffer (string) that we use to contain file/directory names - MAX_PATH + 1 for the terminating null
#define DIR_BUFFER_LENGTH (MAX_PATH + 1)

//Forward declaration of the function that figures out the game size on disk
UINT64 EstimateRequiredSpace(LPWSTR targetDir) ;

//Calculates whether there is enough disk space to deploy the game
//Returns an ERRORLEVEL:
//   0 - OK - Enough space
//   1 - ERROR - Not enough space
//   2 - ERROR - Other error
int wmain(int argc, wchar_t **argv)
{
    HRESULT hr              = S_OK;
    UINT64  availableBytes  = 0;
    UINT64  requiredBytes   = 0;
    LPWSTR  consoleAddress  = nullptr;
    LPWSTR  targetDir       = nullptr;

    if (argc != 3)
    {
        wprintf(L"\nUsage: %s <consoleAddress> <directory name>\n", argv[0]);
        return 2;
    }

    consoleAddress = argv[1];
    targetDir = argv[2];

    wprintf(L"\nTarget console is %s\n", consoleAddress);
    wprintf(L"\nTarget directory is %s\n\n",targetDir);

    hr = XtfGetAvailableSpaceForAppInstallation(consoleAddress, L"Internal", &availableBytes);
    if (hr != S_OK)
    {
        wprintf(L"\n\n*** Error %d", hr);
        return 2;
    }

    requiredBytes = EstimateRequiredSpace(targetDir);
    if (hr != S_OK)
    {
        wprintf(L"\n\n*** Error calculating size");
        return 2;
    }

    wprintf(L"*** Space available on console is %I64u \n", availableBytes);
    wprintf(L"*** Space required is %I64u \n", requiredBytes);

    if (requiredBytes > availableBytes)
    {
        wprintf(L"*** DO NOT DEPLOY \n");
        return 1;
    }

    wprintf(L"*** OK TO DEPLOY \n");
    return 0;

}

//Function that figures out the game size on disk
UINT64 EstimateRequiredSpace(LPWSTR targetDir)
{
    WIN32_FIND_DATA  ffd;
    LARGE_INTEGER    filesize;
    TCHAR            szDir[DIR_BUFFER_LENGTH];
    size_t           targetDirLength    = 0;
    HANDLE           hFind              = INVALID_HANDLE_VALUE;
    DWORD            dwError            = 0;
    UINT64           requiredBytes      = 0;

    // Check that the input path plus 3 is not longer than the size of szDir.
    // Three characters are for the "\*" plus NULL appended below.
    targetDirLength = wcsnlen_s(targetDir, DIR_BUFFER_LENGTH);

    if (targetDirLength + 3 > DIR_BUFFER_LENGTH)
    {
        wprintf(L"\nDirectory path is too long.\n");
        return -1;
    }

    // Create the search string for FindFile functions.
    wcscpy_s(szDir, DIR_BUFFER_LENGTH, targetDir);
    wcscat_s(szDir, DIR_BUFFER_LENGTH, L"\\*");

    // Find the first file in the directory.
    hFind = FindFirstFile(szDir, &ffd);
    if (INVALID_HANDLE_VALUE == hFind)
    {
        dwError = GetLastError();
        wprintf(L"\nError: FindFirstFile failed %d.\n", dwError);
        return -1;
    }

    // Iterate over all the files in the game collecting file size information
    do
    {
        //If is a directory drill into it
        if (ffd.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)
        {
            if (wcscmp(ffd.cFileName, L".") != 0 && wcscmp(ffd.cFileName, L"..") != 0) //There is probably a better way to do this...
            {
                size_t newDirLength = wcsnlen_s(ffd.cFileName, DIR_BUFFER_LENGTH);
                if (targetDirLength + 1 + newDirLength + 1 > DIR_BUFFER_LENGTH)
                {
                    wprintf(L"\nDirectory path is too long.\n");
                    return -1;
                }

                wcscpy_s(szDir, DIR_BUFFER_LENGTH, targetDir);
                wcscat_s(szDir, DIR_BUFFER_LENGTH, L"\\");
                wcscat_s(szDir, DIR_BUFFER_LENGTH, ffd.cFileName);
                UINT64 result = EstimateRequiredSpace(szDir);
                if (result == -1)
                {
                    return -1;
                }
                requiredBytes += result;
            }
        }
        else
        {
            filesize.LowPart = ffd.nFileSizeLow;
            filesize.HighPart = ffd.nFileSizeHigh;

            //Round up file sizes to the nearest 4K boundary to get a better estimate of the actual size of disk
            requiredBytes += ESTIMATED_FILE_SIZE_ON_DISK(filesize.QuadPart);
        }
    }
    while (FindNextFile(hFind, &ffd) != 0);

    dwError = GetLastError();
    if (dwError != ERROR_NO_MORE_FILES)
    {
        wprintf(L"\nError: FindNextFile failed %d.\n", dwError);
        return -1;
    }

    FindClose(hFind);
    return requiredBytes;
}  
```
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapi.h  
  
**Library:** XtfApi.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[XtfConsoleControl](../xtfconsolecontrol_members.md)  
[Xbox Tools Framework native API reference](../../atoc-xtf-native.md)  
  