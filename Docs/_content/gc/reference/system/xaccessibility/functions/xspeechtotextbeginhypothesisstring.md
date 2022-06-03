---
author: M-Stahl
title: XSpeechToTextBeginHypothesisString
description: Begins a hypothesis and displays its string in a text overlay.
kindex: XSpeechToTextBeginHypothesisString
ms.author: v-sahain
ms.topic: reference
edited: 10/16/2020
security: public
applies-to: pc-gdk
---

# XSpeechToTextBeginHypothesisString  

Begins a hypothesis and displays its string in a text overlay.  

<a id="syntaxSection"></a>

## Syntax  

```cpp
HRESULT XSpeechToTextBeginHypothesisString(  
         const char* speakerName,  
         const char* content,  
         XSpeechToTextType type,  
         uint32_t* hypothesisId  
)  
```  

<a id="parametersSection"></a>

### Parameters  

*speakerName* &nbsp;&nbsp;\_In\_z\_  
Type: char\*  

The name of the speaker to be displayed with the hypothesis string.  

*content* &nbsp;&nbsp;\_In\_z\_  
Type: char\*  

The initial hypothesis string.  

*type* &nbsp;&nbsp;\_In\_  
Type: [XSpeechToTextType](../enums/xspeechtotexttype.md)  

The source type of the hypothesis string.  

*hypothesisId* &nbsp;&nbsp;\_Out\_  
Type: uint32_t\*  

The ID of the hypothesis.  

<a id="retvalSection"></a>

### Return value  

Type: HRESULT  

HRESULT success or error code.  

<a id="remarksSection"></a>

## Remarks  

A hypothesis is a guess at what a speaker is saying, typically produced by a speech recognizer while the speaker is in mid-phrase. The speech-to-text overlay API can display a hypothesis string over a game surface.  

The speech-to-text overlay API also supports typed text. The *type* parameter identifies the source of the hypothesis string.  

The app is responsible for retaining the value of *hypothesisId* until the hypothesis is either finalized or canceled.  

To update a hypothesis string in the overlay, use [XSpeechToTextUpdateHypothesisString](xspeechtotextupdatehypothesisstring.md).  

To cancel a hypothesis and remove it from the overlay, use [XSpeechToTextCancelHypothesisString](xspeechtotextcancelhypothesisstring.md).  

To finalize a hypothesis, use [XSpeechToTextFinalizeHypothesisString](xspeechtotextfinalizehypothesisstring.md).  

On some platforms, the hypothesis string is not displayed until the app calls `XSpeechToTextFinalizeHypothesisString`. Unless the hypothesis is canceled, your app must always call `XSpeechToTextFinalizeHypothesisString` to ensure that the string is displayed.  

The following code example shows an app creating a hypothesis, updating it, and then finalizing it.  

```cpp
void RowanHypothesisSample() 
{ 
    UINT32 hypothesisId; 
    XSpeechToTextBeginHypothesisString("Rowan", "I am typing some text.", XSpeechToTextType::Text, &hypothesisId); 
 
    // Some time passes. 
 
    XSpeechToTextUpdateHypothesisString(hypothesisId, "I am still typing some text."); 
 
    // Some time passes. 
 
    XSpeechToTextFinalizeHypothesisString(hypothesisId, "I typed some text. I am done typing."); 
} 
```

The following code example shows an app creating a hypothesis, updating it, and then canceling it.  

```cpp
void QuincyHypothesisSample() 
{ 
    UINT32 hypothesisId; 
    XSpeechToTextBeginHypothesisString("Quincy", "I am speaking some text.", XSpeechToTextType::Voice, &hypothesisId); 
 
    // Some time passes. 
 
    XSpeechToTextUpdateHypothesisString(hypothesisId, "I am still speaking some text."); 
 
    // Some time passes. 
 
    XSpeechToTextCancelHypothesisString(hypothesisId); 
} 
```

<a id="requirementsSection"></a>

## Requirements  

**Header:** XAccessibility.h  

**Library:** xgameruntime.lib  

**Supported platforms:** Windows, Xbox One family consoles and Xbox Series consoles  

<a id="seealsoSection"></a>

## See also  

[XAccessibility](../xaccessibility_members.md)  
  