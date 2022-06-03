---
author: aablackm
title: Deploy
description: Deploys the specified app package.
ms.assetid: M:Windows.Xbox.xtfapplication.IXtfApplicationClient.Deploy(LPCWSTR,BOOL,IXtfDeployCallback,BOOL,int,LPBSTR,LPBSTR)
kindex:
- Deploy method
- IXtfApplicationClient--Deploy method
ms.author: stevenpr
ms.topic: reference
edited: 06/05/2019
security: public
---

# IXtfApplicationClient::Deploy
  
Deploys the specified app package.  
  
<a id="syntaxSection"></a>
  
## Syntax
  
```cpp
public:
HRESULT Deploy(
         LPCWSTR pszDeployFilepath,
         BOOL fRemoveExtraFiles,
         IXtfDeployCallback *pCallback,
         BOOL *pfCanceled,
         int *pdwResult,
         LPBSTR pbstrPackageFullName,
         LPBSTR pbstrAumidJson
)  
```
  
<a id="parametersSection"></a>
  
### Parameters
  
*pszDeployFilepath*  
Type: LPCWSTR  
  
A pointer to the path, relative to the root folder of the title scratch drive, into which to deploy the app package.  
  
*fRemoveExtraFiles*  
Type: BOOL  
  
Specify TRUE to remove files that are already on the development console but are not part of the deployment package; otherwise, FALSE to keep them.  
  
*pCallback*  
Type: IXtfDeployCallback\*  
  
A pointer to the [IXtfDeployCallback](../../IXtfDeployCallback/ixtfdeploycallback-xtfapplication-xbox-microsoft-t.md) callback to invoke when a trackable action occurs during the deployment. Set to `nullptr` if you do not want callbacks during deployment.  
  
*pfCanceled*  
Type: BOOL\*  
  
A pointer that receives a Boolean value that indicates whether deployment was canceled.  
  
*pdwResult*  
Type: int\*  
  
A pointer that receives the HRESULT of the deployment operation. For example, if an open file handle prevents a file from being deleted, this parameter receives the HRESULT error code.  
  
*pbstrPackageFullName*  
Type: LPBSTR  
  
A pointer that receives the full name of the deployed app package, including the version number, architecture, and culture.  
  
*pbstrAumidJson*  
Type: LPBSTR  
  
A pointer that receives a JSON representation of a list of the AUMIDs associated with the app package. All AUMIDs in the list share the same `PackageFamilyName`, but have different AppIds after the exclamation mark ("!") in each AUMID.  
  
<a id="retvalSection"></a>
  
### Return value
  
Type: HRESULT  
  
Returns `S_OK` if successful; otherwise, returns an HRESULT error code.  
  
<a id="remarksSection"></a>
  
## Remarks
  
This method performs a push deployment of your title onto an Xbox dev kit for testing. Your title is deployed to the title scratch drive, in the folder specified in `pszDeployFilepath`. After the method successfully completes the deployment, your title is ready to launch. For more information about deploying app packages, see [Deploying your title to your Xbox Development Kit (NDA topic)](../../../../../../../tools-console/usinggsdk/deployment/deployment.md).  
  > [!NOTE]
> This function runs synchronously.
  
This method is similar to the `xbapp deploy` command from the Application Management (xbapp.exe) tool,  included as part of the Xbox Tools Framework (XTF). For more information about the `xbapp deploy` command, see [Application Management (xbapp.exe) (NDA topic)](../../../../../../../tools-console/xbox-tools-and-apis/commandlinetools/xbapp.md).  
  
<a id="remarks_output"></a>
  
### Handling LPBSTR pointers
  
For more information about handling LPBSTR pointers returned by this function, see [Allocating and Releasing Memory for a BSTR](/cpp/atl-mfc-shared/allocating-and-releasing-memory-for-a-bstr?view=vs-2019).  
  
<a id="requirementsSection"></a>
  
## Requirements
  
**Header:** xtfapplication.h  
  
**Library:** xtfapplication.lib  
  
**Supported platforms:** Windows (for Xbox console tools)  
  
<a id="seealsoSection"></a>
  
## See also
  
[IXtfApplicationClient](../ixtfapplicationclient-xtfapplication-xbox-microsoft-t.md)  
[XtfApplication](../../../xtfapplication-xbox-microsoft-n.md)  
  