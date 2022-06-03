---
author: Tim Chen
title: Testing XStore with loose builds
description: Describes how to test XStore API with loose builds.
kindex:
- Enabling XStore development and testing
- XStore, Enabling development and testing
- testing, Enabling XStore development and testing
- Testing with a license override
- license override, testing with
ms.author: timch
ms.topic: conceptual
edited: '08/30/2021'
security: public
---

# Testing XStore with loose builds

A loose build is one that takes the form of a directory of files, including the executabe, .dlls, and assets.
This includes the F5 or Debug workflow started from Visual Studio, where a copy of the required files are copied and registered as an app entry in the target device.
Run from PC would also fall in this category.

This type of build, as is, is not licensable and therefore most `XStore` API that rely on service calls will fail, most likely with an 0x803f6107 error.
The following describes steps how to make these builds licensable in order to have `XStore` API function.

Please reference [Enabling XStore development and testing](../xstore-product-testing-setup.md) for any IDs.

Ensure testing is done with [accounts that are entitled](../xstore-product-testing-setup.md#ensure-test-account-is-entitled-to-game-in-the-sandbox) to the product.

## Console

Ensure the **StoreId** is specified in the MicrosoftGame.config.

Add the following section in MicrosoftGame.config:

```xml
  <StoreId>9NTL0QDWZ4FS</StoreId>
  
  <DevelopmentOnly>
    <ContentIdOverride>2797FA46-A93B-494C-AD80-B67C9FCA939F</ContentIdOverride>
    <EKBIDOverride>00000000-0000-0000-0000-000000000001</EKBIDOverride>
  </DevelopmentOnly>
```

`ContentIdOverride` is the **Content ID** of the product that this build will license.

`EKBIDOverride` can be any GUID value except all zeroes or 33EC8436-5A0E-4F0D-B1CE-3F29C3955039.

This section can remain in the MicrosoftGame.config throughout development as it will be removed during package creation.
Submit these section to your code repo/depot in order for all developers to be able have a build that is set up to be properly licensable.
This section will only apply to loose builds and expressly not packaged builds, which is covered in []().

## PC

[Ensure the sandbox is switched properly.](../../pc-specific-considerations/xstore-switching-pc-sandbox-for-store.md)

PC loose builds must also be licensed properly in order for `XStore` API to work.
This is accomplished by ensuring the **App Identity** in the MicrosoftGame.config matches the value in Partner Center.

If there still are problems with licensing, also check the registry for a Content ID that may not be the correct value. Remove and redeploy.

## See also

[Commerce Overview](../../commerce-nav.md)

[Enabling XStore development and testing](../xstore-product-testing-setup.md)

[Testing XStore with packaged builds](xstore-package-build-iteration.md)

[Switching sandboxes properly for Store operations](..\..\pc-specific-considerations\xstore-switching-pc-sandbox-for-store)

[XStore API reference](../../../reference/system/xstore/xstore_members.md)
