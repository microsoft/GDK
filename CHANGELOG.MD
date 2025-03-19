
# Change Log

## October 2024 GDK Update

### ✨Features
- **Graphics**: Auto-Vectorizer for 16-bit workloads: Optimization technique for Xbox 16-bit workloads, leveraging Xbox hardware instructions to improve runtime performance automatically. The feature is enabled by default for 16-bit workloads and can be turned off using `__XBOX_ENABLE_AUTOVEC=0`.
- **System**: Console Developer Home Update: The streaming tab has removed the dropdown box to select the streaming protocol, simplifying the UX. The protocol is now automatically configured by client applications, and it is now possible to simultaneously listen for remote connect and direct connect requests. Active streams are disconnected when a new client connects.
- **Developer Tools**: GDK Installer Updates: The installer now includes new links for additional tools upon installation. These tools are web-based or obtained via other channels and support various game creator tasks.
- **Developer Tools**: Touch Adaptation Kit Command Line Tool (tak.exe): The TAK tool now listens for changes to the `takxconfig.json` file when using the serve command, allowing creators to swap out different asset directories, change configured languages, and see live updates to their bundle.
- **Developer Tools**: TAK Feedback Improvements: The TAK tool now includes telemetry to help Microsoft improve the product. Use the `tak.exe --help` command to learn more.

### 🛠️Bug Fixes
- **Graphics**: Fixed an issue where a rare assertion failure in `XDXROfflineBVH.dll` would occur when building an offline bottom-level acceleration structure (BLAS).
- **Game Chat 2**: Fixed an issue that caused a crash in Game Chat 2 after the user changed their console language setting.
- **Shader Compiler**: Fixed an issue where `NGG_VS` (compiler-based culling enablement) had a potential hardware hang with lots of fully culled groups.
- **Media**: Fixed an issue that caused the title to stop responding upon source reader termination.
- **PIX**: Fixed multiple issues in PIX, including crashes and errors related to GPU timings and corrupted `ExecuteIndirect` packets.

<br>
More information can be found here: https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/intro/whatsnew/whats-new
<br>

----

## June 2024 GDK Update

### ✨Features
- **Graphics**: Auto-Vectorizer for 16-bit workloads: Optimization technique for Xbox 16-bit workloads, leveraging Xbox hardware instructions to improve runtime performance automatically. The feature is enabled by default for 16-bit workloads and can be turned off using `__XBOX_ENABLE_AUTOVEC=0`.
- **System**: Console Developer Home Update: The streaming tab has removed the dropdown box to select the streaming protocol, simplifying the UX. The protocol is now automatically configured by client applications, and it is now possible to simultaneously listen for remote connect and direct connect requests. Active streams are disconnected when a new client connects.
- **Developer Tools**: GDK Installer Updates: The installer now includes new links for additional tools upon installation. These tools are web-based or obtained via other channels and support various game creator tasks.
- **Developer Tools**: Touch Adaptation Kit Command Line Tool (tak.exe): The TAK tool now listens for changes to the `takxconfig.json` file when using the serve command, allowing creators to swap out different asset directories, change configured languages, and see live updates to their bundle.
- **Developer Tools**: TAK Feedback Improvements: The TAK tool now includes telemetry to help Microsoft improve the product. Use the `tak.exe --help` command to learn more.

### 🛠️Bug Fixes
- **Graphics**: Fixed an issue where a rare assertion failure in `XDXROfflineBVH.dll` would occur when building an offline bottom-level acceleration structure (BLAS).
- **Game Chat 2**: Fixed an issue that caused a crash in Game Chat 2 after the user changed their console language setting.
- **Shader Compiler**: Fixed an issue where `NGG_VS` (compiler-based culling enablement) had a potential hardware hang with lots of fully culled groups.
- **Media**: Fixed an issue that caused the title to stop responding upon source reader termination.
- **PIX**: Fixed multiple issues in PIX, including crashes and errors related to GPU timings and corrupted `ExecuteIndirect` packets.

<br>
More information can be found here: https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/intro/whatsnew/archive/whats-new-2406
<br>

----

## March 2024 GDK Update

### ✨Features
- **Graphics**: DirectX 12 Ultimate support, including features like DirectX Raytracing 1.1, Variable Rate Shading, Mesh Shaders, and Sampler Feedback.
- **Graphics**: Shader Model 6.6 introduction, which includes new features like dynamic resource binding and improved debugging capabilities.
- **System**: Improved memory management system to reduce fragmentation and improve performance.
- **System**: Updated file system performance and reliability, including faster file access and better error handling.
- **Developer Tools**: GDK Debugger Enhancements with improved breakpoint management and enhanced variable inspection.
- **Developer Tools**: Performance Profiler tool introduced to help developers identify and optimize performance bottlenecks.

### 🛠️Bug Fixes
- **Graphics**: Fixed issues related to texture rendering and shader compilation.
- **System**: Addressed bugs causing system crashes and memory leaks.
- **Developer Tools**: Resolved issues with the debugger and performance profiler.

<br>
More information can be found here: https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/intro/whatsnew/archive/whats-new-2403
<br>

----

## October 2023 GDK Update

### ✨Features
- **System**: Franchise Game Hubs support added, allowing creators to build a franchise game launcher on console. Improved APIs for download, update, install, enumerate, query, and storage access.
- **System**: Shareable Persistent Local Storage can now be marked as shareable between related games, allowing them to read each other's storage.
- **Networking**: PlayFab Event Pipeline Compression support added to reduce payload size, substantially reducing bandwidth consumption for larger payloads.
- **Developer Tools**: XBTPLinkSvc.exe now supports developer scenarios around 10GbE, enabling faster deployment speeds when using an Xbox Series X Dev Kit.
- **Developer Tools**: DevKit Agent introduced as a new way of managing consoles from a hosted web service. The console Agent heartbeats to a hosted service and requests jobs to be run on the console.
- **Developer Tools**: Windows SDK Requirement updated; starting with October 2023 version of the GDK, the minimum supported version of the Windows SDK is version 22000.

### 🛠️Bug Fixes
- **Graphics**: Fixed issues related to texture rendering and shader compilation.
- **System**: Addressed bugs causing system crashes and memory leaks.
- **Developer Tools**: Resolved issues with the debugger and performance profiler.

<br>
More information can be found here: https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/intro/whatsnew/archive/whats-new-2310
