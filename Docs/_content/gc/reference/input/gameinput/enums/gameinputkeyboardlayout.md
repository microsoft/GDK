---
author: M-Stahl
title: GameInputKeyboardLayout
description: Enumerates keyboard layouts by country or region and language.
kindex: GameInputKeyboardLayout
ms.author: angillie
ms.topic: reference
edited: '08/07/2020'
security: public
---

# GameInputKeyboardLayout  

Enumerates keyboard layouts by country or region and language. 

<a id="syntaxSection"></a>

## Syntax  
  
```cpp
typedef enum GameInputKeyboardLayout  
{  
    GameInputUnknownLayout = -1,  
    GameInputArabic101Layout = 0x00000401,  
    GameInputBulgarianTypewriterLayout = 0x00000402,  
    GameInputChineseTraditionalUSKeyboardLayout = 0x00000404,  
    GameInputCzechLayout = 0x00000405,  
    GameInputDanishLayout = 0x00000406,  
    GameInputGermanLayout = 0x00000407,  
    GameInputGreekLayout = 0x00000408,  
    GameInputUnitedStatesLayout = 0x00000409,  
    GameInputSpanishLayout = 0x0000040A,  
    GameInputFinnishLayout = 0x0000040B,  
    GameInputFrenchLayout = 0x0000040C,  
    GameInputHebrewLayout = 0x0000040D,  
    GameInputHungarianLayout = 0x0000040E,  
    GameInputIcelandicLayout = 0x0000040F,  
    GameInputItalianLayout = 0x00000410,  
    GameInputJapaneseLayout = 0x00000411,  
    GameInputKoreanLayout = 0x00000412,  
    GameInputDutchLayout = 0x00000413,  
    GameInputNorwegianLayout = 0x00000414,  
    GameInputPolishProgrammersLayout = 0x00000415,  
    GameInputPortugueseBrazilianAbntLayout = 0x00000416,  
    GameInputRomanianLegacyLayout = 0x00000418,  
    GameInputRussianLayout = 0x00000419,  
    GameInputStandardLayout = 0x0000041A,  
    GameInputSlovakLayout = 0x0000041B,  
    GameInputAlbanianLayout = 0x0000041C,  
    GameInputSwedishLayout = 0x0000041D,  
    GameInputThaiKedmaneeLayout = 0x0000041E,  
    GameInputTurkishQLayout = 0x0000041F,  
    GameInputUrduLayout = 0x00000420,  
    GameInputUkrainianLayout = 0x00000422,  
    GameInputBelarusianLayout = 0x00000423,  
    GameInputSlovenianLayout = 0x00000424,  
    GameInputEstonianLayout = 0x00000425,  
    GameInputLatvianLayout = 0x00000426,  
    GameInputLithuanianIbmLayout = 0x00000427,  
    GameInputTajikLayout = 0x00000428,  
    GameInputPersianLayout = 0x00000429,  
    GameInputVietnameseLayout = 0x0000042A,  
    GameInputArmenianEasternLayout = 0x0000042B,  
    GameInputAzeriLatinLayout = 0x0000042C,  
    GameInputSorbianStandardLegacyLayout = 0x0000042E,  
    GameInputMacedonianFyromLayout = 0x0000042F,  
    GameInputSetswanaLayout = 0x00000432,  
    GameInputGeorgianLayout = 0x00000437,  
    GameInputFaeroeseLayout = 0x00000438,  
    GameInputDevanagariInscriptLayout = 0x00000439,  
    GameInputMaltese47KeyLayout = 0x0000043A,  
    GameInputNorwegianWithSamiLayout = 0x0000043B,  
    GameInputKazakhLayout = 0x0000043F,  
    GameInputKyrgyzCyrillicLayout = 0x00000440,  
    GameInputTurkmenLayout = 0x00000442,  
    GameInputTatarLegacyLayout = 0x00000444,  
    GameInputBengaliLayout = 0x00000445,  
    GameInputPunjabiLayout = 0x00000446,  
    GameInputGujaratiLayout = 0x00000447,  
    GameInputOriyaLayout = 0x00000448,  
    GameInputTamilLayout = 0x00000449,  
    GameInputTeluguLayout = 0x0000044A,  
    GameInputKannadaLayout = 0x0000044B,  
    GameInputMalayalamLayout = 0x0000044C,  
    GameInputAssameseInscriptLayout = 0x0000044D,  
    GameInputMarathiLayout = 0x0000044E,  
    GameInputMongolianCyrillicLayout = 0x00000450,  
    GameInputTibetanPrcLayout = 0x00000451,  
    GameInputUnitedKingdomExtendedLayout = 0x00000452,  
    GameInputKhmerLayout = 0x00000453,  
    GameInputLaoLayout = 0x00000454,  
    GameInputSyriacLayout = 0x0000045A,  
    GameInputSinhalaLayout = 0x0000045B,  
    GameInputCherokeeNationLayout = 0x0000045C,  
    GameInputNepaliLayout = 0x00000461,  
    GameInputPashtoAfghanistanLayout = 0x00000463,  
    GameInputDivehiPhoneticLayout = 0x00000465,  
    GameInputHausaLayout = 0x00000468,  
    GameInputYorubaLayout = 0x0000046A,  
    GameInputSesothoSaLeboaLayout = 0x0000046C,  
    GameInputBashkirLayout = 0x0000046D,  
    GameInputLuxembourgishLayout = 0x0000046E,  
    GameInputGreenlandicLayout = 0x0000046F,  
    GameInputIgboLayout = 0x00000470,  
    GameInputGuaraniLayout = 0x00000474,  
    GameInputHawaiianLayout = 0x00000475,  
    GameInputUyghurLegacyLayout = 0x00000480,  
    GameInputMaoriLayout = 0x00000481,  
    GameInputSakhaLayout = 0x00000485,  
    GameInputWolofLayout = 0x00000488,  
    GameInputCentralKurdishLayout = 0x00000492,  
    GameInputChineseSimplifiedUsKeyboardLayout = 0x00000804,  
    GameInputSwissGermanLayout = 0x00000807,  
    GameInputUnitedKingdomLayout = 0x00000809,  
    GameInputLatinAmericanLayout = 0x0000080A,  
    GameInputBelgianFrenchLayout = 0x0000080C,  
    GameInputBelgianPeriodLayout = 0x00000813,  
    GameInputPortugueseLayout = 0x00000816,  
    GameInputSerbianLatinLayout = 0x0000081A,  
    GameInputAzeriCyrillicLayout = 0x0000082C,  
    GameInputSwedishWithSamiLayout = 0x0000083B,  
    GameInputUzbekCyrillicLayout = 0x00000843,  
    GameInputMongolianMongolianScriptLayout = 0x00000850,  
    GameInputInuktitutLatinLayout = 0x0000085D,  
    GameInputCentralAtlasTamazightLayout = 0x0000085F,  
    GameInputChineseTraditionalHongKongSarUsKeyboardLayout = 0x00000C04,  
    GameInputCanadianFrenchLegacyLayout = 0x00000C0C,  
    GameInputSerbianCyrillicLayout = 0x00000C1A,  
    GameInputDzongkhaLayout = 0x00000C51,  
    GameInputChineseSimplifiedSingaporeUsKeyboardLayout = 0x00001004,  
    GameInputCanadianFrenchLayout = 0x00001009,  
    GameInputSwissFrenchLayout = 0x0000100C,  
    GameInputTifinaghBasicLayout = 0x0000105F,  
    GameInputChineseTraditionalMacaoSarUsKeyboardLayout = 0x00001404,  
    GameInputIrishLayout = 0x00001809,  
    GameInputBosnianCyrillicLayout = 0x0000201A,  
    GameInputIndiaLayout = 0x00004009,  
    GameInputArabic102Layout = 0x00010401,  
    GameInputBulgarianLatinLayout = 0x00010402,  
    GameInputCzechQwertyLayout = 0x00010405,  
    GameInputGermanIbmLayout = 0x00010407,  
    GameInputGreek220Layout = 0x00010408,  
    GameInputUnitedStatesDvorakLayout = 0x00010409,  
    GameInputSpanishVariationLayout = 0x0001040A,  
    GameInputHungarian101KeyLayout = 0x0001040E,  
    GameInputItalian142Layout = 0x00010410,  
    GameInputPolish214Layout = 0x00010415,  
    GameInputPortugueseBrazilianAbnt2Layout = 0x00010416,  
    GameInputRomanianStandardLayout = 0x00010418,  
    GameInputRussianTypewriterLayout = 0x00010419,  
    GameInputSlovakQwertyLayout = 0x0001041B,  
    GameInputThaiPattachoteLayout = 0x0001041E,  
    GameInputTurkishFLayout = 0x0001041F,  
    GameInputLatvianQwertyLayout = 0x00010426,  
    GameInputLithuanianLayout = 0x00010427,  
    GameInputArmenianWesternLayout = 0x0001042B,  
    GameInputAzerbaijaniStandardLayout = 0x0001042C,  
    GameInputSorbianExtendedLayout = 0x0001042E,  
    GameInputMacedonianFyromStandardLayout = 0x0001042F,  
    GameInputGeorgianQwertyLayout = 0x00010437,  
    GameInputHindiTraditionalLayout = 0x00010439,  
    GameInputMaltese48KeyLayout = 0x0001043A,  
    GameInputSamiExtendedNorwayLayout = 0x0001043B,  
    GameInputTatarLayout = 0x00010444,  
    GameInputBengaliInscriptLegacyLayout = 0x00010445,  
    GameInputTibetanPrcUpdatedLayout = 0x00010451,  
    GameInputKhmerNidaLayout = 0x00010453,  
    GameInputSyriacPhoneticLayout = 0x0001045A,  
    GameInputSinhalaWij9Layout = 0x0001045B,  
    GameInputCherokeeNationPhoneticLayout = 0x0001045C,  
    GameInputInuktitutNaqittautLayout = 0x0001045D,  
    GameInputDivehiTypewriterLayout = 0x00010465,  
    GameInputUyghurLayout = 0x00010480,  
    GameInputBelgianCommaLayout = 0x0001080C,  
    GameInputFinnishWithSamiLayout = 0x0001083B,  
    GameInputTraditionalMongolianStandardLayout = 0x00010850,  
    GameInputMyanmarPhoneticOrderLayout = 0x00010C00,  
    GameInputCanadianMultilingualStandardLayout = 0x00011009,  
    GameInputTifinaghFullLayout = 0x0001105F,  
    GameInputGaelicLayout = 0x00011809,  
    GameInputArabic102AzertyLayout = 0x00020401,  
    GameInputBulgarianPhoneticLayout = 0x00020402,  
    GameInputCzechProgrammersLayout = 0x00020405,  
    GameInputGreek319Layout = 0x00020408,  
    GameInputUnitedStatesInternationalLayout = 0x00020409,  
    GameInputHebrewStandardLayout = 0x0002040D,  
    GameInputRomanianProgrammersLayout = 0x00020418,  
    GameInputRussianMnemonicLayout = 0x00020419,  
    GameInputThaiKedmaneeNonShiftLockLayout = 0x0002041E,  
    GameInputUkrainianEnhancedLayout = 0x00020422,  
    GameInputLatvianStandardLayout = 0x00020426,  
    GameInputLithuanianStandardLayout = 0x00020427,  
    GameInputArmenianPhoneticLayout = 0x0002042B,  
    GameInputSorbianStandardLayout = 0x0002042E,  
    GameInputGeorgianErgonomicLayout = 0x00020437,  
    GameInputBengaliInscriptLayout = 0x00020445,  
    GameInputTamil99Layout = 0x00020449,  
    GameInputSamiExtendedFinlandSwedenLayout = 0x0002083B,  
    GameInputNewTaiLueLayout = 0x00020C00,  
    GameInputBulgarianLayout = 0x00030402,  
    GameInputGreek220LatinLayout = 0x00030408,  
    GameInputUnitedStatesDvorakForLeftHandLayout = 0x00030409,  
    GameInputThaiPattachoteNonShiftLockLayout = 0x0003041E,  
    GameInputArmenianTypewriterLayout = 0x0003042B,  
    GameInputGeorgianMinistryOfEducationAndScienceSchoolsLayout = 0x00030437,  
    GameInputTaiLeLayout = 0x00030C00,  
    GameInputBulgarianPhoneticTraditionalLayout = 0x00040402,  
    GameInputGreek319LatinLayout = 0x00040408,  
    GameInputUnitedStatesDvorakForRightHandLayout = 0x00040409,  
    GameInputGeorgianOldAlphabetsLayout = 0x00040437,  
    GameInputOghamLayout = 0x00040C00,  
    GameInputGreekLatinLayout = 0x00050408,  
    GameInputUsEnglishTableForIbmArabic238LLayout = 0x00050409,  
    GameInputPersianStandardLayout = 0x00050429,  
    GameInputGreekPolytonicLayout = 0x00060408,  
    GameInputLisuBasicLayout = 0x00070C00,  
    GameInputLisuStandardLayout = 0x00080C00,  
    GameInputNKoLayout = 0x00090C00,  
    GameInputPhagsPaLayout = 0x000A0C00,  
    GameInputBugineseLayout = 0x000B0C00,  
    GameInputGothicLayout = 0x000C0C00,  
    GameInputOlChikiLayout = 0x000D0C00,  
    GameInputOsmanyaLayout = 0x000E0C00,  
    GameInputOldItalicLayout = 0x000F0C00,  
    GameInputSoraLayout = 0x00100C00,  
    GameInputJavaneseLayout = 0x00110C00,  
    GameInputFutharkLayout = 0x00120C00,  
    GameInputMyanmarVisualOrderLayout = 0x00130C00,  
    GameInputADLaMLayout = 0x00140C00,  
    GameInputOsageLayout = 0x00150C00  
} GameInputKeyboardLayout  
```  
  
