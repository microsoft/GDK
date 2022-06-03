---
author: joannaleecy
title: XblMultiplayerGetSearchHandlesAsync
description: Search for sessions by their associated search handles.
kindex: XblMultiplayerGetSearchHandlesAsync
ms.author: migreen
ms.topic: reference
security: public
edited: 00/00/0000
applies-to: pc-gdk
quality: good
---

# XblMultiplayerGetSearchHandlesAsync  

Search for sessions by their associated search handles.  

## Syntax  
  
```cpp
HRESULT XblMultiplayerGetSearchHandlesAsync(  
         XblContextHandle xblContext,  
         const char* scid,  
         const char* sessionTemplateName,  
         const char* orderByAttribute,  
         bool orderAscending,  
         const char* searchFilter,  
         const char* socialGroup,  
         XAsyncBlock* async  
)  
```  
  
### Parameters  
  
*xblContext* &nbsp;&nbsp;\_In\_  
Type: [XblContextHandle](../../types_c/handles/xblcontexthandle.md)  
  
Xbox live context for the local user.  
  
*scid* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The Service Configuration ID (SCID) within which to query for search handles. The SCID is considered case sensitive so paste it directly from the Partner Center  
  
*sessionTemplateName* &nbsp;&nbsp;\_In\_z\_  
Type: char*  
  
The name of the template to query for search handles.  
  
*orderByAttribute* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
This specifies the attribute to sort the search handles by. Pass empty string to default to ordering by 'Timestamp asc'.  
  
*orderAscending* &nbsp;&nbsp;\_In\_  
Type: bool  
  
Pass true to order ascending, false to order descending.  
  
*searchFilter* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The query string to get the search handles for.  
  
*socialGroup* &nbsp;&nbsp;\_In\_opt\_z\_  
Type: char*  
  
The social group to get the search handles for.  
  
*async* &nbsp;&nbsp;\_In\_  
Type: XAsyncBlock*  
  
The AsyncBlock for this operation.  
  
  
### Return value  
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
**Filtering search handles:** The query syntax is an OData like syntax with only the following operators supported EQ, NE, GE, GT, LE and LT along with the logical operators of AND and OR. Example 1: To filter for search handles for a specific XboxUserId use "MemberXuids/any(d:d eq '12345678')" or "OwnerXuids/any(d:d eq '12345678')" Example 2: To filter for search handles for a title defined string metadata use "Strings/stringMetadataType eq 'value'" Example 3: To filter for search handles for a title defined numbers metadata AND a tag type value use "Numbers/numberMetadataType eq 53 AND Tags/tagType eq 'value'" **Empty filter and social group:** Since searchFilter and socialGroup are optional, please make sure to pass in a nullptr if they aren't needed/used. Passing in an empty string "" will **not** work.
  
## Requirements  
  
**Header:** multiplayer_c.h
  
**Library:** Microsoft.Xbox.Services.141.GSDK.C.lib
  
## See also  
[multiplayer_c](../multiplayer_c_members.md)  
  
  