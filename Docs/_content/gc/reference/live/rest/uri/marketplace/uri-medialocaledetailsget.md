---
title: GET (/media/{marketplaceId}/details)
description: " GET (/media/{marketplaceId}/details)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# GET (/media/{marketplaceId}/details)
Returns offer details and metadata about one or more items.
The domain for these URIs is `eds.xboxlive.com`.

  * [Remarks](#ID4EV)
  * [URI parameters](#ID4ECB)
  * [Query string parameters](#ID4ERB)
  * [Response body](#ID4EYF)

<a id="ID4EV"></a>


## Remarks

**SandboxId** is now retrieved from the claim in the XToken and enforced. If the **SandboxId** is not present, then Entertainment Discovery Services (EDS) will throw a 400 Bad request error.

<a id="ID4ECB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- |
| marketplaceId| string| Required. String value obtained from the <b>Windows.Xbox.ApplicationModel.Store.Configuration.MarketplaceId</b>.|

<a id="ID4ERB"></a>


## Query string parameters

| Parameter| Type| Description|
| --- | --- | --- | --- | --- | --- |
| ids| string[]| Required. All of the IDs (up to 10) for which details will be returned. Note that any ID that contains characters illegal to put in a URL (the ProviderContentId type IDs are normally full URLs themselves and thus contain illegal characters) <b>MUST</b> be URL-encoded to be properly sent to Entertainment Discovery Services (EDS). Also note that this can only be a single value if the ID type is ProviderContentId. If more than one ProviderContentId is desired, multiple calls must be made to EDS.|
| IdType| string| Optional. The type of the IDs which are passed in to the 'ids' parameter. Valid values are: <ul><li><b>Canonical</b> (Bing/Marketplace) </li><li><b>ZuneCatalog</b></li><li><b>ZuneMediaInstance</b> (eg 132 kb WMA music file) </li><li><b>AMG</b></li><li><b>MediaNet</b> (pre-MusiWave) </li><li><b>XboxHexTitle</b> (App playing on the console) </li></ul>|
| DesiredMediaItemTypes| string| <b>Required if MediaGroup is not passed. Both should not be passed.</b> The media item typs of the IDs. All provided IDs must share the same type. If multiple types are desired, pass in all possible types as described in the IdType above. This value defaults to "Unknown" if it is not present, which may not be valied for all ID types. |
| MediaGroup| string| <b>Required if DesiredMediaItemTypes is not passed. Both should not be passed.</b>|
| ConditionSets| string| <b>Optional</b>. Clients may request <b>Availability</b> pruning based on condition sets, which are key-value pairs specified through this query string. They are used to match on the condition sets of an availability. The list of keys that can be used to match the condition sets is as follows. <ul><li><b>Platforms</b>: Where the product is built and can be played.</li><li><b>Subscriptions</b>: List of supported subscriptions for this availability (Gold or Silver).</li><li><b>EntitlementIds</b>: Tracked after users buy the game.</li></ul> | 

<a id="ID4EYF"></a>


## Response body

<a id="ID4E5F"></a>


### Sample response

The JSON code below is in response to the call `/media/en-us/details?ids=6c5402e4-3cd5-4b29-a9c4-bec7d2c7514a&mediaGroup=GameType`.


```cpp
{
    "Items": [{
        "MediaGroup": "GameType",
        "MediaItemType": "DGame",
        "ID": "fd16e2fb-eca4-4182-8f69-a98fdd6e57a1",
        "Name": "Vector based massively multiplayer Tanks game.",
        "ReducedName": "Tanks",
        "ReleaseDate": "2013-03-15T00: 00: 00Z",
        "TitleId": "69A60C76",
        "VuiDisplayName": "Tanks",
        "DeveloperName": "Microsoft Studios",
        "Images": [{
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Box_Art"],
            "Purpose": "Box_Art",
            "Height": 300,
            "Width": 219,
            "Order": 1
        },
        {
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Box_Art"],
            "Purpose": "Box_Art",
            "Height": 120,
            "Width": 85,
            "Order": 1
        },
        {
            "ID": "32ebd9fe-6a22-4111-954e-564ec69d802a",
            "ResizeUrl": "http: //images-eds.dnet.xboxlive.com/image?url=RIJNAEIo6.u.tudW9rXJ2lWDOsMikqfNiHE2Sp4qbgNbH6_drY8Ek2cyHXEnnUKPUXAH_m8a3Oe4_wpV7CkKA0Snc9puIYOGxsIfyyncTBv.MIluDZX6UqAPsJYHE5go_J_BBfxNWW6yrK4.K75aMQ--",
            "Purposes": ["Image"],
            "Purpose": "Image",
            "Height": 720,
            "Width": 1280,
            "Order": 1
        }],
        "PublisherName": "Microsoft Studios",
        "RatingId": "10",
        "ParentalRating": "E",
        "ParentalRatingSystem": "ESRB",
        "SortName": "\n            Vector based massively multiplayer Tanks game.\n          ",
        "Capabilities": [{
            "NonLocalizedName": "onlineMultiplayerMin",
            "Value": "3"
        },
        {
            "NonLocalizedName": "onelineMultiplayerMax",
            "Value": "5"
        }],
        "KValue": "4",
        "KValueNamespace": "bingbox",
        "AllTimePlayCount": 30.0,
        "SevenDaysPlayCount": 30.0,
        "ThirtyDaysPlayCount": 30.0,
        "AllTimeRatingCount": 12.0,
        "ThirtyDaysRatingCount": 12.0,
        "SevenDaysRatingCount": 12.0,
        "AllTimeAverageRating": 0.8,
        "ThirtyDaysAverageRating": 0.8,
        "SevenDaysAverageRating": 0.8,
        "LegacyIds": [{
            "IdType": "TitleId",
            "Value": "69A60C76"
        }],
        "Availabilities": [{
            "AvailabilityID": "",
            "ContentId": "7AE9DAB2-1162-488D-9F80-B804EC5AF879",
            "Devices": [{
                "Name": "Durango"
            }],
            "LicensePolicyTicket": "eyJhbGciOiJIUzI1NiIsImtpZCI6IlYxIn0.eyJhbGxvd1BlcnNpc3RlbnRSb290IjpmYWxzZSwiYmxvY2tlZENvdW50cmllcyI6bnVsbCwiZW50aXRsZWRDb3VudHJpZXMiOm51bGwsImVzY3Jvd2VkQ29udGVudEtleSI6IlJVdENNY3NCQUFBQkFBSUFBQUFGQUFJQUlBQUFBREpsWlRKaVpERTFORGhsT1RZMk5EZGhOVEEyWW1ZeVkyVmpZek5sTVRGa0F3QUNBQUFBQmdBRUFBRUFBQUF4QlFBQ0FBQUFBUUFIQUlBQkFBQzJxb0Vsbm83eWNaZ05iY2R0dFB0TXBlZW95VEVjVUorSmF1WlhmSU9xRFRiV09ud2x1anZEZzU1YzFJby94Q1llTzYxd0VkYTdyZmQ3bVZWMFdTVmNXQUZ2OHplK2toMG1VZVcyUkU3MDd6S05GYzllanVLWlhoY0dkQ1RBYmdVYzJQUVlFNkZOZDJtaWEzdDgyaXlPam9UeGcxWkNaaUR1LzFZaUJ1ZzE1R3BvWVZZREpIbkt5K3NuaEZMdEFKcEI0cER3VXhkVTcvZlV6Y0dvdEtyUW12VDJRQVk5d1NxM0d4WWJ3a1RnVnRrUHVzNTdsN1FVSmp6clBiYkpzeWk5UjhaKzN5RE1EM1JoN0NmekhtVGx3NnBaclFMbnhTTHM0bldPQS92eGo5WS9aN25EM2NJRWlScUhMUU9LSE9GOXVqL0pOOUxtT1FqVkNaaHpLekhRMk5sVURBWmFzYkZ4ZnZjOVh1bDZqZVNCamJsR2xCMlRpZUlTemdPSDh3V0lRWmFGZTMwcVd0a2d4dC9MOEhwTmRwWkwzbG1mcU0vcmswMEtFWUtLaGI4K0E1TGMzeEd2clg3TW9GcmdTUGFONE4xMUNSRVdFZkFGOGc5WWdROEt4R3B0SzdKc0ZpR0NDUmVOeXVYYTQ0NU9NMFNCSFFHVXVMTjl1R0RVTVNNPSIsImV4cGlyYXRpb24iOiIyMDEzLTA4LTEyVDIyOjE3OjI4Ljg2MTYzNzhaIiwibWlpZCI6IjAwMDAwMDAwLTAwMDAtMDAwMC0wMDAwLTAwMDAwMDAwMDAwMCIsIm9paWQiOiIwMDAwMDAwMC0wMDAwLTAwMDAtMDAwMC0wMDAwMDAwMDAwMDAiLCJwb2xpY3lDYXJkSWRzIjpbImdhbWVzOjhmY2UwMjkyLTgyZDUtNDFhNi1hN2IzLTM5NzNkOGM5MWZiNyJdLCJwcm9kdWN0SWQiOiIzMmViZDlmZS02YTIyLTQxMTEtOTU0ZS01NjRlYzY5ZDgwMmEiLCJzZSI6WyJHYW1lOzMyZWJkOWZlLTZhMjItNDExMS05NTRlLTU2NGVjNjlkODAyYSJdLCJ2ZXJzaW9uIjoiMiJ9.T0vaH03VDHr913_PRYVBaOXb3XcHX7AwfXNG2rxcVI8",
            "OfferDisplayData": "{
                \"acceptablePaymentInstrumentTypes\": [\"CreditCard\"],
                \"availabilityDescription\": \"AvailabilityDescription for bc545b24-a8e5-422d-bcca-ed1ed5c1dfbc\",
                \"currencyCode\": \"USD\",
                \"displayPrice\": \"$0.00\",
                \"displayListPrice\": \"$0.00\",
                \"distributionType\": \"Full\",
                \"isPurchasable\": true,
                \"listPrice\": 0.0,
                \"price\": 0.0
            }",
            "SignedOffer": "eyJhbGciOiJSUzI1NiIsImtpZCI6IjIzMUZBNzkzQTRENUY3ODc4NUFGQ0FEMEExNTEwRUMwOEJDQURDNTMifQ.eyIkdHlwZSI6Ik9mZmVycy5Db250cmFjdHMuVjMuT2ZmZXIiLCJhY2NlcHRhYmxlUGF5bWVudEluc3RydW1lbnRUeXBlcyI6WyJDcmVkaXRDYXJkIl0sImF2YWlsYWJpbGl0eURlc2NyaXB0aW9uIjoiQXZhaWxhYmlsaXR5RGVzY3JpcHRpb24gZm9yIGJjNTQ1YjI0LWE4ZTUtNDIyZC1iY2NhLWVkMWVkNWMxZGZiYyIsImF2YWlsYWJpbGl0eUlkIjoiN2Q5YWJmOWUtOGQxYy00MWVjLWIxYjAtN2IyMDQ1MTU3MzM2IiwiY3JlYXRlZCI6IjIwMTMtMDQtMTRUMjI6MTc6MjguODYxNjM3OFoiLCJleHBpcmVzIjoiMjAxMy0wOC0xMlQyMjoxNzoyOC44NjE2Mzc4WiIsImlkIjoiZDIwMzljMDctMzBjZi00MzBiLTgxNTQtYjliN2JkNzFiYjY0IiwicHJvZHVjdERlc2NyaXB0aW9uIjp7IiR0eXBlIjoiT2ZmZXJzLkNvbnRyYWN0cy5WMy5Qcm9kdWN0RGVzY3JpcHRpb24iLCJkaXN0cmlidXRpb25UeXBlIjoiRnVsbCIsImdyYW50ZWRFbnRpdGxlbWVudHMiOlt7IiR0eXBlIjoiT2ZmZXJzLkNvbnRyYWN0cy5WMy5FbnRpdGxlbWVudERlc2NyaXB0aW9uIiwiYmlsbGluZ09mZmVySWQiOm51bGwsImNhdGFsb2dPZmZlcklkIjoiMzJlYmQ5ZmUtNmEyMi00MTExLTk1NGUtNTY0ZWM2OWQ4MDJhIiwiY2F0YWxvZ09mZmVySW5zdGFuY2VJZCI6IjMyZWJkOWZlLTZhMjItNDExMS05NTRlLTU2NGVjNjlkODAyYSIsImNvbnRhaW5lcnMiOm51bGwsImRpc3RyaWJ1dGlvblR5cGUiOiJGdWxsIiwiZHVyYXRpb24iOiIxMDY3NTE5OTowMjo0ODowNS40Nzc1ODA3IiwiZW50aXRsZW1lbnRJZCI6IkdhbWU7MzJlYmQ5ZmUtNmEyMi00MTExLTk1NGUtNTY0ZWM2OWQ4MDJhIiwiZW50aXRsZW1lbnRUeXBlIjoiR2FtZSIsInByb2R1Y3RJZCI6IjMyZWJkOWZlLTZhMjItNDExMS05NTRlLTU2NGVjNjlkODAyYSIsInF1YW50aXR5IjpudWxsLCJzYW5kYm94SWQiOiJQQVJULkRldjEiLCJ0aXRsZUlkIjoiMHhGRkZFMDdEMSIsInVvZGJPZmZlcklkIjpudWxsfV0sInByb2R1Y3RJZCI6IjMyZWJkOWZlLTZhMjItNDExMS05NTRlLTU2NGVjNjlkODAyYSIsInByb2R1Y3RUeXBlIjoiREdhbWUiLCJyZWR1Y2VkVGl0bGUiOiJUYW5rcyIsInN1YnNjcmlwdGlvblBvbGljeUlkIjpudWxsfSwicHJpY2UiOnsiJHR5cGUiOiJPZmZlcnMuQ29udHJhY3RzLlYzLlByaWNlIiwiY2FtcGFpZ25TZWdtZW50ZElkIjpudWxsLCJjdXJyZW5jeUNvZGUiOiJVU0QiLCJpc1RheEluY2x1ZGVkIjpmYWxzZSwicHJpY2VDYW1wYWlnbmRJZCI6bnVsbCwicHJpY2VDYXJkSWQiOiI4OTZjZTNhMy0wMDAwLTAwMDAtYWFhYS0wMDE1NWQyNDFjMTgiLCJwcmljZUNvZGUiOm51bGwsInJldGFpbEFtb3VudCI6MC4wLCJza3VzIjpbeyIkdHlwZSI6Ik9mZmVycy5Db250cmFjdHMuVjMuU2t1IiwiYWNjb3VudCI6Ilplcm9Eb2xsYXJTa3UiLCJhbW91bnQiOjAuMCwiYWNjb3VudFR5cGUiOiJSZXZlbnVlIn1dLCJ3aG9sZXNhbGVBbW91bnQiOjAuMH0sInh1aWQiOm51bGx9.LFX_eBwjspSl_n52ysv5avxcDymWFKH2UyJ517D9I6jbkCS9HyEGmqZxmbDPg88qQnRv1Uq0MEvA0v6jjWCKdxYmmjK4PubgmbTQYdgKfas6AjI2P4jQGQILduhgO9YZ6v8DEmihigfanjRwPTi5WhE_2x1mau51mrZBtDERstL9w-mBSkP3Kgu3FT09MNTbqCdDGH1iSpgvNxaXrs336CtEsTLeuy_yvyRvBR-hjxBTo2JH09v5RYQWA8sJ3zmuYxLVe_Cs55DoyCwMwBXbw1tAZE91uyXwQJUFVmZnVxVx9MLQ8EgePJ6BoUpUasp6Jax-mHiBRswsM1V0STGrxQ"
        }],
        "Packages": [{
            "CdnFileLocation": [{
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            },
            {
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            },
            {
                "SortOrder": null,
                "Uri": "https: //update.dnet.xboxlive.com/test_cdn/tanks-randomkey.xvc"
            }],
            "ContentId": "7AE9DAB2-1162-488D-9F80-B804EC5AF879",
            "PackageType": "XVC",
            "LicenseType": "Xbox Live Games Machine and User"
        }],
        "SandboxId": "PART.Dev1"
    }],
    "ImpressionGuid": "8e6bddc2-ded7-4921-b766-b3a887381caa"
}

```


<a id="ID4ENG"></a>


## See also

<a id="ID4EPG"></a>


##### Parent

[/media/{marketplaceId}/details](uri-medialocaledetails.md)


<a id="ID4EZG"></a>


##### Further Information

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)