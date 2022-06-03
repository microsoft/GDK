---
author: M-Stahl
title: FileTypeAssociation Element (MicrosoftGame.config)
description: MicrosoftGame.config Reference for FileTypeAssociation Element.
kindex: FileTypeAssociation
ms.author: zhooper
ms.topic: conceptual
edited: 01/06/2020
security: public
---

# MicrosoftGame.config Element - FileTypeAssociation

Allows a file type to be associated with an executable in your package. An example would be a specific extension for a title’s map editor.

## Parent
This element's parent is the DesktopRegistration element.

## Requirement
This element is optional and is not required to be set. 

## Platform
This element only pertains to PC devices.

## Behavior
* Attributes are Name and Executable.
* Name attribute does not have a default value.
* Executable attribute will default to the first executable in your titles ExecutableList element.
* Allowed value for Name attribute is a string of up to 100 lowercase characters with no spaces.
* Allowed value for Executable attribute is an executable name that should match Name in your Executable element.
* Allowed values are child elements of:
  * DisplayName
  * Logo
  * InfoTip
  * EditFlags
  * SupportedFileTypes

## Remarks

### FileTypeAssociation example
FileTypeAssociation is a child element of the DesktopRegistration node. It can be used to enable usage of additional files associated with an executable on PC. The primary use case for this would be a custom mod or map. See following example of this implementation as reference:

```xml  
<FileTypeAssociation Name="MyModExtension">
  <DisplayName>ExampleFriendlyName</DisplayName>
  <EditFlags OpenIsSafe=”true” AlwaysUnsafe=”false”>
  <InfoTip>ExampleInfo</InfoTip>
  <Logo>ExampleLogo.png</Logo>
  <SupportedFileTypes>
    <FileType>.mod</FileType>
  </SupportedFileTypes>
  <Executable>MyGame.exe</Executable>
</FileTypeAssociation>
```

## See Also
[MicrosoftGame.config Reference - Table of Contents](gc-microsoftgameconfig-toc.md)  