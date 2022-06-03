---
author: M-Stahl
title: XSpeechToTextCancelHypothesisString
description: Cancels a hypothesis and removes its string from a text overlay.
kindex: XSpeechToTextCancelHypothesisString
ms.author: v-sahain
ms.topic: reference
edited: 10/16/2020
security: public
applies-to: pc-gdk
---

# XSpeechToTextCancelHypothesisString  

Cancels a hypothesis and removes its string from a text overlay.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XSpeechToTextCancelHypothesisString(  
         uint32_t hypothesisId  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*hypothesisId* &nbsp;&nbsp;\_In\_  
Type: uint32_t  

The hypothesis ID that was returned by [XSpeechToTextBeginHypothesisString](xspeechtotextbeginhypothesisstring.md).  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

This function cancels a hypothesis and removes its string from the overlay.  

The overlay can display only a limited number of strings. When the maximum is reached, older strings are expired. If an expired string is a hypothesis that is not yet finalized or canceled, its *hypothesisId* value becomes invalid. Passing an invalid *hypothesisId* value does not return an error.  

To update a hypothesis string in the overlay, use [XSpeechToTextUpdateHypothesisString](xspeechtotextupdatehypothesisstring.md).  

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
  