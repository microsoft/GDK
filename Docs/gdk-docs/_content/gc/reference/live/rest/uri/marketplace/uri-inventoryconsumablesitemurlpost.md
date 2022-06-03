---
title: POST ({itemID})
description: " POST ({itemID})"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# POST ({itemID})
Indicates that all or a portion of a consumable inventory item has been used and decrements the quantity of the consumable by the requested amount.
The domain for these URIs is `inventory.xboxlive.com`.

  * [Remarks](#ID4EX)
  * [URI parameters](#ID4EQB)
  * [Request body](#ID4E2B)
  * [Response body](#ID4ENC)

<a id="ID4EX"></a>


## Remarks

   * If the quantity the caller asked to consume exceeds the remaining supply of the item, the call will be rejected.
   * The quantity the caller asked to consume must be a positive integer above 0. Calls with a consumption value of 0 or lower will be rejected.
   * If the caller provides an empty Transaction ID, the request will be rejected.
   * If available the title claim will be logged so that it will be possible to determine which title is reporting the consumption.
   * Additional POSTs with the same transactionId will be ignored for some time period.


> **Note:**  
> The <b>x-xbl-contract-version header</b> for this API is "4".


<a id="ID4EQB"></a>


## URI parameters

| Parameter| Type| Description|
| --- | --- | --- | --- |
| itemID| string| the ID unique to each user for a singular inventory item|

<a id="ID4E2B"></a>


## Request body

<a id="ID4EBC"></a>


### Sample request


```cpp
{
  "transactionId": String
  "removeQuantity": Int
}

```


The remove quantity field allows the caller to indicate the quantity of consumable they wish to remove from the consumable's remaining quantity. The Transaction ID field provides the caller with a means to retry using consumable content operations while limiting the risk of counting the same usage twice.

<a id="ID4ENC"></a>


## Response body

The response to the POST, assuming it passes authentication and is assigned the appropriate authorization context is a an acknolodgement of receipt with the same transactionId passed to the service in the POST request, the consumable item's URL, and the item's new quantity value.

<a id="ID4EVC"></a>


### Sample response


```cpp
{
  "transactionId": String
  "url": String
  "newQuantity": Int
}

```


<a id="ID4E6C"></a>


## See also

<a id="ID4EBD"></a>


##### Parent

[/users/me/consumables/{itemID}](uri-inventoryconsumablesitemurl.md)


<a id="ID4ELD"></a>


##### Further Information

[EDS Common Headers](../../additional/edscommonheaders.md)

 [EDS Parameters](../../additional/edsparameters.md)

 [EDS Query Refiners](../../additional/edsqueryrefiners.md)

 [Marketplace URIs](atoc-reference-marketplace.md)

 [Additional Reference](../../additional/atoc-xboxlivews-reference-additional.md)