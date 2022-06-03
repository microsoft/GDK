---
author: sdgmiller
title: Associating your Unity project with the Microsoft Store
description: Describes how to associate your Unity project with the Microsoft Store by using the Store Association Wizard.
kindex:
- Associating your Unity project with the Microsoft Store
- Store Association Wizard
- Unity Store
ms.author: zhooper
ms.topic: conceptual
edited: 11/16/2020
security: public
---

# Associating your Unity project with the Microsoft Store

Use this topic to update your Unity project by using the Store Association Wizard and Microsoft Store data.

## Microsoft Game Configuration Editor overview

After importing the [GDK Unity package](../gdk-unity-overview.md), the GDK menu option appears in your project. Select **Associate with the Microsoft Store** to launch the Microsoft Game Configuration Editor (also known as the MicrosoftGame.config Editor) dialog box. Use this editor to configure key information that's required to get your title set up in the Microsoft Game Development Kit as shown in the following screenshot.

![Screenshot of the MicrosoftGame.config Editor dialog box](../../../../../resources/gamecore/secure/images/en-us/gdk_unity_editor1.png)

You can configure various key parts of your Unity project by using the MicrosoftGame.config Editor as shown in the following table.

| Feature | Description |
| --- | --- |
| Store Information | Describes the usage of the Store Association Wizard and opens the app to associate your project by using the Microsoft Store. |
| Publisher | Due to a limitation, we require that you manually gather the Publisher string from Partner Center. This feature details how to input the Publisher string and how to find it by using a direct link to Partner Center. |
| Tile Image | Includes a tile image for your product. Updating the base 480 &#215; 480 image in PNG format automatically generates representative images for the other formats that are required for packaging and the Microsoft Store. |
> [!NOTE]
> The input for the Tile Image must be 480 &#215; 480 pixels and in PNG format.

Use the PC tab of the MicrosoftGame.config Editor to specify if your PC title is a multiplayer title as shown in the following screenshot. The editor provides a link to your MicrosoftGame.config so that you can review and edit other elements of your title. For more information about MicrosoftGame.config elements and usage, see [MicrosoftGame.config reference](../../../reference/system/microsoftgameconfig/microsoftgameconfig-schema.md).

![Screenshot of the PC tab in the MicrosoftGame.config Editor dialog box](../../../../../resources/gamecore/secure/images/en-us/gdk_unity_editor2.png)
> [!NOTE]
> Before going to the next section, your title must be configured with Xbox Live enabled in [Partner Center](https://partner.microsoft.com/dashboard).

## Store Association Wizard overview

The Store Association Wizard gathers a set of information about your title from Partner Center. Your product information must be submitted to Partner Center before opening the Store Association Wizard. Use the Microsoft account that has permissions to your project in Partner Center to validate that the submission is complete.

The Store Association Wizard walks you through the process of accessing and choosing your product. The Store Association Wizard returns a list of values for the IDs that it writes to your MicrosoftGame.config as shown in the following screenshot.

![Screenshot of the values that are returned in the Associate your Game with the Microsoft Store dialog box](../../../../../resources/gamecore/secure/images/en-us/gdk_unity_editor3.png)
> [!NOTE]
> After completing the Store Association Wizard, select **Save** in the MicrosoftGame.config Editor to write the changes to your MicrosoftGame.config for your project.

## ProjectMetadata of your Unity project

The MicrosoftGame.config images and Microsoft Store images that are associated with your product are found by selecting **GDK-PC** > **ProjectMetadata** in the Assets tree as shown in the following screenshot.

![Screenshot of the ProjectMetadata that's found in your MicrosoftGame.config project](../../../../../resources/gamecore/secure/images/en-us/gdk_unity_projectdata.png)

