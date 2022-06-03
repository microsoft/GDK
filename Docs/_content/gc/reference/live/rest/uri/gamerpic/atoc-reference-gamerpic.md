---
title: Gamerpic URIs
description: " Gamerpic URIs"
ms.date: 10/12/2017
ms.topic: article
keywords: xbox live, xbox, games, uwp, windows 10, xbox one
ms.author: joanlee
security: public
author: joannaleecy
---

# Gamerpic URIs
 
This section provides detail about the Gamerpic Universal Resource Identifier (URI) addresses and associated Hypertext Transport Protocol (HTTP) methods from Xbox Live Services for *gamerpics*.
 
The domain for these URIs is `gamerpics.xboxlive.com`.
 
The Gamerpic Service has been designed to give users more personalization options, by granting a title the ability to allow the user to generate a gamerpic of their game character (a game character in this scenario refers to an in-game protagonist; it could be a person, a car, a spaceship, or any other entity that the user controls in the title).
 
The basic flow of generating a title gamerpic is as follows:
 
   * The title provides the user with the ability to create an image of their in-game character. 
     * If not, the title can then message the user that they do not have the appropriate privilege.
     * If the user does have the privilege, the user can continue to create their character gamerpic.
  
   * The user creates the image and the title sends the 1080x1080 .png file to the gamerpic service.
   * The service stores the image and sets the image as the user's new gamerpic.
   * Any experiences calling for the user's gamerpic will get the updated image.
  
The ability to set a title gamerpic is controlled by an enforcement-only privilege (211). If enforcement revokes the privilege, the user will be prevented from saving a title gamerpic, and the service will return 403. Titles should call CheckPrivilege to verify that users are permitted to share content (priv 211).
 
Presently, in order to use this service, your title must be allow listed. To request approval, email `slsgamerpics@microsoft.com`.
 
<a id="ID4EGC"></a>

 
## In this section

[/users/me/gamerpic](uri-usersmegamerpic.md)

&nbsp;&nbsp;Accesses a 1080x1080 gamerpic.
 
<a id="ID4EMC"></a>

 
## See also
 
<a id="ID4EOC"></a>

 
##### Parent 

[Universal Resource Identifier (URI) Reference](../atoc-xboxlivews-reference-uris.md)

   