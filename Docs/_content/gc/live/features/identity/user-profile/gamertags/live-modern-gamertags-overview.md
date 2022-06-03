---
title: Modern gamertags overview
description: Describes how modern gamertags support a broad range of UTF-8 characters and enable users to have a unique gamertag.
kindex:
- Modern gamertags overview
- gamertags
author: joannaleecy
ms.author: rlehew
ms.topic: conceptual
ms.localizationpriority: medium
edited: 10/04/2021
security: public
---

# Modern gamertags overview

Use this topic to incorporate Xbox Live modern gamertags into your title. 

With hundreds of millions of Xbox Live accounts that have been created since 2002, the Xbox Live gamertag namespace was saturated. This made it difficult for users to find a unique name to personalize their experience on Xbox Live.
And with the inclusion of more regions and languages, Xbox needed to support a broader set of characters in gamertags.  
  
With these factors in mind, Xbox has substantially enhanced the capabilities of gamertags to support *Unicode (Universal Coded Character Set) Transformation Format 8-bit (UTF-8)* characters across worldwide alphabets and duplicate gamertags.

With the launch of the new Xbox PC app and Xbox Game Bar on Windows 10, users can create modern gamertags or change their "classic gamertag".

For more information about modern gamertags, see [Express Yourself with New Gamertag Features](https://news.xbox.com/2019/06/10/express-yourself-with-new-gamertag-features/) and [Gamertag update FAQ](https://support.xbox.com/en-US/help/account-profile/profile/gamertag-update-faq).  
  
<a id="modgtexamples"></a>
## Examples of modern gamertags

| Suggested rendering | Unique modern gamertag | Modern gamertag | Suffix | Classic gamertag |
| --- | --- | --- | --- | --- |
| P3 | P3 | P3 |  | P3 |
| **Dragon**<font color='gray' size='2'>#1652</font> | Dragon#1652 | Dragon | 1652 | Dragon1652 |
| ![Screenshot of a Unicode gamertag spelling out "House Party" with unique characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_houseparty8810_suggested_rendering.png) | ![Screenshot of a Unicode gamertag spelling out "House Party" with unique characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_houseparty8810_unique_modern_gamertag.png) | ![Screenshot of a Unicode gamertag spelling out "House Party" with unique characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_houseparty8810_modern_gamertag.png) | 8810 | HOusePaRTy8810 |
| ![Screenshot of a Unicode gamertag with Korean Hangul characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_player8423_2400_suggested_rendering.png) | ![Screenshot of a Unicode gamertag with Korean Hangul characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_player8423_2400_unique_modern_gamertag.png) | ![Screenshot of a Unicode gamertag with Korean Hangul characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_player8423_2400_modern_gamertag.png) | 2400 | Player8423 2400 |
| ![Screenshot of a Unicode gamertag created via diacritics and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_visorowl_suggested_rendering.png) | ![Screenshot of a Unicode gamertag created via diacritics and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_visorowl_unique_modern_gamertag.png) | ![Screenshot of a Unicode gamertag created via diacritics and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_visorowl_modern_gamertag.png) | 5883 | VisorOwl |

The examples from the table include the following scenarios.  


* The user whose gamertag is P3 claimed their gamertag as a classic gamertag before the shift to modern gamertags, 
and they haven't switched to a modern gamertag. Modern gamertag fields "pass through" the classic gamertag, and the suffix is blank.


* The user whose gamertag is Dragon#1652 either created their account after the release of modern gamertags, 
or they changed their classic gamertag to a modern gamertag to get the name they wanted. A suffix was assigned to this user because "Dragon" was taken by someone long ago.


* The user whose gamertag is ![Screenshot of a Unicode gamertag spelling out "House Party" with unique characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_houseparty.png) selected a modern gamertag using Latin "look-alike" characters because they thought it was cool. 
Their classic gamertag is mapped to the corresponding basic Latin characters so that the classic and 
modern gamertags can remain as consistent as possible and are identifiable across various platforms.


* The Korean user whose gamertag is ![Screenshot of a Unicode gamertag with Korean Hangul characters and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_player8423_2400.png) created their modern gamertag with Hangul characters. 
This gamertag was auto-assigned a random classic gamertag with the last 4 characters matching the suffix. 
This user didn't use any option to customize their gamertag further.


* The Thai user whose gamertag is ![Screenshot of a Unicode gamertag created via diacritics and a modern gamertag suffix](../../../../../../../resources/gamecore/secure/images/en-us/modern_gamertags_visorowl.png) created a modern gamertag with Thai characters that includes character modifications via diacritics. 
Because of the diacritics, the number of characters that are rendered on-screen is 
less than the raw number of characters that are returned in the API fields. 
This user chose to customize their classic gamertag so that in older games that didn't support modern gamertags, 
their gamertag appeared with a name that was still meaningful for them.  
  
## Backwards compatibility

The previous, classic gamertag system remains completely untouched. The 15-character alphanumerical limitations still apply, 
and you're never returned a modern gamertag instead of a classic one via previous APIs or fields. 
Modern gamertags are represented by 3 new fields (enumeration constants) that live side-by-side with the previous gamertag field.  

We encourage you to support modern gamertags because this is how users want to represent themselves—particularly international users. Supporting the full set of UTF-8 glyphs means building in-game fonts that include them all, and this requires a longer-term transition. You can continue to use classic gamertags indefinitely, moving over to modern gamertags is not a forced requirement due to the difficulty in particular with diacritic fonts.  

  
## Required UTF-8 character ranges  
  
To have a finite set of required glyphs, modern gamertags explicitly don't support the entire UTF-8 character range, but it does support subsets that target alphabets of specific languages.  
  
This set of required glyphs is fixed and won't increase over time. If your title is programmed to support modern gamertags as of 2020, your title's gamertag integration will still work with gamertags that are created years later.  
  
For details on the set of character ranges that are needed, see [UTF-8 character ranges for modern gamertags](live-modern-gamertags-unicode.md).  




  
## Components of the unique modern gamertag  
  
A unique modern gamertag consists of the gamertag and the suffix.
The gamertag component can be unique or a duplicate identifier. 
The suffix is the characters that, together with the gamertag, make it unique.  
  
Because different experiences need access to each of these fields separately, the components are available individually. 
You can specify which component you want to retrieve by using the [XUserGamertagComponent](../../../../../reference/system/xuser/enums/xusergamertagcomponent.md) enumeration. 
Your `XUserGamertagComponent` enumeration constant is then passed into the [XUserGetGamertag](../../../../../reference/system/xuser/functions/xusergetgamertag.md) function as shown in the following table.

| Component | Enumeration constant | Example |
| --- | --- | --- |
| Modern gamertag | `XUserGamertagComponent::Modern` | "Dragon" |
| Suffix | `XUserGamertagComponent::ModernSuffix` | "1652" |
| Unique modern gamertag | `XUserGamertagComponent::UniqueModern` | "Dragon#1652" |
  
  
### Terminology  
  
The following terminology is important for understanding how the gamertag system works with the delineation of classic and modern gamertags.  
 * A *modern gamertag* is a string of any of the supported UTF-8 characters before the suffix. 
 A maximum of 12 rendered characters are supported, but because UTF-8 diacritics are needed to support the Hindi and Thai languages, it's possible that multiple characters in the string make up one rendered character. 
 As a result, the string that's returned isn't necessarily a maximum of 12 characters, but could be 18 characters that render as 12 characters.
 * The *suffix* characters are what make the modern gamertag unique. 
 Many users who have had their Xbox Live account since the classic gamertag system won't have a suffix, because their modern gamertag and their classic gamertag are the same. This helps you identify the user as the original owner of that gamertag. 
 Any other user who creates an account and wants the same gamertag, by using the modern gamertag system, is assigned a random suffix to make their gamertag unique. 
 This is a string field, not a number, and it can be any length from one to 14 characters. 
 * The *unique modern gamertag* is the combination of the modern gamertag string and the suffix that's preceded by a `#`. 
 Users have guaranteed uniqueness with this full string, even if the gamertag string isn't unique.
> [!NOTE]
> Across all Xbox Live experiences, users are almost always rendered in this full way.  Their suffix is often de-emphasized by using a smaller and lighter-weight font.
  
### Length limits  
  
For more information about the length limits for each gamertag component, see [XUserGamertagComponent](../../../../../reference/system/xuser/enums/xusergamertagcomponent.md). 
  
## How classic gamertags are related to modern gamertags
  
Classic gamertags, predating the modern gamertag system, are distinct by their string, auto-generation for new users, and character limitations.  
    
### No suffix for classic gamertags
  
All Xbox Live users who created their account before modern gamertags existed have a classic gamertag, and they're automatically returned in the modern gamertag fields via APIs. However, they won't have a suffix.
  
### Auto-generated classic gamertags  
  
Users who created their account after modern gamertags were released, or have followed the "change gamertag" flow, can choose a modern gamertag. 
After their modern gamertag is chosen, a classic gamertag is auto-generated for them.  
  
Ensure that this auto-generated classic gamertag aligns with the user's modern gamertag, so that they're strongly correlated and clearly related to each other.  
  
#### ASCII-only modern gamertags  
  
If a user chooses the modern gamertag StormYeti, and it's assigned a suffix of 1234, then their unique modern gamertag is StormYeti#1234. Their auto-generated classic gamertag becomes StormYeti1234. 
When they appear in older titles that don't support the new gamertag system users can still identify themselves and others.  
  
#### Modern gamertags with ASCII look-alike characters  
  
As previously stated, the modern gamertag system recognizes Latin "look-alike" characters within the supported character ranges. For example, if a user chooses ЯΔDiΩ as their modern gamertag, and it's assigned a suffix 8402, their unique modern gamertag is ЯΔDiΩ#8402. Their auto-generated classic gamertag is RADiO8402.  
> [!NOTE]
> Users might use these Latin "look-alike" characters to give their gamertag personality and uniqueness.  
  
#### Modern gamertags with non-ASCII UTF-8 characters  
  
For users who choose a modern gamertag with non-Latin look-alike UTF-8 characters, such as ドラゴン, they're always assigned a suffix, even if no one else has yet taken that string of characters.
  
For these scenarios, the classic gamertag that's auto-generated for them will appear as the example Player8452 9238, and they're presented an opportunity when they create their account to choose their own meaningful classic gamertag.  
  
Because the classic gamertag namespace is limited to alphanumerical characters, their classic gamertag has no visible relationship to their modern gamertag, 
and experiences that show only the classic gamertag might make the user unrecognizable alongside experiences that were designed for modern gamertags.  
  > [!NOTE]
> We handle these scenarios carefully in the design of Xbox shell experiences. There's a years-long transition period, and when the modern and classic gamertags don't align, both are shown in key places&mdash;particularly in experiences the Xbox shell provides over games and related to gaming, such as the [Recent Players list](../../../multiplayer/mpa/concepts/live-mpa-recent-players.md).  
  
## Rendering modern gamertags  
  
Throughout Xbox experiences, there's a conscious effort to universally show users as their unique modern gamertag, including any applicable suffix. 
This is in large part due to user feedback of existing users who have had a meaningful gamertag for a 
long time and want to ensure that someone else who now claims the same gamertag isn't confused with the user who is "the original" of that gamertag.  
  
To respect this while ensuring that users with a modern gamertag receive a suffix, 
the modern gamertag string is separated from the suffix string upon rendering. 
This way the suffix is de-emphasized by showing it in a smaller and lighter-weight font.  
  
When you adopt modern gamertags for your title, follow this model to de-emphasize the suffix 
while keeping a clear differentiation between users with the same modern gamertag string. 
Where this isn't possible, use the unique modern gamertag to ensure that users who have the same name are differentiated from each other.  
  
For more information, see [Examples of modern gamertags](#modgtexamples) in this topic.
  
## Testing with modern gamertags

To change a gamertag to a modern gamertag, go to http://social.xbox.com/changegamertag and sign in with the account to change. Note that for all non-retail accounts the URI must be manually modified to indicate the sandbox that the test account resides in or sign-in will result in an error. For example, if the test account exists in the “XXXX.1” sandbox then manually construct the change gamertag URI to http://social.xbox.com/changegamertag?sbx=XXXX.1 to change the gamertag of that account.
> [!NOTE]
> All accounts get one free change to set a modern gamertag.  
  
## See also  
  
[XUserGetGamertag](../../../../../reference/system/xuser/functions/xusergetgamertag.md)  
[XUserGamertagComponent](../../../../../reference/system/xuser/enums/xusergamertagcomponent.md)  
[XblUserProfile](../../../../../reference/live/xsapi-c/profile_c/structs/xbluserprofile.md)  
[XblLeaderboardRow](../../../../../reference/live/xsapi-c/leaderboard_c/structs/xblleaderboardrow.md)