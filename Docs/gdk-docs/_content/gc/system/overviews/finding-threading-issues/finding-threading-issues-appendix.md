---
author: M-Stahl
title: Appendix
description: Provides the appendices that are referenced in the Finding threading issues documentation.
kindex:
- Finding Threading Issues
- threads
- performance
- context switch
- CPU
- PIX
- WPA
ms.author: erwals
ms.topic: conceptual
edited: 12/16/2020
security: public
---

# Appendix

This topic provides the appendices that are referenced in the Finding threading issues documentation.

## Appendix A: Batch file to create ETL traces <a name="appendix-a"></a>
```bat
echo OFF
REM Use the name on the command line for the capture or use the default.
set ETWName=%1
if "%1"=="" set ETWName=ThreadData

REM Wait until a game has been launched.
xbconnect /WT /QG

REM This is the save path on the console, not on your computer.
set SavePath=d:\
xbdir /x/title xd:\profile > NUL
if %ERRORLEVEL% EQU 0 set SavePath=%SavePath%profile\

REM Start the capture on the Default Console.
xbrun /x/title /O xperf -start -on DISPATCHER+PROC_THREAD+LOADER+CSWITCH+PROFILE -stackwalk PROFILE+CSWITCH+READYTHREAD -f %SavePath%%ETWName%.etl

REM Wait for the user to press a key to stop the capture.
PAUSE

REM Stop the capture, merging the file to resolve events.
xbrun /x/title /O xperf -stop -d %SavePath%%ETWName%_merge.etl
REM Copy the .etl file over to the PC, and then open it.
xbcp /x/title x%SavePath%%ETWName%_merge.etl
start %ETWName%_merge.etl
```

## Appendix B: Understanding thread states&mdash;running, suspended/waiting, and ready <a name="appendix-b"></a>

  Threads can be in many different states. However, for this section's purposes, it's important to understand the following three high-level classes of states.

  - **Running:** The thread is currently executing on a CPU core.
  - **Suspended/waiting:** The thread isn't executing and is waiting to be put into a
  different state.
  - **Ready:** The thread is ready to be scheduled on a CPU core but hasn't yet been
  scheduled to run.

  Here's an example of how these states can interact. ThreadA is running and acquires a lock that guards a shared resource from being
  accessed by more than one thread at a time. ThreadB is also running and goes to access the same
  resource and attempts to acquire the same lock. Because the lock is
  currently held by ThreadA, ThreadB waits. Later,
  ThreadA releases the lock on the shared resource, which puts ThreadB into the
  readied state. It tells the scheduler that ThreadB is ready to
  be scheduled on a CPU core. There will be a context switch when ThreadB is
  scheduled. ThreadA will be listed as the "Readied By" thread (sometimes also
  called the "readying thread") with the call stack that caused ThreadB to be
  put into the readied state.