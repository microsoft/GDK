---
author: M-Stahl
title: 'Intelligent Delivery: devices specifiers'
description: Describes how to use Intelligent Delivery to control which devices a chunk should be installed on.
kindex: Intelligent Delivery- Devices Specifiers
ms.author: brianhud
ms.topic: conceptual
edited: '08/05/2019'
security: public
---

# Intelligent Delivery: device specifiers
   
  
Device specifiers declare the Xbox One family consoles and Xbox Series consoles to which the content in an installation chunk is applicable. Device specifiers allow you to offer the highest-fidelity experiences possible on a console generation, without causing unnecessary downloads for users who aren't using the highest end console for that generation. In the Xbox One family family of devices, you could mark some content, like HDR graphics, as chunks that only need to be downloaded on Xbox One X devices. This will allow Xbox One and Xbox One S users to have more efficient downloads that do not include HDR assets that aren't supported by those devices. Some content will be common to both consoles. For example, audio assets might be identical for any device on which the title is running. Chunks containing those assets will not have a device specifier.
   
  
Device specifiers enable the following scenarios.   
   
   *  When shipping new titles for devices across the entire Xbox family of consoles, you can declare which content is needed only on the higher end devices of the console family. Content without a device specifier is installed to all consoles. For more information, see the [Packaging design for new titles](intelligentdelivery-device.md#new-title) section.   

   * By adding new chunks with the higher-fidelity assets, you can update an existing title to support the higher resolution on Xbox One X or Xbox Series X devices. If you mark these new chunks with the correct device specifier, gamers who already have your title installed on Xbox One, Xbox One S, or Xbox Series S consoles aren't adversely affected. For more information, see the section on [specifying assets only for Xbox One X or Anaconda devices](intelligentdelivery-device.md#existing-title).  

 
<a id="new-title"></a>

   

## Packaging design for new titles which run on multiple devices in the same generation with specialized per-device assets  
   
  
New titles that ship simultaneously for Xbox One, Xbox One S, and Xbox One X devices, or on Xbox Series S and Xbox Series X devices can use Intelligent Delivery to target specific device types with specific content. There are two general strategies for targeting assets.   
   
   *  [Tuning specific content to each device class](intelligentdelivery-device.md#ID4ERD)  
   *  [Declaring additive assets to the highest capability device within the same generation (Xbox One X, Anaconda)](intelligentdelivery-device.md#console-specific)  

 
<a id="ID4ERD"></a>

   

### Tuning specific content to each device class  
   
  
One strategy for targeting assets for different devices is to tune specific content to each device within the same generation. In this scenario, your title packages device-specific assets into chunks that target a specific device.   
   > [!NOTE]
> File names and paths can't be duplicated across different chunks, even if only one of the chunks containing the duplicates is installed at a time. We recommend that you either group your files into chunks according to the folder name, such as by grouping all higher-resolution assets in a specific folder, or that you modify the file names in a way that allows your title to disambiguate them, such as by appending "_sco" or "_ana" to the file name.   
  
The following example segments of a layout.xml file declares two chunks that are targeted for different devices. At installation time, the system determines whether to install chunk 2001 or chunk 2002, according to the hardware device type.   

For Xbox One generation:

```xml
<Chunk Id="2001" Devices="Xbox-Durango">
    <FileGroup DestinationPath="\Data\Maps\XboxOneOnly\LightMaps"             SourcePath="Y:\Maps\Level1\XboxOneOnly\LightMaps" Include="*.map"/>
<Chunk>
<Chunk Id="2002" Devices="Xbox-Scorpio">
    <FileGroup DestinationPath="\Data\Maps\Scorpio\HiResLightMaps"             SourcePath="Y:\Maps\Level1\Scorpio\HiResLightMaps" Include="*.map"/>
<Chunk>  
```

For Lockhart and Anaconda devices:
```xml
<Chunk Id="2001" Devices="Xbox-Lockhart">
    <FileGroup DestinationPath="\Data\Maps\LockhartOnly\LightMaps"             SourcePath="Y:\Maps\Level1\LockhartOnly\LightMaps" Include="*.map"/>
<Chunk>
<Chunk Id="2002" Devices="Xbox-Anaconda">
    <FileGroup DestinationPath="\Data\Maps\Anaconda\HiResLightMaps"             SourcePath="Y:\Maps\Level1\Anaconda\HiResLightMaps" Include="*.map"/>
<Chunk>  
```


### Getting the device type

At runtime, your title should use [XSystemGetDeviceType](../reference/system/xsystem/functions/xsystemgetdevicetype.md) method to determine which device the title is running on, and it should use the appropriate set of assets based on that information.


```cpp
#include <XSystem.h>

XSystemDeviceType deviceType = XSystemGetDeviceType();

switch (deviceType)
{
case XSystemDeviceType::Pc:                     ... break;
case XSystemDeviceType::XboxOne:                ... break;   //Xbox-Durango device specifier tag
case XSystemDeviceType::XboxOneS:               ... break;   //Xbox-Durango device specifier tag
case XSystemDeviceType::XboxOneX:               ... break;   //Xbox-Scorpio device specifier tag
case XSystemDeviceType::XboxOneXDevkit:         ... break;
case XSystemDeviceType::XboxScarlettLockhart:   ... break;   //Xbox-Lockhart device specifier tag
case XSystemDeviceType::XboxScarlettAnaconda:   ... break;   //Xbox-Anaconda device specifier tag
case XSystemDeviceType::XboxScarlettDevkit:     ... break;
case XSystemDeviceType::Unknown:                ... break;
}
```
  
The [XSystemGetDeviceType](../reference/system/xsystem/functions/xsystemgetdevicetype.md) values for retail consoles correspond to device specifier tags you will use in your layout.xml file. Note that Xbox-Durango is the device specifier tag for both the Xbox One and Xbox One S.
  

|Device Specifier Tag  |XSystemDeviceType  |
|---------|---------|
|Xbox-Durango      |Xbox One<br />Xbox One S  |
|Xbox-Scorpio      |Xbox One X                |
|Xbox-Lockhart     |Xbox Series S       |
|Xbox-Anaconda     |Xbox Series X       |

The device specifier tags are the values you will use in the layout.xml fie.

<a id="console-specific"></a>

   

### Declaring Xbox One X&ndash;specific or Anaconda-specific assets  
   
  
The second strategy for targeting specific devices is to declare additional assets that install only on a specific console device within a generation. In this scenario, all assets common to both consoles are placed in chunks without device specifiers. Xbox One X&ndash;specific or Anaconda-specific assets are placed into their own chunk.   
   
<a id="existing-title"></a>

   

## Specifying assets only for Xbox One X or Anaconda devices  
   
  
To add assets specific to a device to your title, identify the assets applicable only to that device, isolate them into new chunks in your layout.xml file, and then apply the Xbox-Durango or Xbox-Anaconda device specifier to them. This is shown in the following examples.   

Xbox One Generation   
```xml
<Chunk Id="2002" Devices="Xbox-Scorpio">
    <FileGroup DestinationPath="\Data\Maps\Scorpio\HiResLightMaps"             SourcePath="Y:\Maps\Level1\Scorpio\HiResLightMaps" Include="*.dat"/>
<Chunk>  
```
   
Xbox Series X&#124;S Generation
```xml
<Chunk Id="2002" Devices="Xbox-Anaconda">
    <FileGroup DestinationPath="\Data\Maps\Anaconda\HiResLightMaps"             SourcePath="Y:\Maps\Level1\Anaconda\HiResLightMaps" Include="*.dat"/>
<Chunk>  
```
  
<a id="ID4EYH"></a>

   

## See also  
 [Intelligent Delivery](overviews/intelligentdelivery.md)    
 [XSystemGetDeviceType](../reference/system/xsystem/functions/xsystemgetdevicetype.md)

