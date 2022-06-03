---
title: Policies and limits for Rich Presence strings
description: Describes the policies and limits that must be adhered to for implementing Rich Presence strings in your title.
kindex:
- Policies and limits for Rich Presence strings
- policies
- Rich Presence
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: 0ad21a75-0524-45a8-8d8a-0dec0f7d6d6f
ms.date: 04/04/2017
ms.localizationpriority: medium
edited: 00/00/0000
security: public
---

# Policies and limits for Rich Presence strings

This topic describes the policies and limits for Rich Presence strings. When you implement Rich Presence for your title, you must adhere to the following policies and limits.

-   Each title must have at least one string-set, but there's no upper limit on how many strings-sets you can have.

-   You must define a default string and culture-neutral strings for each enumeration and each Rich Presence string.

-   You can use numerical or string statistics to fill in the parameters in your strings. You can't use `DateTime` statistics.

-   If you're using statistics in your Rich Presence strings, those statistics (including any enumerations for statistics) must be available in the same service configuration identifier (SCID) and sandbox.

-   You have 1 line of 44 characters total (including the values of the parameters). This is similar to Xbox&nbsp;360 Rich Presence limits.  
    -   Unicode characters are required and must be able to work with UTF-8 encoding for display.

-   Your friendly names must follow these rules.
    -   The allowed characters are "A" through "Z", "a" through "z", underscore (\_), and "0" through "9". There's no character limit.

-   No string verification is done on your strings. You must do any string verification, like checking the spelling and verifying that the string has been localized properly.
    -   If we determine that a string-set is inappropriate (like containing abusive or offensive language), we prevent titles from using Rich Presence until these strings have been updated to our satisfaction.

-   If your title isn't integrating with Xbox Live Player Data, there are no options for using statistics as parameters in your strings.
    -   All strings must be completely predefined in that case (no tokens are allowed).

-   Enumeration names must be unique across all enumerations and must be unique to statistic names.

-   If a line exceeds the number of characters that can be shown, and there's a line break, the line is automatically truncated.
