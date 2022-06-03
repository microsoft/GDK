---
title: Set up your organization in Partner Center
description: Describes how to set up your organization with a free Azure Active Directory tenant to grant permissions to secure Xbox resources to multiple members.
author: KevinAsgari
ms.author: kevinasg
ms.prod: gdk
ms.topic: how-to
ms.date: 01/21/2022
security: public
---

# Set up your organization in Microsoft Partner Center

This simple guide shows you how to setup your organization in Partner Center with a free Azure Active Directory (AAD) tenant to ensure that members of your organization can access secure Xbox resources, such as documentation, downloads, and forums.

If you have an existing AAD tenant, you can associate that with your Partner Center account by following the instructions at [Associate Azure Active Directory with your Partner Center account](/windows/uwp/publish/associate-azure-ad-with-partner-center).

## Prerequisites

- A Partner Center account that has been onboarded for Xbox development.

## Set up your organization


1. Sign into Partner Center  as the account owner and visit your Account Settings (top right Cog menu).
1. Select User Management and you will see if an AAD tenant has been configured.
1. If no Azure AD has been associated with your account then you can select **Create new Azure AD** button to create one, free of charge.
    ![Image of connecting an Azure Active Directory tenant to your Partner Center account](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-connect-org.png)

1. Fill out the details to create an Azure Active Directory under the *yourOrganization.onmicrosoft.com* domain name.
    ![Image of creating a new Azure Active Directory](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-create-free-aad.png)"

1. The Global Administrator is a user account created specifically to manage the Azure AD.
    ![Image of the verification dialog showing that your AAD is successfully linked](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-aad-linked.png)

1. You can add users directly through Partner Center by signing in as the Partner Center account owner, viewing the account details, and select 'Add User'.
    ![Image of the add user option](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-user-management.png)
1. Fill out the details for the individual user.  This will be the username/email address that users will sign in to access resources.  Note that you can also set the Partner Center Role that a user is provided with.  
    > [!NOTE]
    > It is important to understand what each Partner Center Role has permission to do before assigning it to a user.  To learn more, see [Set roles or custom permissions for account users](/windows/uwp/publish/set-custom-permissions-for-account-users).  Many organizations set their users up with the Developer role.

    ![Image of adding a user to the AAD tenant](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-add-user.png)

1. Provide the new credentials to the user.
    ![Image of credentials for the new user](../../../../resources/gamecore/secure/images/en-us/partner-center/partner-center-user-added.png)

1. Have the user verify that they can access secure resources, such as the [Xbox Game Development Home](https://aka.ms/xgd).

## Next steps

For more information about managing your Partner Center account, see the following links:

- [Partner Center account management](/en-us/partner-center/partner-center-account-setup)
- [Add and manage multiple tenants in your Partner Center account](/en-us/partner-center/multi-tenant-account)