<a id="constantsSection"></a>

## Constants  

 
  
| Constant | Description |
| --- | --- |
| GameInputUnknownLayout | Unknown |  
| GameInputArabic101Layout | Arabic (101) |  
| GameInputBulgarianTypewriterLayout | Bulgarian (Typewriter) |  
| GameInputChineseTraditionalUSKeyboardLayout | Chinese (Traditional) - US |  
| GameInputCzechLayout | Czech |  
| GameInputDanishLayout | Danish |  
| GameInputGermanLayout | German |  
| GameInputGreekLayout | Greek |  
| GameInputUnitedStatesLayout | US |  
| GameInputSpanishLayout | Spanish |  
| GameInputFinnishLayout | Finnish |  
| GameInputFrenchLayout | French |  
| GameInputHebrewLayout | Hebrew |  
| GameInputHungarianLayout | Hungarian |  
| GameInputIcelandicLayout | Icelandic |  
| GameInputItalianLayout | Italian |  
| GameInputJapaneseLayout | Japanese |  
| GameInputKoreanLayout | Korean |  
| GameInputDutchLayout | Dutch |  
| GameInputNorwegianLayout | Norwegian |  
| GameInputPolishProgrammersLayout | Polish (Programmers) |  
| GameInputPortugueseBrazilianAbntLayout | Portuguese (Brazil ABNT) |  
| GameInputRomanianLegacyLayout | Romanian (Legacy) |  
| GameInputRussianLayout | Russian |  
| GameInputStandardLayout | Standard |  
| GameInputSlovakLayout | Slovak |  
| GameInputAlbanianLayout | Albanian |  
| GameInputSwedishLayout | Swedish |  
| GameInputThaiKedmaneeLayout | Thai Kedmanee |  
| GameInputTurkishQLayout | Turkish Q |  
| GameInputUrduLayout | Urdu |  
| GameInputUkrainianLayout | Ukrainian |  
| GameInputBelarusianLayout | Belarusian |  
| GameInputSlovenianLayout | Slovenian |  
| GameInputEstonianLayout | Estonian |  
| GameInputLatvianLayout | Latvian |  
| GameInputLithuanianIbmLayout | Lithuanian IBM |  
| GameInputTajikLayout | Tajik |  
| GameInputPersianLayout | Persian |  
| GameInputVietnameseLayout | Vietnamese |  
| GameInputArmenianEasternLayout | Armenian Eastern (Legacy) |  
| GameInputAzeriLatinLayout | Azeri Latin |  
| GameInputSorbianStandardLegacyLayout | Sorbian Standard (Legacy) |  
| GameInputMacedonianFyromLayout | Republic of North Macedonia |  
| GameInputSetswanaLayout | Setswana |  
| GameInputGeorgianLayout | Georgian |  
| GameInputFaeroeseLayout | Faeroese |  
| GameInputDevanagariInscriptLayout | Devangari - InScript |  
| GameInputMaltese47KeyLayout | Maltese 47-Key |  
| GameInputNorwegianWithSamiLayout | Norwegian with Sami |  
| GameInputKazakhLayout | Kazakh |  
| GameInputKyrgyzCyrillicLayout | Kyrgyz Cyrillic |  
| GameInputTurkmenLayout | Turkmen |  
| GameInputTatarLegacyLayout | Tatar (Legacy) |  
| GameInputBengaliLayout | Bengali |  
| GameInputPunjabiLayout | Punjabi |  
| GameInputGujaratiLayout | Gujarati |  
| GameInputOriyaLayout | Oriya |  
| GameInputTamilLayout | Tamil |  
| GameInputTeluguLayout | Telugu |  
| GameInputKannadaLayout | Kannada |  
| GameInputMalayalamLayout | Malayalam |  
| GameInputAssameseInscriptLayout | Assamese - InScript |  
| GameInputMarathiLayout | Marathi |  
| GameInputMongolianCyrillicLayout | Mongolian Cyrillic |  
| GameInputTibetanPrcLayout | Tibetan (PRC) |  
| GameInputUnitedKingdomExtendedLayout | United Kingdom Extended |  
| GameInputKhmerLayout | Khmer |  
| GameInputLaoLayout | Lao |  
| GameInputSyriacLayout | Syriac |  
| GameInputSinhalaLayout | Sinhala |  
| GameInputCherokeeNationLayout | Cherokee Nation |  
| GameInputNepaliLayout | Nepali |  
| GameInputPashtoAfghanistanLayout | Pashto (Afghanistan) |  
| GameInputDivehiPhoneticLayout | Divehi Phonetic |  
| GameInputHausaLayout | Hausa |  
| GameInputYorubaLayout | Yoruba |  
| GameInputSesothoSaLeboaLayout | Sesotho sa Leboa |  
| GameInputBashkirLayout | Bashkir |  
| GameInputLuxembourgishLayout | Luxembourgish |  
| GameInputGreenlandicLayout | Greenlandic |  
| GameInputIgboLayout | Igbo |  
| GameInputGuaraniLayout | Guarani |  
| GameInputHawaiianLayout | Hawaiian |  
| GameInputUyghurLegacyLayout | Uyghur (Legacy) |  
| GameInputMaoriLayout | Maori |  
| GameInputSakhaLayout | Sakha |  
| GameInputWolofLayout | Wolof |  
| GameInputCentralKurdishLayout | Central Kurdish |  
| GameInputChineseSimplifiedUsKeyboardLayout | Chinese (Simplified) - US |  
| GameInputSwissGermanLayout | Swiss German |  
| GameInputUnitedKingdomLayout | United Kingdom |  
| GameInputLatinAmericanLayout | Latin American |  
| GameInputBelgianFrenchLayout | Belgian French |  
| GameInputBelgianPeriodLayout | Belgian (Period) |  
| GameInputPortugueseLayout | Portuguese |  
| GameInputSerbianLatinLayout | Serbian (Latin) |  
| GameInputAzeriCyrillicLayout | Azer Cyrillic |  
| GameInputSwedishWithSamiLayout | Swedish with Sami |  
| GameInputUzbekCyrillicLayout | Uzbek Cyrillic |  
| GameInputMongolianMongolianScriptLayout | Mongolian (Mongolian Script) |  
| GameInputInuktitutLatinLayout | Inuktitut - Latin |  
| GameInputCentralAtlasTamazightLayout | Central Atlas Tamazight |  
| GameInputChineseTraditionalHongKongSarUsKeyboardLayout | Chinese (Traditional, Hong Kong S.A.R.) - US |  
| GameInputCanadianFrenchLegacyLayout | Canadian French (Legacy) |  
| GameInputSerbianCyrillicLayout | Serbian (Cyrillic) |  
| GameInputDzongkhaLayout | Dzongkha |  
| GameInputChineseSimplifiedSingaporeUsKeyboardLayout | Chinese (Simplifed, Singapore) - US |  
| GameInputCanadianFrenchLayout | Canadian French |  
| GameInputSwissFrenchLayout | Swiss French |  
| GameInputTifinaghBasicLayout | Tifinagh (Basic) |  
| GameInputChineseTraditionalMacaoSarUsKeyboardLayout | Chinese (Traditional, Macao S.A.R.) - US |  
| GameInputIrishLayout | Irish |  
| GameInputBosnianCyrillicLayout | Bosnian (Cyrillic) |  
| GameInputIndiaLayout | India |  
| GameInputArabic102Layout | Arabic (102) |  
| GameInputBulgarianLatinLayout | Bulgarian (Latin) |  
| GameInputCzechQwertyLayout | Czech (QWERTY) |  
| GameInputGermanIbmLayout | German (IBM) |  
| GameInputGreek220Layout | Greek (220) |  
| GameInputUnitedStatesDvorakLayout | United States-Dvorak |  
| GameInputSpanishVariationLayout | Spanish Variation |  
| GameInputHungarian101KeyLayout | Hungarian 101-key |  
| GameInputItalian142Layout | Italian (142) |  
| GameInputPolish214Layout | Polish (214) |  
| GameInputPortugueseBrazilianAbnt2Layout | Portuguese (Brazil ABNT2) |  
| GameInputRomanianStandardLayout | Romanian (Standard) |  
| GameInputRussianTypewriterLayout | Russian (Typewriter) |  
| GameInputSlovakQwertyLayout | Slovak (QWERTY) |  
| GameInputThaiPattachoteLayout | Thai Pattachote |  
| GameInputTurkishFLayout | Turkish F |  
| GameInputLatvianQwertyLayout | Latvian (QWERTY) |  
| GameInputLithuanianLayout | Lithuanian |  
| GameInputArmenianWesternLayout | Armenian Western |  
| GameInputAzerbaijaniStandardLayout | Azerbaijani (Standard) |  
| GameInputSorbianExtendedLayout | Sorbian Extended |  
| GameInputMacedonianFyromStandardLayout | Republic of North Macedonia - Standard |  
| GameInputGeorgianQwertyLayout | Georgian (QWERTY) |  
| GameInputHindiTraditionalLayout | Hindi Traditional |  
| GameInputMaltese48KeyLayout | Maltese 48-Key |  
| GameInputSamiExtendedNorwayLayout | Sami Extended Norway |  
| GameInputTatarLayout | Tatar |  
| GameInputBengaliInscriptLegacyLayout | Bengali - InScript (Legacy) |  
| GameInputTibetanPrcUpdatedLayout | Tibetan (PRC) - Updated |  
| GameInputKhmerNidaLayout | Khmer (NiDA) |  
| GameInputSyriacPhoneticLayout | Syriac Phonetic |  
| GameInputSinhalaWij9Layout | Sinhala - Wij 9 |  
| GameInputCherokeeNationPhoneticLayout | Cherokee Phonetic |  
| GameInputInuktitutNaqittautLayout | Inuktitut - Naqittaut |  
| GameInputDivehiTypewriterLayout | Divehi Typewriter |  
| GameInputUyghurLayout | Uyghur |  
| GameInputBelgianCommaLayout | Belgian (Comma) |  
| GameInputFinnishWithSamiLayout | Finnish with Sami |  
| GameInputTraditionalMongolianStandardLayout | Traditional Mongolian (Standard) |  
| GameInputMyanmarPhoneticOrderLayout | Myanmar (Phonetic order) |  
| GameInputCanadianMultilingualStandardLayout | Canadian Multilingual Standard |  
| GameInputTifinaghFullLayout | Tifinagh (Full) |  
| GameInputGaelicLayout | Gaelic |  
| GameInputArabic102AzertyLayout | Arabic (102) AZERTY |  
| GameInputBulgarianPhoneticLayout | Bulgarian (Phonetic) |  
| GameInputCzechProgrammersLayout | Czech (Programmers) |  
| GameInputGreek319Layout | Greek (319) |  
| GameInputUnitedStatesInternationalLayout | United States-International |  
| GameInputHebrewStandardLayout | Hebrew (Standard) |  
| GameInputRomanianProgrammersLayout | Romanian (Programmers) |  
| GameInputRussianMnemonicLayout | Russian - Mnemonic |  
| GameInputThaiKedmaneeNonShiftLockLayout | Thai Kedmanee (non-ShiftLock) |  
| GameInputUkrainianEnhancedLayout | Ukrainian (Enhanced) |  
| GameInputLatvianStandardLayout | Latvian (Standard) |  
| GameInputLithuanianStandardLayout | Lithuanian Standard |  
| GameInputArmenianPhoneticLayout | Armenian Phonetic |  
| GameInputSorbianStandardLayout | Sorbian Standard |  
| GameInputGeorgianErgonomicLayout | Georgian (Ergonomic) |  
| GameInputBengaliInscriptLayout | Bengali - InScript |  
| GameInputTamil99Layout | Tamil (99) |  
| GameInputSamiExtendedFinlandSwedenLayout | Sami Extended Finland-Sweden |  
| GameInputNewTaiLueLayout | New Tai Lue |  
| GameInputBulgarianLayout | Bulgarian |  
| GameInputGreek220LatinLayout | Greek (220) Latin |  
| GameInputUnitedStatesDvorakForLeftHandLayout | United States-Dvorak for left hand |  
| GameInputThaiPattachoteNonShiftLockLayout | Thai Pattachote (non-ShiftLock) |  
| GameInputArmenianTypewriterLayout | Armenian Typewriter |  
| GameInputGeorgianMinistryOfEducationAndScienceSchoolsLayout | Georgian (MES) |  
| GameInputTaiLeLayout | Tai Le |  
| GameInputBulgarianPhoneticTraditionalLayout | Bulgarian (Phonetic Traditional) |  
| GameInputGreek319LatinLayout | Greek (319) Latin |  
| GameInputUnitedStatesDvorakForRightHandLayout | United States-Dvorak for right hand |  
| GameInputGeorgianOldAlphabetsLayout | Georgian (Old Alphabets) |  
| GameInputOghamLayout | Ogham |  
| GameInputGreekLatinLayout | Greek Latin |  
| GameInputUsEnglishTableForIbmArabic238LLayout | US English Table for IBM Arabic 238_L |  
| GameInputPersianStandardLayout | Persian (Standard) |  
| GameInputGreekPolytonicLayout | Greek Polytonic |  
| GameInputLisuBasicLayout | Lisu (Basic) |  
| GameInputLisuStandardLayout | Lisu (Standard) |  
| GameInputNKoLayout | N'Ko |  
| GameInputPhagsPaLayout | Phags-pa |  
| GameInputBugineseLayout | Buginese |  
| GameInputGothicLayout | Gothic |  
| GameInputOlChikiLayout | Ol Chiki |  
| GameInputOsmanyaLayout | Osmanya |  
| GameInputOldItalicLayout | Old Italic |  
| GameInputSoraLayout | Sora |  
| GameInputJavaneseLayout | Javanese |  
| GameInputFutharkLayout | Futhark |  
| GameInputMyanmarVisualOrderLayout | Myanmar (Visual order) |  
| GameInputADLaMLayout | ADLaM   |  
| GameInputOsageLayout | Osage   |  
  
<a id="remarksSection"></a>

## Remarks  
  
This enumeration is used in the [GameInputKeyboardInfo](../structs/gameinputkeyboardinfo.md) structure. You can combine values to target multiple keyboard layouts. 

For more information, see [GameInput devices](../../../../input/overviews/input-devices.md). 
  
<a id="requirementsSection"></a>

## Requirements  
  
**Header:** GameInput.h
  
**Supported platforms:** Xbox One family consoles and Xbox Series consoles  
  
<a id="seealsoSection"></a>

## See also  

[Overview of GameInput](../../../../input/overviews/input-overview.md)  
[GameInput](../gameinput_members.md)  
  