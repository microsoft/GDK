---
title: How to use a durable without a package
description: How to use durables without package properly.
kindex: How to use a durable without a package
author: joannaleecy
ms.author: timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# How to use a durable without a package

Durables can be configured with or without a package that is downloaded to the client. A durable without package is easier to configure and use.
These types of durables are typically used to gate access to content that is already part of the base game.
Many games opt to include the content for add-ons in the base game package because they use the assets for multiplayer or preview purposes even when unlicensed.

Even without a downloadable package, these product types still provide a license according to the [Product sharing model for games](xstore-product-sharing-model-for-games.md).

It is not enough to simply check for ownership using [XStoreQueryEntitledProductsAsync](../../reference/system/xstore/functions/xstorequeryentitledproductsasync.md) as this will result in only the purchaser being granted access. 
Instead, licensability of durables is accomplished using two distinct API:

## 1. Checking add-on licenses

Durable licenses are attached to the license of the base game. 
While [XStoreQueryGameLicenseAsync](../../reference/system/xstore/functions/xstorequerygamelicenseasync.md) can be used to examine the license for the game, [XStoreQueryAddonLicensesAsync](../../reference/system/xstore/functions/xstorequeryaddonlicensesasync.md) is used for add-on licenses, which include the durable product type. 
This will only work if the game is running with a digital license, including Xbox Game Pass.

```cpp
void Sample::QueryAddonLicenses()
{
    auto async = new XAsyncBlock{};
    async->context = this;
    async->queue = m_asyncQueue;
    async->callback = [](XAsyncBlock *async)
    {
        uint32_t count;
        HRESULT hr = XStoreQueryAddOnLicensesResultCount(
            async,
            &count);

        if (FAILED(hr))
        {
            delete async;
            return;
        }

        printf("Number of add-on licenses: %u\n", count);

        std::vector<XStoreAddonLicense> licenses(count);
        hr = XStoreQueryAddOnLicensesResult(async, count, licenses.data());

        if (FAILED(hr))
        {
            delete async;
            return;
        }

        for (auto& addOnLicense : licenses)
        {
            std::string info = "AddOnLicense ";
            info += std::string(addOnLicense.skuStoreId);
            info += " active: " + std::string(addOnLicense.isActive ? "true" : "false");

            if (addOnLicense.expirationDate > 0)
            {
                char buff[32] = {};
                struct tm timeinfo = {};
                ::localtime_s(&timeinfo, &addOnLicense.expirationDate);
                strftime(buff, 32, "%m/%d/%Y %H:%M:%S", &timeinfo);
                info += " expiry: " + std::string(buff);
            }

            info += "\n";

            printf(info.c_str());
        }

        licenses.clear();
        delete async;
    };

    HRESULT hr = XStoreQueryAddOnLicensesAsync(
        m_xStoreContext,
        async);

    if (FAILED(hr))
    {
        delete async;
    }
}
```

## 2. Acquiring a durable license

If the game is running using a disc license instead, there is no digital license to query that has durable licenses attached.
The durable digital licenses are still there, but requires a different API to acquire it. This follows a similar pattern to how to acquire a license for a DLC.

```cpp
void Sample::AcquireLicenseForDurable(const char* storeId)
{
    auto async = new XAsyncBlock{};
    async->context = this;
    async->queue = m_asyncQueue;
    async->callback = [](XAsyncBlock* async)
    {
        XStoreLicenseHandle result = {};

        HRESULT hr = XStoreAcquireLicenseForDurablesResult(
            async,
            &result);

        if (SUCCEEDED(hr))
        {
            bool isValid = XStoreIsLicenseValid(result);
            printf("Is valid license: %s\n", isValid? "yes" : "no");
        }
        else
        {
            printf("Error calling XStoreAcquireLicenseForDurablesResult: 0x%x\n", hr);
            if (static_cast<unsigned int>(hr) == 0x87e10bc6 /*LM_E_CONTENT_NOT_IN_CATALOG*/)
            {
                printf("This API only works with durables without packages\n");
            }
        }

        delete async;
    };

    HRESULT hr = XStoreAcquireLicenseForDurablesAsync(
        m_xStoreContext,
        storeId,
        async);

    if (FAILED(hr))
    {
        delete async;
        return;
    }
}
```

## See also

[Commerce Overview](../commerce-nav.md)

[Manage and license downloadable content (DLC)](xstore-manage-and-license-optional-packages.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)