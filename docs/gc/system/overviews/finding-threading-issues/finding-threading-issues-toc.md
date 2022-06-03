---
author: M-Stahl
title: Finding threading issues (contents)
description: Provides links to steps for identifying and debugging common threading issues by using both Performance Investigator for Xbox (PIX) and Windows Performance Analyzer (WPA)."
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

# Finding threading issues

This section describes the high-level steps for finding common threading issues
within a Microsoft Game Development Kit (GDK) title. Steps are included for using both
Performance Investigator for Xbox (PIX) and Windows Performance Analyzer (WPA).

## In this section  
  
[Common Steps](common-steps.md)  
The steps used at the start of investigating each threading issue.  
  
[Core utilization: idle time](core-utilization-idle.md)  
Provides steps for identifying underutilized CPU cores or threads that aren’t running at their expected usage.  
  
[Thread locking](threads-locking.md)  
Provides the steps for identifying where threads are locking.  
  
[Serialization](serialization.md)  
Provides the steps for identifying where threads serialize, which prevents multithreaded systems from running in parallel.  
  
[High context switch rate](high-context-switches.md)  
Provides steps for identifying cores and threads that have a high number of context switches, which degrades performance.  
  
[Core utilization: spinning](core-utilization-spinning.md)  
Describes the steps that are used for identifying threads that are spinning for extended periods of time.  
  
[Floating threads](floating-threads.md)  
Provides the steps for finding threads that are floating between cores, which can stall more critical threads.  
  
[Appendix](finding-threading-issues-appendix.md)  
Provides the appendices that are referenced in the Finding threading issues documentation.  
  


These steps should put you well on your way to finding the causes of 
common threading issues. If your questions aren't answered in these topics, please
see the [Xbox Developer Forums](https://aka.ms/gdkforum). You'll find a wealth of information there along with experts who can help answer your questions.