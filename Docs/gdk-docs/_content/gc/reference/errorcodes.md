---
author: M-Stahl
title: Error codes
description: Constant definitions for the Microsoft Game Development Kit (GDK) error code values, declared in XGameErr.h.
kindex: Error codes
ms.author: mstahl
ms.topic: conceptual
edited: 01/08/2020
security: public
applies-to: pc-gdk
---

# Error codes  
  
Constant definitions for the Microsoft Game Development Kit (GDK) error code values, declared in XGameErr.h.  
  
| Code | Value | Description |  
| --- | --- | --- |  
| E_GAMERUNTIME_NOT_INITIALIZED | 0x89240100 | The game runtime has not yet been initialized. |  
| E_GAMERUNTIME_DLL_NOT_FOUND | 0x89240101 | The game runtime DLL was not found. |  
| E_GAMERUNTIME_VERSION_MISMATCH | 0x89240102 | The game runtime DLL does not support this version of the Microsoft Game Development Kit (GDK). |
| E_GAMERUNTIME_WINDOW_NOT_FOREGROUND | 0x89240103 | The operation requires an application window to be in the foreground. |
| E_GAMERUNTIME_SUSPENDED | 0x89240104 | The game runtime is in a suspended state. |
| E_GAMERUNTIME_UNINITIALIZE_ACTIVEOBJECTS | 0x89240105 | The game runtime has active objects at XGameRuntimeUninitialize. |
| E_GAMERUNTIME_MULTIPLAYER_NOT_CONFIGURED | 0x89240106 | There is no multiplayer activity set on the service for this user on this title. |
| E_GAMEUSER_MAX_USERS_ADDED | 0x89245100 | Can't add this user because the max number of users has been added. |  
| E_GAMEUSER_SIGNED_OUT | 0x89245101 | Can't perform the operation because the user is signed out. |  
| E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED | 0x89245102 | Needs UI to resolve an issue with this user. In general, if you are getting E_GAMEUSER_RESOLVE_USER_ISSUE_REQUIRED (and this can happen from multiple APIs), you should call [XUserResolveIssueWithUiAsync](system/xuser/functions/xuserresolveissuewithuiasync.md). |  
| E_GAMEUSER_DEFERRAL_NOT_AVAILABLE | 0x89245103 | Not an appropriate time to request deferral. |  
| E_GAMEUSER_USER_NOT_FOUND | 0x89245104 | User matching the id was not found. |  
| E_GAMEUSER_NO_TOKEN_REQUIRED | 0x89245105 | No token is required for this call. |  
| E_GAMEUSER_NO_DEFAULT_USER | 0x89245106 | There is no current default user. If you're getting this error, it likely means that you called XUserAddAsync(AddDefaultUsersSilently, ...). To fix the issue, you should call XUserAddAsync again, this time without AddDefaultUserSilently to get a user. |  
| E_GAMEUSER_FAILED_TO_RESOLVE | 0x89245107 | Failed to resolve the given privilege. |  
| E_GAMEUSER_NO_TITLE_ID | 0x89245108 | An Xbox live title id must be configured. |  
| E_GAMEUSER_UNKNOWN_GAME_IDENTITY | 0x89245109 | The game identity is not recognized. This error happens when the &lt;MSAAppId> and &lt;TitleId> don't match the ones associated to the game. |  
| E_GAMEUSER_NO_PACKAGE_IDENTITY | 0x89245110 | A package identity must be configured. |  
| E_GAMEUSER_FAILED_TO_GET_TOKEN | 0x89245111 | The token request failed. |
| E_GAMEUSER_INVALID_APP_CONFIGURATION | 0x89245112 | The MSAAppId in the game config is invalid or is not configured for the authentication stack. |
| E_GAMEUSER_MALFORMED_MSAAPPID | 0x89245113 | The MSAAppId in the game config doesn't match an expected format, either a 16 character string or GUID. |
| E_GAMEUSER_INCONSISTENT_MSAAPPID_AND_TITLEID | 0x89245114 | The MSAAppId and TitleId in the game config don't match the ones associated to the game. |
| E_GAMEPACKAGE_APP_NOT_PACKAGED | 0x89245200 | The game is not packaged in a container. |  
| E_GAMEPACKAGE_NO_INSTALLED_LANGUAGES | 0x89245201 | The game uses Intelligent Delivery to selectively install languages, but none of the languages are installed. |
| E_GAMEPACKAGE_NO_STORE_ID | 0x89245202 | This API requires that the StoreId attribute be set in the application's game config. |
| E_GAMEPACKAGE_INVALID_SELECTOR | 0x89245203 | A chunk selector was provided that does not resolve to a chunk in the package. |
| E_GAMEPACKAGE_DOWNLOAD_REQUIRED | 0x89245204 | One or more required chunks must be downloaded to mount the package on this device. |
| E_GAMEPACKAGE_NO_TAG_CHANGE | 0x89245205 | Change installed chunks in this package using Features, not tags. |
| E_GAMEPACKAGE_DLC_NOT_SUPPORTED | 0x89245206 | The DLC being mounted is not supported by this game.  Ensure the correct DLC compatibility is set in the game config. |
| E_GAMEPACKAGE_DUPLICATE_ID_VALUES | 0x89245207 | The package contains more than one executable mapping to the same 'Id' attribute. Please check the game config for duplicate 'Id' attributes in the 'Executable' elements. |
| E_GAMEPACKAGE_NO_PACKAGE_IDENTIFIER | 0x89245208 | Could not resolve an identifier for the package.  The package may not be installed. |
| E_GAMEPACKAGE_CONFIG_NO_ROOT_NODE | 0x89245209 | Could not find a root &lt;Game> node in the MicrosoftGame.config file. Please check the MicrosoftGame.config file to ensure it is properly formatted. |
| E_GAMEPACKAGE_CONFIG_ZERO_VERSION | 0x8924520A | The 'Version' attribute in the 'Identity' node in the MicrosoftGame.config cannot be 0.0.0.0. Please increment or remove this attribute. If no version is specified, a default value of 1.0.0.0 will be used. |
| E_GAMEPACKAGE_CONFIG_NO_MSAAPPID_NOTITLEID | 0x8924520B | The 'MSAAppId' or 'TitleId' element in the MicrosoftGame.config is missing. If one of these values is specified, then they must both be specified when using configVersion >= 1. Please use the MicrosoftGame.config Editor "Associate with Store" feature to automatically retrieve Id values from Partner Center. |
| E_GAMEPACKAGE_CONFIG_DEPRECATED_PC_ENTRIES | 0x8924520C | The DesktopRegistration entries "modFolder", "enableWritesToPackageRoot", "disableRegistryWriteVirtualization" and "disableFilesystemWriteVirtualization" are deprecated in configVersion >= 1. |
| E_GAMEPACKAGE_CONFIG_SUM_REQUIRES_MSAAPPID | 0x8924520D | The 'MSAAppId' and 'TitleId' elements in the MicrosoftGame.config are required when using the Simplified User Model (AdvancedUserModel element) and configVersion >= 1. Please use the MicrosoftGame.config Editor "Associate with Store" feature to automatically retrieve Id values from Partner Center. |
| E_GAMEPACKAGE_CONFIG_NO_CODE_CLOUD_SAVES_REQUIRES_MSAAPPID | 0x8924520E | The 'MSAAppId' and 'TitleId' elements in the MicrosoftGame.config are required when using No Code Cloud Saves (NoCodePCRoot element) and configVersion >= 1. Please use the MicrosoftGame.config Editor "Associate with Store" feature to automatically retrieve Id values from Partner Center. |
| E_GAMEPACKAGE_CONFIG_MSAAPPID_OR_TITLEID_IS_DEFAULT | 0x8924520F | The 'MSAAppId' or 'TitleId' element in the MicrosoftGame.config is a default value. If NoCodePCRoot or AdvancedUserModel is specified, then the TitleId and MSAAppId must both be valid Ids from Partner Center when using configVersion >= 1. Please use the MicrosoftGame.config Editor "Associate with Store" feature to automatically retrieve Id values from Partner Center. |
| E_GAMESTORE_LICENSE_ACTION_NOT_APPLICABLE_TO_PRODUCT | 0x89245300 | The game requested a license for a product that cannot be licensed. |  
| E_GAMESTORE_NETWORK_ERROR | 0x89245301 | The game failed to communicate with the store network. |  
| E_GAMESTORE_SERVER_ERROR | 0x89245302 | The game received a bad response from the store server. |  
| E_GAMESTORE_INSUFFICIENT_QUANTITY | 0x89245303 | The user does not have enough of this consumable to use the requested amount. |  
| E_GAMESTORE_ALREADY_PURCHASED | 0x89245304 | The user already owns this product. |  
| E_GAMESTREAMING_NOT_INITIALIZED | 0x89245400 | The XGameStreaming runtime has not been initialized. Call XGameStreamingInitialize before calling other APIs. |
| E_GAMESTREAMING_CLIENT_NOT_CONNECTED | 0x89245401 | The specified client is not connected. |
| E_GAMESTREAMING_NO_DATA | 0x89245402 | The requested data is not available. The data may be available later. |
| E_GAMESTREAMING_NO_DATACENTER | 0x89245403 | The current machine is not running in a datacenter. |
| E_GAMESTREAMING_NOT_STREAMING_CONTROLLER | 0x89245404 | The current reading didn't come from a streaming controller. |


>[!VIDEO https://www.microsoft.com/en-us/videoplayer/embed/RE4PiEX]


## See also  
  
[API reference](gc-reference-toc.md)
  
  