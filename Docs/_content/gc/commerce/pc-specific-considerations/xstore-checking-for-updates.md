---
title: Checking for updates
description: Describes how PC titles should check for updates.
kindex: Checking for updates on PC
author: joannaleecy
ms.author: timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Checking for updates

On PC, it is required for the title to check for and apply updates if it is critical for the game to be up to date when launched.
This is often important when the game involves multiplayer features where it is important for the connected game clients to all have the same functionality.

Windows only reports the availability of updates in the Microsoft Store or Xbox apps, but unlike Xbox, it allows the game to launch even if there is and update available.

## Check for updates

The title can and should check for updates using [XStoreQueryGameAndDlcPackageUpdatesAsync](../../reference/system/xstore/functions/xstorequerygameanddlcpackageupdatesasync.md) as shown in the following example code:

```cpp
void CALLBACK QueryGameAndDlcPackageUpdatesCallback(XAsyncBlock* async)
{
    auto pThis = reinterpret_cast<Sample*>(async->context);

    unsigned int numUpdates = 0;

    HRESULT hr = XStoreQueryGameAndDlcPackageUpdatesResultCount(async, &numUpdates);

    if (SUCCEEDED(hr))
    {
        if (numUpdates > 0)
        {
            std::vector<XStorePackageUpdate> packages(numUpdates);

            hr = XStoreQueryGameAndDlcPackageUpdatesResult(async, numUpdates, packages.data());

            if (SUCCEEDED(hr))
            {
                for (auto &package : packages)
                {
                    printf("Update available %s\n", package.packageIdentifier);
                }
            }
        }
        else
        {
            printf("No updates are available\n");
        }
    }

    delete async;
}

void Sample::CheckForUpdates()
{
    auto asyncBlock = new XAsyncBlock{};
    asyncBlock->context = this;
    asyncBlock->queue = m_asyncQueue;
    asyncBlock->callback = QueryGameAndDlcPackageUpdatesCallback;

    if (FAILED(XStoreQueryGameAndDlcPackageUpdatesAsync(m_xStoreContext, asyncBlock)))
    {
        delete asyncBlock;
    }
}
```

## Download and install updates

Once the set of updates is identified, there are two options:

### 1. Download and install the update in one operation

Using [XStoreDownloadAndInstallPackageUpdatesAsync](../../reference/system/xstore/functions/xstoredownloadandinstallpackageupdatesasync.md) will queue and download all the updates, and once the download is complete, the game will terminate to apply the update.
This will occur without warning.
This may be acceptable if the game does not allow any functionality during the download and shows a notice saying an update is in progress and that game will terminate.

```cpp
void Sample::DownloadUpdates()
{
    std::vector<const char*> packageIds;

    for (XStorePackageUpdate package : m_updates)
    {
        // m_updates populated from the update check
        packageIds.push_back(package.packageIdentifier);
    }

    if (!packageIds.empty())
    {
        auto asyncBlock = new XAsyncBlock{};
        asyncBlock->context = this;
        asyncBlock->queue = m_asyncQueue;
        asyncBlock->callback = [](XAsyncBlock* asyncBlockInner)
        {
            // Called when update is complete
            auto pThis = reinterpret_cast<Sample*>(asyncBlockInner->context);
            HRESULT hr = XStoreDownloadAndInstallPackageUpdatesResult(asyncBlockInner);

            delete asyncBlockInner;
        };

        HRESULT hr = XStoreDownloadAndInstallPackageUpdatesAsync(m_xStoreContext, packageIds.data(), packageIds.size(), asyncBlock);
    }
}
```

### 2. Download first, then install

There is the option to separate the download and installation portion.
The game can start the download and allow the player to continue playing select portions of the game that can be played without consideration of the update, such as an offline game mode.

To do this, simply call [XStoreDownloadPackageUpdatesAsync](../../reference/system/xstore/functions/xstoredownloadpackageupdatesasync.md) first

```cpp
    HRESULT hr = XStoreDownloadPackageUpdatesAsync(m_xStoreContext, packageIds.data(), packageIds.size(), asyncBlock);
```

When this is complete and callback verifies that [XStoreDownloadPackageUpdatesResult](../../reference/system/xstore/functions/xstoredownloadpackageupdatesresult.md) is successful, then the game can wait until an appropriate time (such as after a match or in the main menu), where it can then make the same  

```cpp
    HRESULT hr = XStoreDownloadAndInstallPackageUpdatesAsync(m_xStoreContext, packageIds.data(), packageIds.size(), asyncBlock);
```

call, at which point the game will terminate right away to install the update, as the download is already complete. Right before calling this API would be an appropriate time to notify the player and ask for confirmation of shut down.

## Monitoring download progress

During the time the game is running and an update download is in progress, [XPackageCreateInstallationMonitor](../../reference/system/xpackage/functions/xpackagecreateinstallationmonitor.md) can be used to monitor the progress of the download:

```cpp
void Sample::CreateInstallationMonitor(const char* packageId)
{
    XPackageInstallationMonitorHandle pimHandle;

    HRESULT hr = XPackageCreateInstallationMonitor(packageId, 0, nullptr, 1000, m_asyncQueue, &pimHandle);

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
    }
}
```

## Testing updates

During development, it is only possible to test the availability updates using local packages.

1. Create V1 package with the update check and download code
2. Create V2 package with the same identity but incremented version number
3. `wdapp install` V1
4. `wdapp update` V2 `/a`
5. Launch V1

Ensure the content ID matches between packages.

The result of this is that V1's `XStoreQueryGameAndDlcPackageUpdatesAsync` call will find an available update and `XStoreDownload(AndInstall)PackageUpdatesAsync` will update V1 using the staged V2 package.
When the "download" of V2 is in progress, this will show in the Microsoft Store app as an item in the queue.
Once the installation is complete, V2 should be installed which can be verified using `wdapp list` or `get-appxpackage`.

Using `/m` instead of `/a` makes the update "mandatory", which simply affects the[XStorePackageUpdate](../../reference/system/xstore/structs/xstorepackageupdate.md)`.isMandatory` field.

It is not possible to update from a development build to the package that downloads from the Store due to signing differences.

## Updates on Xbox

Managing updates is not necessary on Xbox since the system will prevent game launch if any updates are available.
The code described above should still work, and in fact it can be used to ensure DLC is up to date.

## See also

[Commerce Overview](../commerce-nav.md)

[Enabling XStore development and testing](../getting-started/xstore-product-testing-setup.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)