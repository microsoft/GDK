---
title: PagingInfo (JSON)
description: " PagingInfo (JSON)"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# PagingInfo (JSON)
Contains paging information for results that are returned in pages of data. 
<a id="ID4EN"></a>

 
## PagingInfo
 
| Member| Type| Description| 
| --- | --- | --- | 
| continuationToken| string| An opaque continuation token used to access the next page of results. Maximum 32 characters.Callers can supply this value in the <b>continuationToken</b> query parameter in order to retrieve the next set of items in the collection. If this property is <b>null</b>, then there are no additional items in the collection. This property is required and is provided even if the collection is being paged with <b>skipItems</b>.| 
| totalItems| 32-bit signed integer| The total number of items in the collection. This is not provided if the service is unable to provide a real-time view into the size of the collection.| 
  
<a id="ID4E4B"></a>

 
## Sample JSON syntax
 

```json
{
   "continuationToken":"16354135464161213-0708c1ba-147f-48cc-9ad9-546gaadg648"
   "totalItems":5,
}
    
```

  
<a id="ID4EGC"></a>

 
## See also
 
<a id="ID4EIC"></a>

 
##### Parent 

[JavaScript Object Notation (JSON) Object Reference](atoc-xboxlivews-reference-json.md)

   