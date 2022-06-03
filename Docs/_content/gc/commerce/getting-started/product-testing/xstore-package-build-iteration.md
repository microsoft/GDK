---
author: Tim Chen
title: Testing XStore with packaged builds
description: Describes how to test XStore API with packaged builds.
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

# Testing XStore with packaged builds

Packaged builds are generated using the `makepkg` command and will have the file extension .xvc for console packages and .msixvc for PC packages.
If your game engine generates these through its tools and pipelines, you will have to figure out how the tools call `makepkg` and how it populates its parameters in order to be able to apply the required values.

In order for a locally installed packaged build to be able to use `XStore` API properly, it must be licensed.
This requires the correct values to be applied to the package using values present in the MicrosoftGame.config and applied by various commands.

Please reference [Enabling XStore development and testing](../xstore-product-testing-setup.md) for any IDs.

Ensure testing is done with [accounts that are entitled](../xstore-product-testing-setup.md#ensure-test-account-is-entitled-to-game-in-the-sandbox) to the product.

## Console

The MicrosoftGame.config overrides described in [Testing XStore with loose builds](xstore-loose-build-iteration.md) will not apply to packaged builds.

The **Content ID** must be passed into the `makepkg` command:

```cmd
makepkg pack /v /f chunks.xml /d Gaming.Xbox.XboxOne.x64\Layout\Image\Loose /pd ./output /contentid 2797FA46-A93B-494C-AD80-B67C9FCA939F
```
> [!NOTE]
> Do not be concerned if you have been submitting packages to Partner Center without a content ID or if you're using the incorrect value. This is automatically overridden by the correct value when the package is ingested and signed so the package downloaded from the Store will always have the correct values.

If this package is installed locally (e.g. using `xbapp install` or Xbox Manager, etc.), then its **EKBID** will by default be 33EC8436-5A0E-4F0D-B1CE-3F29C3955039 representing a test license that is not usable by `XStore`.
Override this by calling:

```cmd
xbapp setekbid <package full name> {<GUID that is not all zeroes or 33EC8436-5A0E-4F0D-B1CE-3F29C3955039>}
```

e.g.

```cmd
xbapp setekbid 41336MicrosoftATG.InGameStoreXS_2020.7.27.0_neutral__dspnxghe87tn0 {00000000-0000-0000-0000-000000000001}
```

## PC

[Ensure the sandbox is switched properly.](../../pc-specific-considerations/xstore-switching-pc-sandbox-for-store.md)

The **Content ID** must be passed into the `makepkg` command:

```cmd
makepkg pack /pc /v /f chunks.xml /d Gaming.Desktop.x64\Staging /pd ./output /contentid 2797FA46-A93B-494C-AD80-B67C9FCA939F
```

This, in combination with the correct **App Identity** that matches the value in Partner Center, will allow the packaged build to be licensable.

## See also

[Commerce Overview](../../commerce-nav.md)

[Enabling XStore development and testing](../xstore-product-testing-setup.md)

[Testing XStore with loose builds](xstore-loose-build-iteration.md)

[Switching sandboxes properly for Store operations](..\..\pc-specific-considerations\xstore-switching-pc-sandbox-for-store)

[XStore API reference](../../../reference/system/xstore/xstore_members.md)
