---
title: Manage and license downloadable content (DLC)
description: Describes scenarios for using durable products as downloadable content within your title and how to implement them.
kindex: Manage and license downloadable content (DLC)
author: joannaleecy
ms.author: timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Manage and license downloadable content (DLC)

Downloadable content (DLC) by definition consist of a product that, when purchases, gives the user a downloadable package.
These need to be independently licensed and mounted before its contents can be accessed.

DLC packages are licensable according to the content sharing behavior for each device, as outlined in the [Product sharing model for games](xstore-product-sharing-model-for-games.md).

New to Partner Center is a Durable product that does not have a package.
These are suitable for license-only products that do not contain any data usable by the game.
This will save on needing to create an empty package to submit to Partner Center and users will not need to download a package that takes space in storage but is not used.
See [How to use durables without a package](xstore-dwobs.md) for more information.

## Development workflow for DLC

Refer to [Downloadable content (DLC) packages](../../packaging/packaging-downloadable-content-dlc.md) to find out more about how to configure DLC content, including how to make the association with the base game through the MicrosoftGame.config.

There are three ways to install DLC:

1. [Loose DLC deploy](#1-loose-dlc-deploy)
2. [Locally install DLC package](#2-locally-install-dlc-package)
3. [Install DLC package from Store](#3-install-dlc-package-from-store)

### 1. Loose DLC deploy

Install the directory pointing to your loose DLC MicrosoftGame.config and asset files:

**Xbox:**

```cmd
> xbapp deploy <DLC directory>

Package Full Name: 41336MicrosoftATG.DLC1_2020.10.14.0_neutral__dspnxghe87tn0
The operation completed successfully.
```

**PC:**

```cmd
> wdapp register <DLC directory>  

Registered 41336MicrosoftATG.DLC1_2020.10.14.0_x64__dspnxghe87tn0
Copied temporary generated AppXManifest.xml file to C:\Users\<ntuser>\AppData\Local\Temp\41336MicrosoftATG.DLC1_2020.10.14.0_x64__dspnxghe87tn0_AppXManifest.xml
The operation completed successfully.
```

### 2. Locally install DLC package

Install the .xvc/.msixvc created by makepkg:

**Xbox:**

```cmd
> xbapp install <xvc package>  

12:16:21.800 Registered for streaming: 41336MicrosoftATG.DLC1_2020.10.14.0_neutral__dspnxghe87tn0_xs.xvc
12:16:22.645 Launch   0.00% Package   0.00%
12:16:32.650 Launch 100.00% Package 100.00%
12:16:32.651 Streaming install finished

The operation completed successfully.
```

**PC:**

```cmd
> wdapp install <.msixvc package>  

Starting installation. See the Microsoft Store app for further details.
Launch   100% Package   100%
Installed 100%.
Installed 41336MicrosoftATG.DLC1_2020.10.14.0_x64__dspnxghe87tn0
```

### 3. Install DLC package from Store

With a [test account](../../live/test-release/test-accounts/live-setup-testaccounts.md) signed into the dev sandbox, search for or direct link to the DLC product page in the Store app and install.

## Validate DLC installation

**Xbox:**

```cmd
> xbapp listdlc

Registered DLC by Package Full Name:

   41336MicrosoftATG.DLC1_2020.10.14.0_neutral__dspnxghe87tn0

The operation completed successfully.
```

**PC:**

```cmd
> wdapp listdlc

Registered DLC packages by Package Full Name:

41336MicrosoftATG.DLC1_2020.10.14.0_x64__dspnxghe87tn0

The operation completed successfully.
```

On PC, it is also possible to see the DLC installed for a particular title using `get-appxpackage` in PowerShell, note the **Dependencies** section:

```cmd
> get-appxpackage 41336MicrosoftATG.DownloadableContent

Name              : 41336MicrosoftATG.DownloadableContent
Publisher         : CN=A4954634-DF4B-47C7-AB70-D3215D246AF1
Architecture      : X64
ResourceId        :
Version           : 2020.10.14.0
PackageFullName   : 41336MicrosoftATG.DownloadableContent_2020.10.14.0_x64__dspnxghe87tn0
InstallLocation   : E:\Repos\ATGgit\gx_dev\Samples\Live\DownloadableContent\Gaming.Desktop.x64\Debug
IsFramework       : False
PackageFamilyName : 41336MicrosoftATG.DownloadableContent_dspnxghe87tn0
PublisherId       : dspnxghe87tn0
IsResourcePackage : False
IsBundle          : False
IsDevelopmentMode : True
NonRemovable      : False
Dependencies      : {41336MicrosoftATG.DLC1_2020.10.14.0_x64__dspnxghe87tn0}
IsPartiallyStaged : False
SignatureKind     : None
Status            : Ok
```

**SignatureKind** will denote what kind of package is installed, *None* for a locally built and installed package, *Store* for a package installed from the Store.

## Purchasing and installing DLC

Refer to the [Basic store operations](xstore-basic-store-operations.md) article to understand how to enumerate the catalog and offer the ability to purchase add-ons.
Add-ons products can be determined to be DLC by examining [`XStoreProduct`](../../reference/system/xstore/structs/xstoreproduct.md)`.hasDigitalDownload`.

In most cases, a DLC purchased for the first time will automatically be queued to download.
Optionally, the game can request a download manually with this code and create a monitor to track progress.

The **package identifier** is an opaque string that identifies a specific package.
It is unique per package but is different with each launched instance of the game, so it should not be stored for reuse beyond the current session.

You can use the following methods to obtain the package identifier for a package, depending on the scenario:
* After calling [XStoreDownloadAndInstallPackagesAsync](../../reference/system/xstore/functions/xstoredownloadandinstallpackagesasync.md) to download and install packages, you can obtain package identifiers for those packages by calling [XStoreDownloadAndInstallPackagesResult](../../reference/system/xstore/functions/xstoredownloadandinstallpackagesresult.md).
* You can obtain the package identifiers for packages that are already downloaded and installed by first calling [XPackageEnumeratePackages](../../reference/system/xpackage/functions/xpackageenumeratepackages.md), and then retrieving the package identifier from the [XPackageDetails](../../reference/system/xpackage/structs/xpackagedetails.md) structure passed back to your [XPackageEnumerationCallback](../../reference/system/xpackage/functions/xpackageenumerationcallback.md) callback function for each enumerated package.
* You can obtain the package identifier for the current game by calling [XPackageGetCurrentProcessPackageIdentifier](../../reference/system/xpackage/functions/xpackagegetcurrentprocesspackageidentifier.md).

```cpp
void Sample::StartDownload()
{
    auto async = new XAsyncBlock{};
    async->queue = m_asyncQueue;
    async->context = this;
    async->callback = [](XAsyncBlock* asyncBlockInner)
    {
        uint32_t count = 0;
        HRESULT hr = XStoreDownloadAndInstallPackagesResultCount(asyncBlockInner, &count);

        std::vector<char[XPACKAGE_IDENTIFIER_MAX_LENGTH]> packageIds(count);

        XStoreDownloadAndInstallPackagesResult(asyncBlockInner, count, packageIds.data());

        for(auto packageId : packageIds)
        {
            hr = XPackageCreateInstallationMonitor(
                packageId,  
                0,  
                nullptr,  
                1000,  
                m_asyncQueue,
                &m_pimHandle);

            if(SUCCEEDED(hr))
            {
                XTaskQueueRegistrationToken callbackToken;

                XPackageRegisterInstallationProgressChanged(
                    m_pimHandle,
                    this,
                    [](void* context, XPackageInstallationMonitorHandle pimHandle)
                    {
                        XPackageInstallationProgress progress;
                        XPackageGetInstallationProgress(pimHandle, &progress);

                        if(!progress.completed)
                        {
                            printf("%llu%% installed\n", static_cast<double>(progress.installedBytes) / static_cast<double>(progress.totalBytes);
                        }
                        else
                        {
                            XPackageCloseInstallationMonitorHandle(pimHandle);
                        }
                    }, &callbackToken);

                // Persist callbackToken to unregister upon completion
            }
        }
    }

    const char* storeIds[] =  
    {
        "9PLNMXRKNM4C",  
        "9PLNMXRKNM5D"
    };

    HRESULT hr = XStoreDownloadAndInstallPackagesAsync(storeContext, storeIds, ARRAYSIZE(storeIds), asyncBlock);
}
```

## Enumerating DLC packages

Regardless of how DLC are installed, the game will need to enumerate installed DLC prior to use.
This is where the package identifier will be usually first obtained.

```cpp
bool CALLBACK DlcCallback(void* context, const XPackageDetails* details)
{
    printf("DLC found: name: %s packageId: %s\n", details->displayName, details->packageIdentifier);

    return true;
}

void Sample::RefreshInstalledPackages()
{
    HRESULT hr = XPackageEnumeratePackages(
        XPackageKind::Content,  
        XPackageEnumerationScope::ThisAndRelated,  
        this,  
        DlcCallback);
}
```

## Detecting that a DLC package is installed

```cpp
void Sample::RegisterPackageInstalledEvent()
{
    XPackageRegisterPackageInstalled(
        m_asyncQueue,
        this,  
        [](void *context, const XPackageDetails *package)
        {
            printf("Package Installed event received: %s\n", package->displayName);
        },  
        &m_packageInstallToken);
}
```

See the [Troubleshooting](../getting-started/xstore-troubleshooting.md) section if this does not seem to be getting hit as expected.
This should be triggered regardless of which method the DLC package is installed from the three possibilities described above.

## Acquiring license for DLC

The base game needs to acquire the license for DLC to determine whether it should give the user access to its contents.
Failure to acquire the license might cause the game to terminate because the license could be invalidated by the platform for a number of reasons, such as lease expiration.

Games will typically be using Restrictive Licensing, which means that after the game has acquired the license for a package, access to the package will be locked for that device and instance of the product.
The game must release the license before another instance or device can acquire the access rights and license.
Talk to your Microsoft Account Representative to ensure your game is configured to use Restrictive Licensing (this is not configured in Partner Center).
See [Open and restrictive licensing](../pc-specific-considerations/xstore-open-and-restrictive-licensing.md) for more information about Restrictive Licensing.

Because the game must release the license, it's the game's responsibility to keep track of the licenses it has acquired and to release them when it no longer needs them or when it's terminated.
If the game fails to release a license, the license will be released automatically after a time-out period.

```cpp
void CALLBACK AcquireLicenseForPackageCallback(XAsyncBlock* async)
{
    XStoreLicenseHandle licenseHandle = nullptr;

    HRESULT hr = XStoreAcquireLicenseForPackageResult(
        async,
        &licenseHandle);

    if (FAILED(hr))
    {
        printf("Failed retrieve the license handle: 0x%x\n", hr);
        return;
    }

    bool isValid = XStoreIsLicenseValid(licenseHandle);

    printf("isValid: %s\n", isValid ? "true" : "false");

    hr = XStoreRegisterPackageLicenseLost(licenseHandle, m_asyncQueue, context,
       [](void *context)  
       {
           // Check if the license lost corresponded to any mounted DLC
           // If so, it is up to the game to determine an appropriate time
           // to unmount the DLC, e.g. after the current match is completed
       });
}

void Sample::AcquireLicenseForPackage(const char* packageIdentifier)
{
    auto async = new XAsyncBlock{};
    async->context = this;
    async->queue = m_asyncQueue;
    async->callback = AcquireLicenseForPackageCallback;
    asyncBlock->callback = AcquireLicenseForPackageCallback;

    HRESULT hr = XStoreAcquireLicenseForPackageAsync(
        m_storeContext,
        packageIdentifier,
        async);

    if (FAILED(hr))
    {
        delete async;
        return;
    }
}
```

## Mounting and unmounting DLC

Once the DLC license is successfully acquired, the DLC content can be mounted and accessed.

```cpp
void Sample::MountPackage(const char* packageIdentifier)
{
    XPackageMountHandle mountHandle = {};
    HRESULT hr = XPackageMount(packageIdentifier, &mountHandle);

    if (SUCCEEDED(hr))
    {
        // Access DLC goodness
    }
    else
    {
        XStoreCloseLicenseHandle(license);
        printf("Error mounting package: 0x%08x", hr);
    }
}
```

When unmounting, release all tokens and handles:

```cpp
void Sample::UnmountPackage(XPackageMountHandle mountHandle, XStoreLicenseHandle license, XTaskQueueRegistrationToken licenseLostToken)
{
    XStoreUnregisterPackageLicenseLost(license, licenseLostToken, false);

    XPackageCloseMountHandle(mountHandle);

    XStoreCloseLicenseHandle(license);
}
```

## Smart Delivery and DLC

It is possible for the Xbox Series X/S product to be able to license and mount DLC created for the Xbox One product.
This is a typical scenario when the DLC package does not actually contain data that is used by the game.
The only to check is if the ERA DLC's `AllowedProduct` ID in its package.appxmanifest, which is a GUID, matches the Legacy Xbox Product ID assigned to the product in Partner Center.  

If it doesn't, this may be a title migrated from XDP, and this will only function with packages downloaded from Store, as the Xbox Series X/S will be assigned the Xbox One's product ID.
For development purposes, see the note in the [Troubleshooting](../getting-started/xstore-troubleshooting.md) section.

## DLC from different products

It is possible to enumerate and use DLC from a different product.
For the title that wishes to use a DLC from a different product, assign a "Can sell and use" relationship to the DLC product in the **Product relationship setup** section in Partner Center.
The selection of available products will be limited to the publisher account.

## See also

[Commerce Overview](../commerce-nav.md)

[How to use a durable without a package](xstore-dwobs.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)