---
title: Xbox Common Events Tool (XceTool.exe)
description: Generates various items from an Xbox Common Events manifest.
kindex:
- Xbox Common Events Tool (XceTool.exe)
- xbox common events
- events, event manifest
ms.topic: conceptual
ms.localizationpriority: medium
author: joannaleecy
ms.author: migreen
ms.date: '09/23/2020'
edited: 00/00/0000
security: public
---

# Xbox Common Events Tool (XceTool.exe)

The Xbox Common Events Tool (XceTool) is a command-line tool that generates an Event Tracing for Windows (ETW) manifest 
and/or generates a header file from an Xbox Common Events (XCE) manifest. The generated header 
defines wrappers for the specified platform for the service calls necessary to write the events 
specified in the manifest. The XCE manifest for a title can be downloaded through Partner 
Center once an event schema has been defined and published.

The Xbox Common Events Tool (**XceTool.exe**) can be found as part of the GDK and `XboxLiveTools.zip`; see [Development tools for Xbox Live](live-tools.md).

## Usage

XceTool takes an XCE manifest file as the first and only required argument, and can be followed 
with any number of options. If no additional options are provided, XceTool does not do anything.

`xcetool <manifest.man> [-option1] <option1Args> [-option2] <option2Args> ...`

| Option | Description |
| ------ | ----------- |
| `-c <header.h>` | Creates a console language header file of the given filename from an XCE format manifest. |
| `-target <DurangoStandard|DurangoHostKernel|DurangoHostUser>` | Used with -c to specify the target operating environment of the generated code. |
| `-etw <manifest.man>` | Create an ETW format manifest of the given file name from an XCE format manifest. Must be used with -exe. |
| `-etw2 <manifest.man>` | Create an ETW format manifest of the given filename from an XCE format manifest for WinRT. Must be used with -exe. |
| `-exe <executable.exe>` | Used with -etw or -etw2 to specify the name of the executable file containing the provider definition. |
| `-etx <manifest.man>` | Takes the XCE manifest and outputs that same manifest but with the PartB fields expanded out and fully defined. If this option is used, no other output will be written. See **Examples** below. |
| `-namespace <namespace>` | Projection namespace for the manifest provider. |
| `-x <header.h>` | Generates a Common Schema 2 style header that wraps the XSAPI C++ write_in_game_event API with the event schema you have defined on XDP. See the [Events Overview](../../features/player-data/stats-leaderboards/event-based/events/live-game-events.md) article for more information. |
| `-xwinrt <header.h>` | Generates a Common Schema 2 style header that wraps the XSAPI WinRT WriteInGameEvent API with the event schema you have defined on XDP. See the [Events Overview](../../features/player-data/stats-leaderboards/event-based/events/live-game-events.md) article for more information. |
| `-xc <header.h>` | Generates a Common Schema 2 style header that wraps the XSAPI C XblEventsWriteInGameEvent API with the event schema you have defined on XDP. See the [Events Overview](../../features/player-data/stats-leaderboards/event-based/events/live-game-events.md) article for more information. |
| `-q` | Quiet mode – minimal logging. |

## Examples

`-etx`  
Takes the XCE manifest and outputs that same manifest but with the PartB fields expanded out and fully defined.  
**BEFORE:**  
```
		<Event Name="ButtonPress" PopulationSampleRate="ProviderDefault" Latency="ProviderDefault" Priority="ProviderDefault" UploadEnabled="ProviderDefault">;
          <PartB Abbreviation="UPA" Version="4">
            <Fields />
          </PartB>
          <PartC Version="1">
            <Fields>
              <Field Name="Button" Type="UnicodeString">
                <Description>The button that was pressed.</Description>
              </Field>
              <Field Name="ElapsedSeconds" Type="Float">
                <Description>The number of seconds that the button was held down for.</Description>
              </Field>
            </Fields>
          </PartC>
        </Event>
```
**AFTER:**  
```
		<Event Name="ButtonPress" PopulationSampleRate="ProviderDefault" Latency="ProviderDefault" Priority="ProviderDefault" UploadEnabled="ProviderDefault">
          <PartB Abbreviation="UPA" Domain="UI Application Navigation" Part="B" ShortName="PageAction" Version="4">
            <Fields>
              <Field Name="UserId" Type="UnicodeString">
                <Description>XUID with context of the event</Description>
              </Field>
              <Field Name="ActionTypeId" Type="Int32">
                <Description>Canonical Id of button or action invoked, from DimActionType.</Description>
              </Field>
              <Field Name="ActionInputMethodId" Type="Int32">
                <Description>Canonical Id of method used for action (-1=Unknown, 0=Other, 1=Controller, 2=Voice, 3=Gesture, 4=Remote, 5=Keyboard, 6=Mouse,
                7=SmartGlass, 8=Touch)</Description>
              </Field>
              <Field Name="PageUri" Type="UnicodeString">
                <Description>Canonical path of page in URI format (i.e. provider://toplevel/midlevel/page), including parameters.</Description>
              </Field>
              <Field Name="PageName" Type="UnicodeString">
                <Description>Canonical name of the displayed page</Description>
              </Field>
              <Field Name="PageTypeId" Type="Int32">
                <Description>Type Id of page shown. (-1=Unknown, 0=Other, 1=App Page, 2=Web-Blend, 3=Web Page, 4=Pop-up, 5=Charm, 6=Game Menu, 7=App Bar,
                11=App Scene)</Description>
          </Field>
          <Field Name="TemplateId" Type="UnicodeString">
                <Description>Unique Id for page layout.</Description>
          </Field>
              <Field Name="DestPageUri" Type="UnicodeString">
                <Description>Canonical path of destination page invoked by action in URI format (i.e. provider://toplevel/midlevel/page), including
                parameters.</Description>
              </Field>
              <Field Name="DestPageTypeId" Type="Int32">
                <Description>Type Id of destination page invoked by action. (1=Dash, 2=WebBlend, 3=WebPage, 4=Pop-up, 5=Charm, 6=GameMenu, 7=AppBar)</Description>
          </Field>
              <Field Name="ScreenStateId" Type="Int32">
                <Description>Describes the state of the application on the screen such as "Full" or "Minimized". (-1= Unknown, 0=Other, 1=Full Screen /
                Maximized, 2=Windowed / Restored, 3=Minimized / Hidden / Background, 4=Snapped 1/3, 5=Snapped 1/2, 6=Snapped 2/3, 7=Snapped Other, 8=Snapped 3/4,
                9=Snapped 1/4)</Description>
              </Field>
              <Field Name="CampaignId" Type="UnicodeString">
                <Description>Unique Id of the campaign or experiment the content belongs to.</Description>
              </Field>
              <Field Name="GroupId" Type="UnicodeString">
                <Description>Unique Id of the group, segment, or treatment that receives the content.</Description>
              </Field>
              <Field Name="ContentJsonVersion" Type="Float">
                <Description>The schema version of the content JSON blob in the Content field.</Description>
              </Field>
              <Field Name="Content" Type="UnicodeString">
                <Description>JSON formatted metadata and location of asset or content item the PageAction was performed upon.</Description>
              </Field>
            </Fields>
            <Description>
              PageAction: an event presenting information on any action a user takes within a UI, using a controller, gesture, voice control, touch, or other method.
            </Description>
          </PartB>
          <PartC Version="1">
            <Fields>
              <Field Name="Button" Type="UnicodeString">
                <Description>The button that was pressed.</Description>
              </Field>
              <Field Name="ElapsedSeconds" Type="Float">
                <Description>The number of seconds that the button was held down for.</Description>
              </Field>
            </Fields>
          </PartC>
        </Event>
```