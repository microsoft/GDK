---
title: Troubleshooting XStore development
description: Troubleshooting guide for most common issues when the XStore APIs don't work during development and testing.
kindex: Troubleshooting XStore development
author: joannaleecy
ms.author: timch
ms.topic: conceptual
edited: '09/08/2021'
security: public
---


# Troubleshooting XStore development

## XStore API returns 0x803f6107

This indicates the game is not configured to be licensed properly.
This happens when:

- [Test account](../../live/test-release/test-accounts/live-setup-testaccounts.md) does not have an entitlement to the game

On Console:

- Loose debug build doesn't have the contentID and EKBID overrides set in MicrosoftGame.config
- Packaged build was not created by passing in the content ID into makepkg and/or have the EKBID set by running `xbapp setekbid`

On PC:

- Content ID in `HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Store\ContentId` does not match the proper value (remove value from registry, reinstall from Store in correct sandbox and recheck registry)

This is covered in [Enabling XStore development and testing](xstore-product-testing-setup.md).

## Callback assigned in `XPackageRegisterPackageInstalled` is not hit when DLC package is installed

If DLC installation was not obvious, first check `xbapp listdlc` or `wdapp listdlc` to check that the expected DLC is listed.

Then check that the `AllowedProduct` in DLC microsoftgame.config matches that of the base game's `StoreId` node in its microsoftgame.config

If this is a Smart Delivery product and the Xbox Series X/S base game is using an ERA DLC package, and the `AllowedProduct` in the ERA DLC's appxmanifest is not the same as the product ID assigned to the Xbox Series X/S base game (`xbapp list /d`), then you may need to override the product ID. 
This is only possible for a packaged build:

```cmd
makepkg pack /d <dir> /pd <dir> /contentid <contentid> /productid <product ID of ERA product> /productidoverride
```

This situation can arise with a Xbox One base game that was migrated from XDP.

## `XStoreShowPurchaseUIAsync` on PC shows purchase dialog briefly then returns `E_ABORT`

This can occur when UAC (User Access Control) is set to not display the confirmation prompt to the interactive user's desktop.
This is governed by this registry value:

`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\PromptOnSecureDesktop`

being set to 1, and may have been set by your organization's security policies.
Setting this to 0 should allow the proper purchase UI to display.

This [page](/en-us/windows/security/identity-protection/user-account-control/user-account-control-group-policy-and-registry-key-settings
) has more information on this and other related controls.

## See also

[Commerce Overview](../commerce-nav.md)

[Enabling XStore development and testing](xstore-product-testing-setup.md)

[XStore API reference](../../reference/system/xstore/xstore_members.md)