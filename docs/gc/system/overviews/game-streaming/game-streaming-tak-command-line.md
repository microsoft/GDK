---
author: M-Stahl
title: Touch Adaptation Kit command line tool (tak.exe)
description: Describes how to create and validate touch control layouts. Enable streaming devices to acquire layouts from your Windows PC.
kindex:
- Touch Adaptation Kit command line tool (tak.exe)
- tak.exe (Touch Adaptation Kit)
ms.author: migonz
ms.topic: conceptual
edited: '09/24/2021'
security: public
---

# Touch Adaptation Kit command line tool (tak.exe)

Use this topic to create and validate touch control layouts by using the Touch Adaptation Kit (TAK).

## Commands

Use the commands shown in the following table to ensure that touch controls work as intended when your title is played by using Xbox Game Streaming.

| Command                               | Description                                                                                                      |
| ------------------------------------- | ---------------------------------------------------------------------------------------------------------------- |
| [pack](#pack-command)                 | Builds a touch-adaptation bundle from a set of source content.                                                   |
| [serve](#serve-command)               | Provides a touch-adaptation bundle so that a client application can download and use it.                         |
| [verify](#verify-command)             | Verifies that the contents of the touch-adaptation bundle are valid.                                             |
| [takx-version](#takx-version-command) | Determines the version of both the touch-adaptation bundle and the maximum schema version of an included layout. |
| [unpack](#unpack-command)             | Unpacks an existing touch-adaptation bundle into its component files.                                            |
| [convert](#convert-command)           | Converts a legacy layout set file into component layouts that are suitable for consumption by the pack command.  |

## Options

Use the information in the following table to apply the appropriate flags to all commands.

| Options              | Description                                                                                                                                                                                        |
| -------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `-v`, `--verbosity`  | Set the output verbosity of the command. The valid values for these flags are `Critical`, `Debug`, `Error`, `Information`, `None`, `Trace`, and `Warning`. The default verbosity is `Information`. |
| `--version`          | Show version information.                                                                                                                                                                          |
| `-?`, `-h`, `--help` | Show help and usage information.                                                                                                                                                                   |

<a id="pack-command"></a>

## Pack command

The `pack` command is used to package the layouts into a touch-adaptation bundle (takx).

This bundle is available for Content Test App (CTA) clients via the [serve](#serve-command) command, or submitted by your Microsoft account manager for users via Xbox Game Streaming.

The following table shows the different options that are available for use with the `pack` command.

| Options                                    | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| ------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--layout-path <layout-path>`              | Path to the root layout directory that you want to include in the bundle. This parameter is required.                                                                                                                                                                                                                                                                                                                                                                                                                          |
| `--out`<br />`--output-path <output-path>` | File to write the package touch-adaptation bundle into. Normally a .takx file. This parameter is required.                                                                                                                                                                                                                                                                                                                                                                                                                      |
| `--asset-path <asset-path>`                | Path to the root asset directory that you want to include in the bundle. If the bundle has no assets, this parameter isn't required.                                                                                                                                                                                                                                                                                                                                                                                 |
| `--context file <context-file>`            | Path to the context file that you want to include in the bundle. If the bundle has no context, this parameter isn't required.                                                                                                                                                                                                                                                                                                                                                                                        |
| `--default-layout <default-layout>`        | Name of the default layout. This should match the name of one of the files in the layout path.                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `--version <version>`                      | Content version of the touch-adaptation bundle such as 1.0.0.0. Each touch adaptation bundle submitted to Microsoft for a title must have a semantically larger version number than any prior touch adaptation bundle that has been submitted. The [takx-version](#takx-version-command) command may be used to examine the version of an existing bundle. The version number of the touch adaptation bundle in use while a game is being streamed may be obtained by calling [XGameStreamingGetTouchBundleVersion](../../../reference/system/xgamestreaming/functions/xgamestreaminggettouchbundleversion.md) |
| `--version-name <version-name>`            | Name of the content version of the touch-adaptation bundle such as "DLC 1". Unlike the version number, the version name is optional and there are no requirements placed on its format. The [takx-version](#takx-version-command) command may be used to examine the version of an existing bundle. The version name of the touch adaptation bundle in use while a game is being streamed may be obtained by calling [XGameStreamingGetTouchBundleVersion](../../../reference/system/xgamestreaming/functions/xgamestreaminggettouchbundleversion.md)                                                          |
| `--no-asset-optimization`                  | Ensures that the assets for efficient storage and communication aren't optimized. If set, the assets aren't modified.                                                                                                                                                                                                                                                                                                                                                                                               |
| `--no-verify`                              | Ensures that the produced touch-adaptation bundle is valid and isn't verified.                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| `--language <language>`                    | IETF language tag of a language that you want to include in the produced bundle. If this parameter is specified multiple times, all the provided languages are included. If the parameter isn't specified, all layouts and assets that are found in the source directory are included in the bundle.                                                                                                                                                                                                                 |

### Examples

Use the following code example to package the layouts in a touch-adaptation bundle.

```
// Pack all the layouts in the layout-path into a single touch adaptation bundle with version of 1.0.0.0
C:\Program Files (x86)\Microsoft GDK\bin>tak pack --layout-path C:\tmp\layouts --out C:\tmp\MyGameLayouts.takx --version 1.0.0.0
Building touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'
Verifying touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'.
Verification complete. 0 error(s) and 0 warning(s) found.


// Pack all the layouts in the layout-path into a single touch adaptation bundle. Set the layout "introLayout" as the one that will be presented to users before a specific layout request is made by the game
C:\Program Files (x86)\Microsoft GDK\bin>tak pack --layout-path C:\tmp\layouts --out C:\tmp\MyGameLayouts.takx --default-layout introLayout
Building touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'
Verifying touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'.
Verification complete. 0 error(s) and 0 warning(s) found.


// Pack only the en-us layouts in the layout-path into a single touch adaptation bundle without any asset optimization
C:\Program Files (x86)\Microsoft GDK\bin>tak pack --layout-path C:\tmp\layouts --out C:\tmp\MyGameLayouts.takx --language en-us --no-asset-optimization
Building touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'
Verifying touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'.
Verification complete. 0 error(s) and 0 warning(s) found.

// Pack only the en-us and es-us layouts in the layout-path into a single touch adaptation bundle.
C:\Program Files (x86)\Microsoft GDK\bin>tak pack --layout-path C:\tmp\layouts --out C:\tmp\MyGameLayouts.takx --language en-us --language es-us
Building touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'
Verifying touch adaptation bundle 'C:\tmp\MyGameLayouts.takx'.
Verification complete. 0 error(s) and 0 warning(s) found.


```

<a id="serve-command"></a>

## Serve command

The `serve` command is used to make the specified layouts available to the CTA for validation experiences.

Either provide a packaged touch-adaptation bundle (that's created with the `pack` command), or provide a set of layouts that aren't packaged.

The following table shows the different options that are available for use with the `serve` command.

| Options                                         | Description                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--takx`, `--takx-file <takx-file>`             | Path to the touch-adaptation bundle that you want to serve. Either this parameter or the `--layout-path` parameter is required.                                                                                                                                                                                                                                                                                                                                                                                    |
| `--layout-path <layout-path>`                   | Path to the root layout directory that you want to include in the bundle that's served. Either this parameter or the `--takx-file` parameter is required.                                                                                                                                                                                                                                                                                                                                                        |
| `--asset-path <asset-path>`                     | Path to the root asset directory that you want to include in the bundle that's served. If the bundle doesn't have assets, this parameter isn't required.                                                                                                                                                                                                                                                 |
| `--context file <context-file>`                 | Path to the context file that you want to include in the bundle. If the bundle doesn't have context, this parameter isn't required.                                                                                                                                                                                                                                                                      |
| `--default-layout <default-layout>`             | Name of the default layout. This should match the name of one of the files that's in the layout path.                                                                                                                                                                                                                                                                                                                                           |
| `--version <version>`                           | Content version of the touch-adaptation bundle such as 1.0.0.0. Each touch adaptation bundle submitted to Microsoft for a title must have a semantically larger version number than any prior touch adaptation bundle that has been submitted. The version number of the touch adaptation bundle in use while a game is being streamed may be obtained by calling [XGameStreamingGetTouchBundleVersion](../../../reference/system/xgamestreaming/functions/xgamestreaminggettouchbundleversion.md) |
| `--version-name <version-name>`                 | Name of the content version of the touch-adaptation bundle such as "DLC 1". Unlike the version number, the version name is optional and there are no requirements placed on its format. The version name of the touch adaptation bundle in use while a game is being streamed may be obtained by calling [XGameStreamingGetTouchBundleVersion](../../../reference/system/xgamestreaming/functions/xgamestreaminggettouchbundleversion.md)                                                          |
| `--no-asset-optimization`                       | Ensure that the assets for efficient storage and communication aren't optimized. If set, the assets aren't modified.                                                                                                                                                                                                                                                                                     |
| `--no-verify`                                   | Ensure that the produced touch-adaptation bundle is valid and isn't verified                                                                                                                                                                                                                                                                                                                                                                    |
| `--language <language>`                         | IETF language tag of a language to include in the produced bundle that's served. If this parameter is specified multiple times, all the provided languages are included. If the parameter isn't specified, all layouts and assets that are found in the source directory are included in the bundle that's served.                                                                                       |
| `--port <port>`                                 | Port to serve the touch-adaptation bundle. The default port is 9269.                                                                                                                                                                                                                                                                                                                                             |
| `--host <host>`                                 | Host to serve the touch-adaptation bundle. The default host is`0.0.0.0`, which enables the bundle on all network interfaces. Use `localhost` to enable the server only as a loopback or a specific IP that controls which interface the server is available on.                                                                                                                                                 |
| `--certificate-file <certificate-file>`         | Path to the .pfx certificate file to authenticate the server for secure HTTPS requests. This flag is necessary for the tool to host an authenticated HTTPS server.                                                                                                                                                                                                                                        |
| `--certificate-password <certificate-password>` | Password required to access the certificate data.                                                                                                                                                                                                                                                                                                                                                                                               |
| `--password <password>`                         | Password for authenticating the client. This is an optional flag to restrict client access to the touch-adaptation bundles when sideloading over https. In order to successfully authenticate the client, the provided password must match the password provided in the client’s developer settings on the GameStreaming app.                                                                            |

### Examples

Use the following code example to serve all or a specific touch-adaptation bundle on a host.

```
// Serve all the layouts in the layout-path on the default port and host  and declare a specific version/version name
C:\Program Files (x86)\Microsoft GDK\bin>tak serve --layout-path C:\tmp\layouts --version 1.0.0.2 --versionName DLC2
Verifying touch adaptation bundle 'C:\tmp\layouts'.
Now listening on: http://0.0.0.0:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
Content root path: C:\tmp


// Serve a specified touch adaptation bundle only over localhost
C:\Program Files (x86)\Microsoft GDK\bin>tak serve --takx-file C:\tmp\MyGameLayouts.takx --host localhost
Now listening on: http://localhost:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
Content root path: C:\tmp
```

<a id="certificate-generation"></a>
### Certificate Generation Instructions

A certificate is required to host an authenticated secure server for sideloading Touch Bundles. Any appropriate SSL certificate can be used, but the instructions below will create a certificate as well

1.  Obtain the script to generate self-signed certificate from [our GitHub](https://github.com/microsoft/xbox-game-streaming-tools/blob/master/touch-adaptation-kit/scripts/Create-SelfSignedCertificate.ps1)

    a. Navigate to the link above, select 'raw', and copy-paste the script contents into a document on your local machine

    b. Alternatively, run the following command in Powershell to download the script

        Invoke-WebRequest-Uri https://raw.githubusercontent.com/microsoft/xbox-game-streaming-tools/master/touch-adaptation-kit/scripts/Create-SelfSignedCertificate.ps1 -Out ./Create-SelfSignedCertificate.ps1

2.  Run the downloaded script in Powershell.
3.  The script will prompt you for a password to secure the certificate. Set the password by entering it here. This password will be used as input to the –certificate-password flag of the serve command.
    a. This will generate two files: `sideload.pfx` and `sideload.cer`. The path to the `sideload.pfx` certificate file is to be passed as input to the –certificate-file flag of the serve command.

### Trusting the certificate on different clients

Load the .cer file onto your device. This can be accomplished via e-mail, OneDrive, USB, ADB, AirDrop etc. Trust the certificate in the usual manner appropriate for the given device.

#### Windows

1. Double click the `sideload.cer` file
2. Select 'Install Certificate'. This will open Certificate Import Wizard.
3. Select 'Current User' as the Store location.
4. In the next window, select 'Place all certificates in the following store' then select 'Browse for Trusted Root Certification Authorities'.

#### Android

1. On your Android device, navigate to Settings > Security > Advanced > Encryption & credentials > CA certificate
2. Install the certificate by selecting 'Install fron Storage' and browse for the `sideload.cer` file downloaded in the previous section

   a. Once installed, this certificate can be viewed under Trusted Credentials > User

See [Google's documentation](https://support.google.com/pixelphone/answer/2844832?hl=en) for more information.

#### iOS

1. Navigate to the Files application on your iOS device to install the .cer file to youe device profiles
2. A new profile should be generated based on the .cer file profile name. This can be found under Settings > General > Profiles & Device Management.
3. Install the certificate. The certificate signature should show as verified.
4. To test the installed certificate, navigate to Settings > General > About > Certificate Trust Settings. Enable full trust for the root certificate that was just installed.

See [Apple's documentation](https://support.apple.com/en-us/HT204477) for more information.

### Examples

Use the following code example to serve all or a specific touch-adaptation bundle on a host.

```
// Serve all layouts in the layout path on the default host and port over https
C:\Program Files (x86)\Microsoft GDK\bin>  tak serve --layout-path C:\tmp\layouts --certificate-file C:\tmp\sideload.pfx --certificate-password "password"
Adding local loopback exemption for PC app connections.
OK.
Hosting starting
Now listening on: https://0.0.0.0:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
Content root path: C:\tmp
Hosting started



// Serve all layouts in the layout path on the default host and port in a secure way upon authenticating the client.
C:\Program Files (x86)\Microsoft GDK\bin>  tak serve --layout-path C:\tmp\layouts --certificate-file C:\tmp\sideload.pfx --certificate-password "certificatePassword" –password “password”
Adding local loopback exemption for PC app connections.
OK.
Hosting starting
User profile is available. Using ‘AppData\Local\ASP.NET\DataProtection-Keys’ as key repository and Windows DPAPI to encrypt keys at rest.
Now listening on: https://0.0.0.0:9269
Application started. Press Ctrl+C to shut down.
Hosting environment: Production
```

<a id="convert-command"></a>

## Convert command

The `convert` command modifies a legacy layout set file into component layouts that are suitable for consumption by the pack command.

The following table shows the different options that are available for use with the `convert` command.

| Options                                    | Description                                                                            |
| ------------------------------------------ | -------------------------------------------------------------------------------------- |
| `--layout-set <layout-set>`                | Layout set file that you want to convert. This parameter is required.                  |
| `--out`<br />`--output-path <output-path>` | Path to the root layout directory that you want to extract the component layouts into. This parameter is required. |

### Example

Use the following code example to convert a legacy layout for your product.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak convert --layout-set C:\tmp\original-layouts.json --out C:\tmp\layouts
Reading layout set 'C:\tmp\original-layouts.json'.
Writing touch adaptation bundle contents to 'C:\tmp\layouts'.
```

<a id="takx-version-command"></a>

## Takx-version command

Use the `takx-version` command to determine the schema versions of the touch-adaptation bundle, and the highest schema version of the layouts that are included.

The following table shows the required options for determining the schema versions.

| Options                                 | Description                                                          |
| --------------------------------------- | -------------------------------------------------------------------- |
| `--takx`<br />`--takx-file <takx-file>` | Path to the touch adaptation bundle to determine the schema version. This parameter is required. |

### Example

Use the following code example to determine the schema versions of the touch-adaptation bundle.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak takx-version --takx-file C:\tmp\MyGameLayouts.takx
Version information for 'MyGameLayouts.takx':
  Version: 1.1.0.0
  Version Name: DLC 1
```

<a id="unpack-command"></a>

## Unpack command

Use the `unpack` command to expand a touch-adaptation bundle into its component files with the options shown in the following table.

| Options                                   | Description                                                  |
| ----------------------------------------- | ------------------------------------------------------------ |
| `--takx`<br/>`--takx-file <takx-file>`    | Path to the touch adaptation bundle that you want to unpack. This parameter is required. |
| `--out`<br/>`--output-path <output-path>` | Path to a directory that you want to unpack the bundle into. This parameter is required. |

### Example

Use the following code example to expand a bundle into its component files.

```
C:\Program Files (x86)\Microsoft GDK\bin>tak unpack --takx-file C:\tmp\MyGameLayouts.takx --output-path C:\tmp\MyGameLayout
Writing touch adaptation bundle contents to 'C:\tmp\MyGameLayout'.
```

<a id="verify-command"></a>

## Verify command

Use the `verify` command to verify that the contents of the touch-adaptation bundle are valid with the options shown in the following table.

| Options                                         | Description                                                                                                                                                                                                                                                      |
| ----------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `--takx`<br/>`--takx-file <takx-file>`          | Path to the touch adaptation bundle that you want to verify. This parameter is required.                                                                                                                                             |
| `--log`<br/>`--log-file`<br/>`--out <log-file>` | Path to a file that you want to write the verification results into. This parameter is required.                                                                                                                                     |
| `--default-layout <default-layout>`             | Set the name of the expected default layout. If this parameter is provided, a verification error is raised if the default layout isn't the same as the provided layout name.                                                 |
| `--layout-version <layout-version>`             | Specify the semantic version with which every layout in the touch-adaptation bundle must be compatible. If this parameter isn't specified, the only verification that's required is for all layouts to have a valid schema version. |
| `--manifest-version <manifest-version>`         | Specify the semantic version with which the manifest schema version must be compatible. If this parameter isn't specified, the only verification that's required is for the manifest to have a valid schema version.                |

### Example

Use the following code example to expand a bundle into its component files.

```
// Verify a touch adaptation bundle and have no errors
C:\Program Files (x86)\Microsoft GDK\bin>tak verify --takx-file C:\tmp\MyGameLayouts.takx
Verifying touch adaptation bundle 'C:\tmp\MyGameLayout.takx'.
Verification complete. 0 error(s) and 0 warning(s) found.

// Verify a touch adaptation bundle and specify an expected default layout and have an error when the default layout isn't present
C:\Program Files (x86)\Microsoft GDK\bin>tak verify --takx-file C:\tmp\MyGameLayouts.takx  --default-layout initialLayout
Verifying touch adaptation bundle 'C:\tmp\MyGameLayout.takx'.
ERROR: takxmanifest.json(1): error : Actual default layout 'menu_ui' isn't the expected default layout 'initialLayout'.
Verification complete. 1 error(s) and 0 warning(s) found.
```

## See also

[Getting started with touch](game-streaming-getting-started-with-touch.md)  
[Android Content test application (CTA)](game-streaming-android-content-test-application.md)  
[Windows PC Content test application (CTA)](game-streaming-windows-pc-content-test-application.md)
