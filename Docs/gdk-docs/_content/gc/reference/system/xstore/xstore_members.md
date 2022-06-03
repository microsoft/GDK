---
author: M-Stahl
title: XStore (API contents)
description: Reference material for XStore APIs.
kindex: XStore
ms.author: shanede
ms.topic: navigation
edited: 06/13/2019
security: public
applies-to: pc-gdk
---

# XStore
  
Reference material for XStore APIs.  
  
Provides commerce related functionality to a game including, details about available content to purchase, downloadable content package management, license management, and game trials.
  
  
## Functions  
  
| Function | Description |  
| --- | --- |  
| [XStoreAcquireLicenseForDurablesAsync](functions/xstoreacquirelicensefordurablesasync.md) | Acquires a license for the specified durable. |  
| [XStoreAcquireLicenseForDurablesResult](functions/xstoreacquirelicensefordurablesresult.md) | Retrieves the result of a call to [XStoreAcquireLicenseForDurablesAsync](functions/xstoreacquirelicensefordurablesasync.md). |  
| [XStoreAcquireLicenseForPackageAsync](functions/xstoreacquirelicenseforpackageasync.md) | Aquires a license for a game's DLC that the user is entitled to use. |  
| [XStoreAcquireLicenseForPackageResult](functions/xstoreacquirelicenseforpackageresult.md) | Retrieves the results of a call to [XStoreAcquireLicenseForPackageAsync](functions/xstoreacquirelicenseforpackageasync.md). |  
| [XStoreCanAcquireLicenseForPackageAsync](functions/xstorecanacquirelicenseforpackageasync.md) | Retrieves a preview license for DLC. |  
| [XStoreCanAcquireLicenseForPackageResult](functions/xstorecanacquirelicenseforpackageresult.md) | Gets the results for a call to [XStoreCanAcquireLicenseForPackageAsync](functions/xstorecanacquirelicenseforpackageasync.md). |  
| [XStoreCanAcquireLicenseForStoreIdAsync](functions/xstorecanacquirelicenseforstoreidasync.md) | Retrieves a preview license for content. |  
| [XStoreCanAcquireLicenseForStoreIdResult](functions/xstorecanacquirelicenseforstoreidresult.md) | Gets the results for a call to [XStoreCanAcquireLicenseForStoreIdAsync](functions/xstorecanacquirelicenseforstoreidasync.md). |  
| [XStoreCloseContextHandle](functions/xstoreclosecontexthandle.md) | Closes the specified store context handle. |  
| [XStoreCloseLicenseHandle](functions/xstorecloselicensehandle.md) | Closes the specified store license handle. |  
| [XStoreCloseProductsQueryHandle](functions/xstorecloseproductsqueryhandle.md) | Closes the specified store products query handle. |  
| [XStoreCreateContext](functions/xstorecreatecontext.md) | Creates a store context for the specified user. |  
| [XStoreDownloadAndInstallPackagesAsync](functions/xstoredownloadandinstallpackagesasync.md) | Downloads and installs the specified store packages. |  
| [XStoreDownloadAndInstallPackagesResult](functions/xstoredownloadandinstallpackagesresult.md) | Gets the results for a call to [XStoreDownloadAndInstallPackagesAsync](functions/xstoredownloadandinstallpackagesasync.md). |  
| [XStoreDownloadAndInstallPackagesResultCount](functions/xstoredownloadandinstallpackagesresultcount.md) | Gets the number of items in the result that will be returned by [XStoreDownloadAndInstallPackagesResult](functions/xstoredownloadandinstallpackagesresult.md). |  
| [XStoreDownloadAndInstallPackageUpdatesAsync](functions/xstoredownloadandinstallpackageupdatesasync.md) | Downloads and installs updates for the specified store packages. |  
| [XStoreDownloadAndInstallPackageUpdatesResult](functions/xstoredownloadandinstallpackageupdatesresult.md) | Gets the results for a call to [XStoreDownloadAndInstallPackageUpdatesAsync](functions/xstoredownloadandinstallpackageupdatesasync.md). |  
| [XStoreDownloadPackageUpdatesAsync](functions/xstoredownloadpackageupdatesasync.md) | Downloads updates for the specified packages. |  
| [XStoreDownloadPackageUpdatesResult](functions/xstoredownloadpackageupdatesresult.md) | Gets the results for a call to [XStoreDownloadPackageUpdatesAsync](functions/xstoredownloadpackageupdatesasync.md). |  
| [XStoreEnumerateProductsQuery](functions/xstoreenumerateproductsquery.md) | Enumerates the results of a products query. |  
| [XStoreGameLicenseChangedCallback](functions/xstoregamelicensechangedcallback.md) | A game defined callback for the game license changed event. |  
| [XStoreGetUserCollectionsIdAsync](functions/xstoregetusercollectionsidasync.md) | Gets a customer collections ID. |  
| [XStoreGetUserCollectionsIdResult](functions/xstoregetusercollectionsidresult.md) | Gets the results of a call to [XStoreGetUserCollectionsIdAsync](functions/xstoregetusercollectionsidasync.md). |  
| [XStoreGetUserCollectionsIdResultSize](functions/xstoregetusercollectionsidresultsize.md) | Gets the size of the ID returned by [XStoreGetUserCollectionsIdResult](functions/xstoregetusercollectionsidresult.md). |  
| [XStoreGetUserPurchaseIdAsync](functions/xstoregetuserpurchaseidasync.md) | Retrieves a customer purchase ID. |  
| [XStoreGetUserPurchaseIdResult](functions/xstoregetuserpurchaseidresult.md) | Gets the result of a call to [XStoreGetUserPurchaseIdAsync](functions/xstoregetuserpurchaseidasync.md). |  
| [XStoreGetUserPurchaseIdResultSize](functions/xstoregetuserpurchaseidresultsize.md) | Gets the size of the result returned by [XStoreGetUserPurchaseIdResult](functions/xstoregetuserpurchaseidresult.md). |  
| [XStoreIsLicenseValid](functions/xstoreislicensevalid.md) | Checks if the specified license is valid. |  
| [XStorePackageLicenseLostCallback](functions/xstorepackagelicenselostcallback.md) | Game defined callback for the license lost event. |  
| [XStoreProductQueryCallback](functions/xstoreproductquerycallback.md) | Game defined callback for a product query. |  
| [XStoreProductsQueryHasMorePages](functions/xstoreproductsqueryhasmorepages.md) | Checks if there are more results pages for the specified query. |  
| [XStoreProductsQueryNextPageAsync](functions/xstoreproductsquerynextpageasync.md) | Gets the next page of query results. |  
| [XStoreProductsQueryNextPageResult](functions/xstoreproductsquerynextpageresult.md) | Gets the next page of results from a product query. |  
| [XStoreQueryAddOnLicensesAsync](functions/xstorequeryaddonlicensesasync.md) | Enumerates the licenses the user was granted for durables without bits of the currently running game. |  
| [XStoreQueryAddOnLicensesResult](functions/xstorequeryaddonlicensesresult.md) | Retrieves the result of a call to XStoreQueryAddOnLicensesAsync. |  
| [XStoreQueryAddOnLicensesResultCount](functions/xstorequeryaddonlicensesresultcount.md) | Gets the number of licenses retrieved by [XStoreQueryAddonLicensesAsync](functions/xstorequeryaddonlicensesasync.md). |  
| [XStoreQueryAssociatedProductsAsync](functions/xstorequeryassociatedproductsasync.md) | Gets store listing information for the products that can be purchased from within the current game. |  
| [XStoreQueryAssociatedProductsResult](functions/xstorequeryassociatedproductsresult.md) | Gets the results for a call to [XStoreQueryAssociatedProductsAsync](functions/xstorequeryassociatedproductsasync.md). |  
| [XStoreQueryConsumableBalanceRemainingAsync](functions/xstorequeryconsumablebalanceremainingasync.md) | Get the consumable balance remaining for the specified product ID. |  
| [XStoreQueryConsumableBalanceRemainingResult](functions/xstorequeryconsumablebalanceremainingresult.md) | Retrieves the results of a call to [XStoreQueryConsumableBalanceRemainingAsync](functions/xstorequeryconsumablebalanceremainingasync.md). |  
| [XStoreQueryEntitledProductsAsync](functions/xstorequeryentitledproductsasync.md) | Provides the Store product information for all add-ons of the current game the user has purchased. |  
| [XStoreQueryEntitledProductsResult](functions/xstorequeryentitledproductsresult.md) | Gets the results for a call to [XStoreQueryEntitledProductsAsync](functions/xstorequeryentitledproductsasync.md). |  
| [XStoreQueryGameAndDlcPackageUpdatesAsync](functions/xstorequerygameanddlcpackageupdatesasync.md) | Gets game and optional updates for the current package. |  
| [XStoreQueryGameAndDlcPackageUpdatesResult](functions/xstorequerygameanddlcpackageupdatesresult.md) | Gets the result for a call to [XStoreQueryGameAndDlcPackageUpdatesAsync](functions/xstorequerygameanddlcpackageupdatesasync.md). |  
| [XStoreQueryGameAndDlcPackageUpdatesResultCount](functions/xstorequerygameanddlcpackageupdatesresultcount.md) | Gets the number of updates retrieved by [XStoreQueryGameAndDlcPackageUpdatesAsync](functions/xstorequerygameanddlcpackageupdatesasync.md). |  
| [XStoreQueryGameLicenseAsync](functions/xstorequerygamelicenseasync.md) | Retrieves information about the license that was acquired to allow the game to launch. |  
| [XStoreQueryGameLicenseResult](functions/xstorequerygamelicenseresult.md) | Gets the results of a call to [XStoreQueryGameLicenseAsync](functions/xstorequerygamelicenseasync.md). |  
| [XStoreQueryLicenseTokenAsync](functions/xstorequerylicensetokenasync.md) | Provides an opaque token to the calling game that can be passed to the game's service to make B2B calls. |  
| [XStoreQueryLicenseTokenResult](functions/xstorequerylicensetokenresult.md) | Retrieves the results of a call to [XStoreQueryLicenseTokenAsync](functions/xstorequerylicensetokenasync.md). |  
| [XStoreQueryLicenseTokenResultSize](functions/xstorequerylicensetokenresultsize.md) | Gets the size of the result that will be returned by [XstoreQueryLicenseTokenResult](functions/xstorequerylicensetokenresult.md). |  
| [XStoreQueryPackageIdentifier](functions/xstorequerypackageidentifier.md) | Retrieves the package identifier for the specified store ID. |  
| [XStoreQueryProductForCurrentGameAsync](functions/xstorequeryproductforcurrentgameasync.md) | Provides store product information for the currently running game, its skus and availabilities, and other metadata. |  
| [XStoreQueryProductForCurrentGameResult](functions/xstorequeryproductforcurrentgameresult.md) | Gets the results for a call to [XStoreQueryProductForCurrentGameAsync](functions/xstorequeryproductforcurrentgameasync.md). |  
| [XStoreQueryProductForPackageAsync](functions/xstorequeryproductforpackageasync.md) | Retrieves store product information for the specified package. |  
| [XStoreQueryProductForPackageResult](functions/xstorequeryproductforpackageresult.md) | Gets the results of a call to [XStoreQueryProductForPackageAsync](functions/xstorequeryproductforpackageasync.md). |  
| [XStoreQueryProductsAsync](functions/xstorequeryproductsasync.md) | Returns listing information for the specified products that are associated with the current game, regardless of whether the products are currently available for purchase within the current game. |  
| [XStoreQueryProductsResult](functions/xstorequeryproductsresult.md) | Gets the results for a call to [XStoreQueryProductsAsync](functions/xstorequeryproductsasync.md). |  
| [XStoreRegisterGameLicenseChanged](functions/xstoreregistergamelicensechanged.md) | Registers a callback for the game license changed event. |  
| [XStoreRegisterPackageLicenseLost](functions/xstoreregisterpackagelicenselost.md) | Registers a callback for the license lost event. |  
| [XStoreReportConsumableFulfillmentAsync](functions/xstorereportconsumablefulfillmentasync.md) | Consumes the specified quantity of a consumable. |  
| [XStoreReportConsumableFulfillmentResult](functions/xstorereportconsumablefulfillmentresult.md) | Gets the results of a call to [XStoreReportConsumableFulfillmentAsync](functions/xstorereportconsumablefulfillmentasync.md). |  
| [XStoreShowAssociatedProductsUIAsync](functions/xstoreshowassociatedproductsuiasync.md) | This will open up the Microsoft Store app and show the set of available add-ons associated with the game. This can be further filtered by product type. |  
| [XStoreShowAssociatedProductsUIResult](functions/xstoreshowassociatedproductsuiresult.md) | Gets the result of a call to [XStoreShowAssociatedProductsUIAsync](functions/xstoreshowassociatedproductsuiasync.md). |  
| [XStoreShowProductPageUIAsync](functions/xstoreshowproductpageuiasync.md) | Opens the Store app directly to the details page of the specified ProductId. |  
| [XStoreShowProductPageUIResult](functions/xstoreshowproductpageuiresult.md) | Gets the result of a call to [XStoreShowProductPageUIAsync](functions/xstoreshowproductpageuiasync.md). |  
| [XStoreShowPurchaseUIAsync](functions/xstoreshowpurchaseuiasync.md) | Allows the game to request a purchase for a particular store product. |  
| [XStoreShowPurchaseUIResult](functions/xstoreshowpurchaseuiresult.md) | Gets the results of a call to [XStoreShowPurchaseUIAsync](functions/xstoreshowpurchaseuiasync.md). |  
| [XStoreShowRateAndReviewUIAsync](functions/xstoreshowrateandreviewuiasync.md) | Displays a system dialog to pop up to allow the user to provide a review or decline to do so. |  
| [XStoreShowRateAndReviewUIResult](functions/xstoreshowrateandreviewuiresult.md) | Gets the result of a call to [XStoreShowRateAndReviewUIAsync](functions/xstoreshowrateandreviewuiasync.md). |  
| [XStoreShowRedeemTokenUIAsync](functions/xstoreshowredeemtokenuiasync.md) | Triggers a token redemption for the current user for a specified token. |  
| [XStoreShowRedeemTokenUIResult](functions/xstoreshowredeemtokenuiresult.md) | Gets the results of a call to [XStoreShowRedeemTokenUIAsync](functions/xstoreshowredeemtokenuiasync.md). |  
| [XStoreUnregisterGameLicenseChanged](functions/xstoreunregistergamelicensechanged.md) | Unregisters the specified game license changed callback. |  
| [XStoreUnregisterPackageLicenseLost](functions/xstoreunregisterpackagelicenselost.md) | Unregisters the specified store license lost callback. |  
  
