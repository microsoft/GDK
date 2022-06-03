---
author: DougGal
title: MsQuic
description: Provides an overview of using MsQuic with the Microsoft Game Development Kit (GDK).
kindex: MSQUIC
ms.author: DougGal
ms.topic: conceptual
edited: 9/15/2021
security: public
---

# MsQuic

This topic describes how to use [MsQuic](https://github.com/microsoft/msquic) with the Microsoft Game Development Kit (GDK).  MsQuic is a
Microsoft implementation of the [IETF QUIC](https://datatracker.ietf.org/wg/quic/about/) protocol. It is
cross-platform, written in C and designed to be a general purpose QUIC library.

QUIC was originally designed to replace scenarios using "TLS over TCP" such as HTTP, but has since been expanded into a
general purpose UDP data transport layer suitable for multiplexing real time unreliable datagram messages and reliable
TCP-like streams over a single connection.  This makes it particularly appealing as a client/server transport layer
and basis for real time game traffic data flows.

MsQuic is tailored for GDK titles, and is also available for a multitude of platforms including Windows server,
Linux desktop and server, iOS, Android, and MacOS.

The [MsQuic API documentation](https://github.com/microsoft/msquic/blob/main/docs/API.md) covers a number of important
MsQuic concepts and shows how to code against the MsQuic API surface.

## QUIC features

 - All packets are encrypted and handshake is authenticated with TLS 1.3.
 - Parallel streams of reliable and unreliable application data.
 - Exchange application data in the first round trip (0-RTT).
 - Improved congestion control and loss recovery.
 - Survives a change in the clients IP address or port.
 - Stateless load balancing.
 - Easily extendable for new features and extensions.

## MsQuic implementation

In addition to being tailored for use with GDK titles, MsQuic has several features that differentiates it from other QUIC implementations:

 - Optimized for client and server.
 - Optimized for maximal throughput and minimal latency.
 - Asynchronous IO.
 - Receive side scaling (RSS) support.
 - UDP send and receive coalescing support.

MsQuic implements the following QUIC RFCs:
 - [RFC 9000](https://datatracker.ietf.org/doc/html/rfc9000)
 - [RFC 9001](https://datatracker.ietf.org/doc/html/rfc9001)
 - [RFC 9002](https://datatracker.ietf.org/doc/html/rfc9002)

MsQuic implements the following QUIC draft extensions:
 - [Datagram](https://datatracker.ietf.org/doc/html/draft-ietf-quic-datagram)
 - [Version Negotiation](https://datatracker.ietf.org/doc/html/draft-ietf-quic-version-negotiation)
 - [Load Balancing](https://datatracker.ietf.org/doc/html/draft-ietf-quic-load-balancers)
 - [ACK Frequency](https://datatracker.ietf.org/doc/html/draft-ietf-quic-ack-frequency)
 - [Perf Testing](https://datatracker.ietf.org/doc/html/draft-banks-quic-performance)

## Acquiring MsQuic

MsQuic is hosted in an open source github repository.  You should aquire MsQuic via one of its official releases
located [here](https://github.com/microsoft/msquic/blob/main/docs/Release.md).  Xbox Series X&#124;S console support was
added in prerelease/1.9, although we recommend that you take the latest official release version when possible for Microsoft Game Development Kit (GDK) titles.

Pre-built MsQuic binaries for a given release are available under the
[Assets](https://github.com/microsoft/msquic/releases) section for a particular release.  All build flavors for a
particular version of MsQuic are fully compatible with one another.  While MsQuic also tries to maintain backwards
compatibility for their releases, refer to the MsQuic documentation and release notes for any compatibility
expectations among different versions.

### Microsoft Game Development Kit (GDK).PC

The `msquic_windows_x64_Release_openssl` pre-built binary is recommended for Microsoft Game Development Kit (GDK).PC titles.

Microsoft Game Development Kit (GDK) titles on PC run as native x64 Win32 applications.  You should use the version of
MsQuic built for the x64 platform.  On PC, we recommend using the version of MsQuic built with OpenSSL as that
supports all OS versions that the Microsoft Game Development Kit (GDK) supports as opposed to Schannel that is only supported on the Windows
11 OS and later.

### Microsoft Game Development Kit (GDK).Console

The `msquic_gamecore_console_x64_Release_schannel` pre-built binary is recommended for Microsoft Game Development Kit (GDK).PC titles.

MsQuic provides a special build flavor for Microsoft Game Development Kit (GDK) titles on Xbox consoles.  This flavor restricts MsQuic
to the APIs under the `WINAPI_PARTITION_GAMES` and causes MsQuic to link against the `XGamePlatform.lib`.  In order to
consume this build flavor, you must have the XGDK from the October 2021 release or later installed.  MsQuic uses
Schannel when building for Microsoft Game Development Kit (GDK) console.

<a id="ClientServerAuthentication"></a>
## Client and Server Authentication

MsQuic automatically utilizes the same authentication and verification paths as used for HTTPS web requests in order to
authenticate your server.  Client authentication should follow the best practices outlined in [best practices for
secure client/server communication (NDA topic)](../../../security/communication-security/communication-security-impl/gc-secure-game-mesh-impl.md#ClientAuthentication).

In MsQuic, on both the client and server you should use the
[ConfigurationLoadCredential](https://github.com/microsoft/msquic/blob/main/docs/api/ConfigurationLoadCredential.md)
API with an appropriate
[QUIC_CREDENTIAL_CONFIG](https://github.com/microsoft/msquic/blob/main/docs/api/QUIC_CREDENTIAL_CONFIG.md) in order to
configure your certificates.  All cipher suites included by default in MsQuic are considered secure, but it is
important to properly setup how MsQuic validates the certificates on both the client and server to ensure a secure and
authenticated communication channel is established.

On the server, in order to use XSTS token client authentication, you should specify the
`QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION`, `QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED`, and
`QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION` flags.  When you specify the
`QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION` flag, you must validate the client certificate yourself within the
[QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED](https://github.com/microsoft/msquic/blob/main/docs/api/QUIC_CONNECTION_EVENT.md#quic_connection_event_peer_certificate_received)
event callback as described in the [best practices for secure client/server
communication (NDA topic)](../../../security/communication-security/communication-security-impl/gc-secure-game-mesh-impl.md#ClientAuthentication) section.

Furthermore on the server, you should provide a properly rooted certificate in order to allow the client to authenticate
your server just as you would in an HTTPS web server.

On the client, you should *never* specify the `QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION` flag, as the default
MsQuic behavior for server authentication is the easiest and most secure way to validate identity.  Instead, for XSTS
token client authentication you should specify the `QUIC_CREDENTIAL_FLAG_CLIENT` flag along with the certificate
generated by your server as described in the [best practices for secure client/server
communication (NDA topic)](../../../security/communication-security/communication-security-impl/gc-secure-game-mesh-impl.md#ClientAuthentication) section.  We recommend to supply the client
certificate by specifying the `QUIC_CREDENTIAL_TYPE_CERTIFICATE_CONTEXT` mode and using APIs such as
[CertCreateContext](/en-us/windows/win32/api/wincrypt/nf-wincrypt-certcreatecontext) to
generate the context directly from your web request response data.

## Network initialization

MsQuic doesn't automatically handle [network initialization](../initialization-connectivity-networking.md#ID4ETA) for
Microsoft Game Development Kit (GDK) titles. Wait for the network to become initialized after your title is launched and after each resume
before initializing MsQuic with [MsQuicOpenVersion](https://github.com/microsoft/msquic/blob/main/docs/api/MsQuicOpenVersion.md)
or [MsQuicOpen](https://github.com/microsoft/msquic/blob/main/docs/api/MsQuicOpen.md).

<a id="SuspendResume"></a>
## Suspend and resume

You should register for suspend and resume events via `RegisterAppStateChangeNotification`. On suspend, you should close
any open streams and subsequently close MsQuic.  Then, on resume, you should wait for network initialization and then
re-open MsQuic.

In order to close all MsQuic streams quickly within the suspend timeout, you should first for each open stream call
[StreamShutdown](https://github.com/microsoft/msquic/blob/main/docs/api/StreamShutdown.md) with the
`QUIC_STREAM_SHUTDOWN_FLAG_ABORT` and `QUIC_STREAM_SHUTDOWN_FLAG_IMMEDIATE` flags.  This will immediately trigger a
`QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE` event at which point it is safe to call
[StreamClose](https://github.com/microsoft/msquic/blob/main/docs/api/StreamClose.md) to close the stream.  Once all
streams have been closed for a given connection, you should call
[ConnectionShutdown](https://github.com/microsoft/msquic/blob/main/docs/api/ConnectionShutdown.md) with the
`QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT` flag followed by
[ConnectionClose](https://github.com/microsoft/msquic/blob/main/docs/api/ConnectionClose.md).  Once all connections have
been closed, you should call
[RegistrationClose](https://github.com/microsoft/msquic/blob/main/docs/api/RegistrationClose.md) and
[ConfigurationClose](https://github.com/microsoft/msquic/blob/main/docs/api/ConfigurationClose.md) for any outstanding
registrations and configurations followed by
[MsQuicClose](https://github.com/microsoft/msquic/blob/main/docs/api/MsQuicClose.md).

## Preferred port

Microsoft Game Development Kit (GDK) titles are encouraged to use the [preferred local UDP multiplayer
port](preferred-local-udp-multiplayer-port-networking.md) for your main game traffic.  You can set this port in MsQuic
with via the [SetParam](https://github.com/microsoft/msquic/blob/main/docs/api/SetParam.md) function with the
`QUIC_PARAM_CONN_LOCAL_ADDRESS` setting on a connection object handle before calling
[ConnectionStart](https://github.com/microsoft/msquic/blob/main/docs/api/ConnectionStart.md).

When setting the `QUIC_PARAM_CONN_LOCAL_ADDRESS`, we recommend specifying the `AF_UNSPEC` family to allow for dual-stack
IPv4 and IPv6 sockets.  Here is an example of how you might set the preferred port given `MsQuicCallTable` was returned
from [MsQuicOpen](https://github.com/microsoft/msquic/blob/main/docs/api/MsQuicOpen.md) and `MsQuicConnectionHandle` was
returned from [ConnectionOpen](https://github.com/microsoft/msquic/blob/main/docs/api/ConnectionOpen.md).

```
uint16_t preferredPort;
if (SUCCEEDED(XNetworkingQueryPreferredLocalUdpMultiplayerPort(&preferredPort)))
{
    QUIC_ADDR localAddress = {};
    localAddress.si_family = AF_UNSPEC;
    localAddress.Ipv4.sin_port = htons(preferredPort);

    QUIC_STATUS status = MsQuicCallTable->SetParam(
        MsQuicConnectionHandle,
        QUIC_PARAM_LEVEL_CONNECTION,
        QUIC_PARAM_CONN_LOCAL_ADDRESS,
        sizeof(localAddress),
        &localAddress);
}
```

## Memory considerations

MsQuic's performant implementation allows for high bandwidths to be transfered to and from your Microsoft Game Development Kit (GDK)
title.  As an extension to [WinSock Memory Considerations](winsock-intro-networking.md#SocketMemory), when using MsQuic
you should follow these best practices in order to minimize the memory consumption by the kernel:

Microsoft Game Development Kit (GDK) titles should keep any execution time in the callback to a minimum. MsQuic does not use
separate threads for the protocol execution and upcalls to the app. Therefore, any significant delays in the callback
will delay the protocol and increase the memory consumption required by the kernel. Any significant time or work needed
to be completed by the title must happen on its own thread.

Microsoft Game Development Kit (GDK) titles should manage their send buffers efficiently in order to minimize kernel memory usage.  See
[Send buffering in MsQuic](https://github.com/microsoft/msquic/blob/main/docs/Streams.md#send-buffering) for more
details on how MsQuic allows your title to manage this.

We highly recommend using asynchronous receives with MsQuic to ensure that any received data is transfered to user mode
buffers efficiently.  [Receiving in
MsQuic](https://github.com/microsoft/msquic/blob/main/docs/Streams.md#receiving) has additional details about how to
handle asynchronous receives.  Furthermore, we recommend not using the partial data acceptance feature in MsQuic
GDK clients to minimize the amount of kernel memory consumed.

## See also

[MsQuic](https://github.com/microsoft/msquic)

[MsQuic API documentation](https://github.com/microsoft/msquic/blob/main/docs/API.md)

[MsQuic releases](https://github.com/microsoft/msquic/blob/main/docs/Release.md)

[Building MsQuic documentation](https://github.com/microsoft/msquic/blob/main/docs/BUILD.md)
