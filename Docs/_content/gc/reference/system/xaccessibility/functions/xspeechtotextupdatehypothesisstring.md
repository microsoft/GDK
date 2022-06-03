---
author: M-Stahl
title: XSpeechToTextUpdateHypothesisString
description: Updates a hypothesis string in a text overlay.
kindex: XSpeechToTextUpdateHypothesisString
ms.author: v-sahain
ms.topic: reference
edited: 10/16/2020
security: public
applies-to: pc-gdk
---

# XSpeechToTextUpdateHypothesisString  

Updates a hypothesis string in a text overlay.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XSpeechToTextUpdateHypothesisString(  
         uint32_t hypothesisId,  
         const char* content  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*hypothesisId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The hypothesis ID that was returned by [XSpeechToTextBeginHypothesisString](xspeechtotextbeginhypothesisstring.md).  

*content* &nbsp;&nbsp;\_In\_z\_  
Type: char\*  

The updated hypothesis string.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

This function updates a hypothesis string in place without moving it to the bottom of the overlay.  

The overlay can display only a limited number of strings. When the maximum is reached, older strings are expired. If an expired string is a hypothesis that is not yet finalized or canceled, its *hypothesisId* value becomes invalid. Passing an invalid *hypothesisId* value does not return an error.  

To cancel a hypothesis and remove it from the overlay, use [XSpeechToTextCancelHypothesisString](xspeechtotextcancelhypothesisstring.md).  

To finalize a hypothesis, use [XSpeechToTextFinalizeHypothesisString](xspeechtotextfinalizehypothesisstring.md).  

On some platforms, the hypothesis string is not displayed until the app calls `XSpeechToTextFinalizeHypothesisString`. Unless the hypothesis is canceled, your app must always call `XSpeechToTextFinalizeHypothesisString` to ensure that the string is displayed.  

For code examples, see the [Remarks](xspeechtotextbeginhypothesisstring.md#remarksSection) section of [XSpeechToTextBeginHypothesisString](xspeechtotextbeginhypothesisstring.md).  

<a id="requirementsSection"></a>

## Requirements  

**Header:** XAccessibility.h  

**Library:** xgameruntime.lib  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XAccessibility](../xaccessibility_members.md)  
  