## Structures  
  
| Structure | Description |  
| --- | --- |  
| [XStoreAddonLicense](structs/xstoreaddonlicense.md) | Describes an addon license. |  
| [XStoreAvailability](structs/xstoreavailability.md) | Describes the availability of a product. |  
| [XStoreCanAcquireLicenseResult](structs/xstorecanacquirelicenseresult.md) | Gets the result of a call to [XStoreCanAcquireLicenseForPackageAsync](functions/xstorecanacquirelicenseforpackageasync.md) or [XStoreCanAcquireLicenseForStoreIdAsync](functions/xstorecanacquirelicenseforstoreidasync.md). |  
| [XStoreCollectionData](structs/xstorecollectiondata.md) | Describes a store collection. |  
| [XStoreConsumableResult](structs/xstoreconsumableresult.md) | Represents the quantity of the consumable. |  
| [XStoreGameLicense](structs/xstoregamelicense.md) | Describes a game license. |  
| [XStoreImage](structs/xstoreimage.md) | Describes an image. |  
| [XStorePackageUpdate](structs/xstorepackageupdate.md) | Describes a package update. |  
| [XStorePrice](structs/xstoreprice.md) | Store price information. |  
| [XStoreProduct](structs/xstoreproduct.md) | Describes a store product. |  
| [XStoreRateAndReviewResult](structs/xstorerateandreviewresult.md) | The results for a call to [XStoreShowRateAndReviewUIAsync](functions/xstoreshowrateandreviewuiasync.md). |  
| [XStoreSku](structs/xstoresku.md) | Describes a store SKU. |  
| [XStoreSubscriptionInfo](structs/xstoresubscriptioninfo.md) | Contains information on a subscription. |  
| [XStoreVideo](structs/xstorevideo.md) | Describes a store video. |  
  
## Enumerations  
  
| Enumeration | Description |  
| --- | --- |  
| [XStoreCanLicenseStatus](enums/xstorecanlicensestatus.md) | Indicates if a user would be able to license a package. |  
| [XStoreDurationUnit](enums/xstoredurationunit.md) | Units of a duration value. |  
| [XStoreProductKind](enums/xstoreproductkind.md) | Indicates the product type. |  


## See also  
[System API reference](../gc-reference-system-toc.md)  
[XPackage API reference](../xpackage/xpackage_members.md)  
[Commerce Overview](../../../commerce/commerce-nav.md)