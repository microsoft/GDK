---
author: M-Stahl
title: Split package (splitpkg.exe)
description: Builds subset packages from a master package.
kindex:
- Split package (splitpkg.exe)
- splitpkg.exe
ms.author: scotmi
ms.topic: conceptual
edited: 10/30/2019
security: public
applies-to: pc-gdk
---

# Split package (splitpkg.exe)
Builds subset packages from a master package. 
<table>
<tr><td><pre>
splitpkg command [/?]</pre>
</td></tr>
</table>

 
<table> 
<tr><th>

Option</th><th>

Description</th></tr>
 
<tr><td>command</td><td>Specifies the command to be performed. Supported commands are split, validate, and list.</td></tr>
 
<tr><td>/?</td><td>Shows Help text. To show Help for a specific command, use SPLITPKG &lt;command> /?</td></tr>
 </table>

 
<a id="ID4EIB"></a>

   

## Commands  
   
   *  [split command](#ID4EOB)  
   *  [validate command](#ID4END)  
   *  [list command](#ID4EAE)  

 
<a id="ID4EOB"></a>

   

### split command  
   
  
Splits a package created with [makepkg](makepkg.md) into one or more subset packages, according to a subset XML file.  
 
<table>
<tr><td><pre>
splitpkg split [/v] [/m] [/j] [/?] /f &lt;subsetfile> /p &lt;sourcepackage> [/s &lt;subsetname>] /pd &lt;destinationdir></pre>
</td></tr>
</table>

 
<table> 
<tr><th>

Option</th><th>

Description</th></tr>
 
<tr><td>/f</td><td>Specifies a subset XML file for defining how the subset packages are to be created.</td></tr>
 
<tr><td>/p</td><td>Specifies the path to the source package. For producing a compilation disc, this parameter can be provided more than once.</td></tr>
 
<tr><td>/s</td><td>Specifies an optional subset name. This option will produce only split packages that have the specified name. Multiple /s parameters can be added.</td></tr>
 
<tr><td>/pd</td><td>Specifies the destination path for the created subset packages.</td></tr>
 
<tr><td>/v</td><td>Enables verbose output of messages to the console.</td></tr>
 
<tr><td>/m</td><td>Specifies the maximum allowable size for a package, in GB. Default is 49 GB. For no restriction on size, pass a value of 0 (zero).</td></tr>
 
<tr><td>/j</td><td>All output from the tools will also emit a JSON object.</td></tr>
 
<tr><td>/?</td><td>Shows this Help text.</td></tr>
 </table>

  
<a id="ID4END"></a>

   

### validate command  
   
  
Runs the validation steps for detecting potential issues with splitting of a package. Takes the same parameters as those taken by the `splitpkg split` command, with the exception of a destination path, which isn't required for validation.  
 
<table>
<tr><td><pre>
splitpkg validate [options] /f &lt;subsetfile> /p &lt;sourcepackage> [/s &lt;subsetname>]</pre>
</td></tr>
</table>

  
<a id="ID4EAE"></a>

   

### list command  
   
  
For the specified subset file, lists the subset package–related information as JSON objects.  
 
<table>
<tr><td><pre>
splitpkg list [/v] [/?] /f &lt;subsetfile></pre>
</td></tr>
</table>

 
<table> 
<tr><th>

Option</th><th>

Description</th></tr>
 
<tr><td>/f</td><td>Specifies a subset XML file for defining how the subset packages are to be created.</td></tr>
 
<tr><td>/v</td><td>Enables verbose output of messages to the console.</td></tr>
 
<tr><td>/?</td><td>Shows this Help text.</td></tr>
 </table>

   
<a id="ID4EDF"></a>

   

## Package schema  
   
  
The following schema is used to define how the package is to be split.  
   
```
      
<?xml version="1.0" encoding="utf-8"?>
<xs:schema id="Package" xmlns="" xmlns:xs="https://www.w3.org/2001/XMLSchema" xmlns:msdata="urn:schemas-microsoft-com:xml-msdata">

  <!--PACKAGE SCHEMA-->
  <xs:element name="Packages">
    <xs:complexType>
      <xs:choice minOccurs="1" maxOccurs="unbounded">
        <xs:element name="Package">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="Include" minOccurs="0" maxOccurs="unbounded">
                <xs:complexType>
                  <xs:attribute name="ChunkId" type="xs:string"/>
                  <xs:attribute name="Languages" type="xs:string"/>
                  <xs:attribute name="Devices" type="deviceType"/>
                  <xs:attribute name="ContentTypes" type="contentType" />
                  <xs:attribute name="Tags" type="xs:string" />
                  <xs:attribute name="Disc" type="xs:integer" />
                  <xs:attribute name="Features" type="xs:string" />
                </xs:complexType>
              </xs:element>
              <xs:element name="Exclude" minOccurs="0" maxOccurs="unbounded">
                <xs:complexType>
                  <xs:attribute name="ChunkId" type="xs:string"/>
                  <xs:attribute name="Languages" type="xs:string"/>
                  <xs:attribute name="Devices" type="deviceType"/>
                  <xs:attribute name="ContentTypes" type="contentType" />
                  <xs:attribute name="Tags" type="xs:string" />
                  <xs:attribute name="Features" type="xs:string" />
                </xs:complexType>
              </xs:element>
            </xs:sequence>
            <xs:attribute name="Name" type="xs:string" use="required"/>
            <xs:attribute name="Description" type="xs:string" use="optional"/>
            <xs:attribute name="Source" type="xs:string" use="optional"/>
            <xs:attribute name="MaxDiscs" type="xs:string" use="optional"/>
          </xs:complexType>
        </xs:element>
      </xs:choice>
    </xs:complexType>
  </xs:element>

  <xs:simpleType name="deviceType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="Xbox-Durango"/>
      <xs:enumeration value="Xbox-Scorpio"/>
      <xs:enumeration value="Xbox-Lockhart"/>
      <xs:enumeration value="Xbox-Anaconda"/>
    </xs:restriction>
  </xs:simpleType>

  <xs:simpleType name="contentType">
    <xs:restriction base="xs:string">
      <xs:enumeration value="SinglePlayer"/>
      <xs:enumeration value="MultiPlayer"/>
    </xs:restriction>
  </xs:simpleType>

</xs:schema>  
```
  
<a id="ID4EMF"></a>

   

## See also  
 [Deployment package schema](atoc-deployment-schema.md)

 [Make package (makepkg.exe)](makepkg.md)

  