---
title: Multiplayer session browse
description: Describes how a user can query for a list of open multiplayer game sessions that are available in your title by using the multiplayer session browse feature.
kindex:
- Multiplayer session browse
- session browse
author: joannaleecy
ms.author: migreen
ms.topic: conceptual
ms.assetid: b4b3ed67-9e2c-4c14-9b27-083b8bccb3ce
ms.localizationpriority: medium
ms.date: 10/16/2017
edited: 03/05/2021
security: public
---

# Multiplayer session browse

Use this topic to enable your title for users to query a list of open multiplayer game sessions that meet their specified criteria by using multiplayer session browse.
  
Multiplayer session browse was introduced in November 2016. 
In a session browse scenario, a user in a game can retrieve a list of joinable game sessions. 
Each session entry in this list contains some additional metadata about the game, which a user can use to help them select which session to join. 
The user can also filter the list of sessions by using the metadata.
After the user sees a game session that appeals to them, they can join the session.

A user can also create a new game session and use the session browse feature to recruit additional users rather than rely on matchmaking. 
Multiplayer session browse and traditional matchmaking are different. With the multiplayer session browse, the user 
selects which game session they want to join. With matchmaking, the user selects a 
"find a game" option that attempts to automatically place the user in an appropriate game session.  
  
While multiplayer session browse is a manual and slower process that might not always select the best gaming experience 
for the user, the user has more control, and the browse feature can be perceived as the subjectively better game pick. 
It's common to include both multiplayer session browse and matchmaking scenarios in games.
Typically, matchmaking is used for commonly played game modes, while multiplayer session browse is used for custom games.  
  
## Example scenario  
  
John wants to play a battle arena multiplayer game, but he wants to play a game where all the users select their hero randomly. 
He can retrieve a list of open game sessions and find the ones that include "random heroes" in their description by using multiplayer session browse.   
  
If the UI of the title has the option, he can select the "random hero" game mode and retrieve only the sessions that are tagged to indicate that they're "RandomHero" games. 
When John finds a game session that he likes, he can join that session. 
After enough people have joined, the host of the game session can start it.  

## Roles

A session that's in the multiplayer session browse feature might specify that it's recruiting users for specific roles. 
For example, a user might want to create a game session that specifies that it contains no more than five assault classes, 
but it must contain at least two healer roles, and at least one tank role.

When another user applies for the session, they can pre-select their role. The service then decides if they can join the 
session based on how many open slots that are available for the selected role. 
If a user wants to reserve two slots for their friends to join, they can designate a "friends" role for the session, and 
only users that are friends with the host can fill the two slots that are dedicated to the "friends" role.

For more information about roles, see [Multiplayer roles](live-multiplayer-roles.md).  
  
## How multiplayer session browse works  
  
Session browse works by using search handles.
A search handle is a packet of data that contains a reference to the session, as well as additional metadata about the session, such as search attributes.

When a title creates a new game session that's eligible for multiplayer session browse, it creates a search handle for the session.
The search handle is stored in the [Multiplayer Service Directory (MPSD)](/gaming/xbox-live/features/multiplayer/mpsd/live-mpsd-overview), which maintains the search handles for the title. 
When a title needs to retrieve a list of sessions, the title can send a search query to MPSD, which returns a list of search handles that meet the search criteria. 
The title can then use the list of sessions to display a list of joinable games to the user.
When a session is full, or otherwise can't be joined, your title can remove the search handle from MPSD so 
that the session doesn't show up in multiplayer session browse queries.
> [!NOTE]
> Search handles are used when displaying a list of sessions to a user. 
Don't use search handles for background matchmaking. For background matchmaking, we recommend using SmartMatch. 
For more information, see [Finding a multiplayer game by using SmartMatch using Multiplayer Manager](../mpm/how-to/live-play-multiplayer-with-matchmaking.md).  
  
## Set up a session for multiplayer session browse

To use search handles for a session, the session must have `searchable` and `userAuthorizationStyle` set to `true`. 
The `userAuthorizationStyle` capability is only required for UWP games, but we recommend implementing them for all Xbox Live games, including Microsoft Game Development Kit (GDK) games. This ensures future portability for your title.
> [!NOTE]
> Configuring `userAuthorizationStyle` to `true` changes the `readRestriction` and `joinRestriction` of the session to `local` instead of `none`. This means that titles must use search or transfer handles to join a game session.

You can set these capabilities in the session template when you configure your Xbox Live services.
> [!NOTE]
> For multiplayer session browse, only create search handles on sessions that are used for actual gameplay. Don't use them for lobby sessions.

## Game session ownership  

Many game session types, such as SmartMatch or a friends-only session, don't require a host or owner. However, when setting up multiplayer session browse games, you might want an owner. 
Having an owner-managed session has some benefits for the host, such as 
removing other members from the session or changing the ownership status of other members. 
To use owners for a session, the session must have `hasOwners` set to `true`. 
When using [Multiplayer roles](live-multiplayer-roles.md), you can set it so only owners can assign roles to users.
> [!NOTE]
> If an owner of a session has an Xbox Live member blocked, that member can't join the session.

If all owners leave a session, then the service acts on the session based on the `ownershipPolicy.migration` policy that's defined for the session. 
If the policy is "oldest", then the user that has been in the session the longest is set as the new owner.
If the policy is "endsession" (the default, if one isn't supplied), then the service ends the session and removes all the remaining users from the session.
  
## Search handles  
  
A search handle is stored in MPSD as a JSON structure.
In addition to containing a reference to the session, search handles also contain additional metadata for searches, known as search attributes. 
A session can only have one search handle that's created for it at any time. 
To create a search handle for a session by using the Xbox Live APIs, call the [XblMultiplayerCreateSearchHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayercreatesearchhandleasync.md) method.

### Search attributes

Search attributes consists of the following components.
 * The `tags` are string descriptors that people can use to categorize a game session, like a hashtag. 
    * Tags must start with a letter, can't contain spaces, and must be less than 100 characters.
    * Example tags: "ProRankOnly", "norocketlaunchers", "cityMaps".
 * The `strings` are text variables. 
    * String names must start with a letter, can't contain spaces, and must be less than 100 characters.
    * Example string metadata: "Weapons"="knives+pistols+rifles", "MapName"="UrbanCityAssault", "description"="Fun casual game, new people welcome."

 * The `numbers` are numeric variables. The Xbox Live APIs retrieve number values as type float. 
    * Number names must start with a letter, can't contain spaces, and must be less than 100 characters. 
    * Example number metadata: "MinLevel" = 25, "MaxRank" = 10.

> [!NOTE]
> The letter casing of tags and string values is preserved in the service, but you must use the `tolower()` function when you query for tags. This means that tags and string values are currently all treated as lowercase, even if they contain uppercase characters.

In the Xbox Live APIs, you can set the search attributes, such as tags and metadata, by using the [XblMultiplayerCreateSearchHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayercreatesearchhandleasync.md) method.  
  
### Additional details  
  
When you retrieve a search handle, the results also include useful data about the session, such as if the session is closed, and if there are any join restrictions. 
In the Xbox Live APIs, these details, along with the search attributes, are included in the `XblMultiplayerSearchHandle` results that return after a search query.

### Remove a search handle

When you want to remove a session from multiplayer session browse, 
such as when the session is full or closed, you can delete the search handle. 
In the Xbox Live APIs, remove a search handle by using the [XblMultiplayerDeleteSearchHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerdeletesearchhandleasync.md) method.  

### Create a search handle with metadata

The following code shows how to create a search handle for a session by using the Xbox Live multiplayer APIs.

#### Flat C  
  

```cpp
size_t tagsCount = 1;
XblMultiplayerSessionTag tags[1] = {};
tags[0] = XblMultiplayerSessionTag{ "SessionTag" };

size_t numberAttributesCount = 1;
XblMultiplayerSessionNumberAttribute numberAttributes[1] = {};
numberAttributes[0] = XblMultiplayerSessionNumberAttribute{ "numberattributename", 1.1 };

size_t strAttributesCount = 1;
XblMultiplayerSessionStringAttribute strAttributes[1] = {};
strAttributes[0] = XblMultiplayerSessionStringAttribute{ "stringattributename", "string attribute value" };

auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*
    XblMultiplayerSearchHandle searchHandle{ nullptr };
    HRESULT hr = XblMultiplayerCreateSearchHandleResult(asyncBlock, &searchHandle);

    if (SUCCEEDED(hr))
    {
        const char* handleId{ nullptr };
        XblMultiplayerSearchHandleGetId(searchHandle, &handleId);
    }
};

HRESULT hr = XblMultiplayerCreateSearchHandleAsync(
    xblContextHandle,
    &xblMultiplayerSessionReference,
    tags,
    tagsCount,
    numberAttributes,
    numberAttributesCount,
    strAttributes,
    strAttributesCount,
    asyncBlock.get()
);

if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

For more information about the functions used in the code example, see [multiplayer_c](../../../../reference/live/xsapi-c/multiplayer_c/multiplayer_c_members.md).





## Create a search query for sessions

When retrieving a list of search handles, you can use a search query to restrict the results of the sessions that meet specific criteria.

The search query syntax is an [OData](https://docs.oasis-open.org/odata/odata/v4.0/errata02/os/complete/part2-url-conventions/odata-v4.0-errata02-os-part2-url-conventions-complete.html#_Toc406398092)-style syntax, with only the following operators that are supported.

| Operator | Description |
| --- | --- |
| eq | equals |
| ne | not equal to |
| gt | greater than |
| ge | greater than or equal |
| lt | less than |
| le | less than or equal |
| and | logical AND |
| or | logical OR (see note below) |
  > [!NOTE]
> You can also use lambda expressions and the `tolower` canonical function.
No other OData functions are currently supported.

When searching for tags or string values, you must use the `tolower` function in the search query. 
The service only supports searching for lowercase strings. 
The Xbox Live service only returns the first 100 results that match the search query.
Ensure that users can refine their search query if the results are too broad.
> [!NOTE]
> Logical `OR` statements are supported in filter string queries. 
However, only one `OR` is allowed, and it must be at the root of your query. 
You can't have multiple `OR` statements in your query, nor can you create a 
query that would result in `OR` not being at the top-most level of the query structure.  
  
### Search handle query examples

In a restful call, "Filter" is where you specify an OData Filter language string that's run in your query against all search handles.
In the multiplayer 2015 APIs, you can specify the search filter string by using the `searchFilter` parameter of the [XblMultiplayerGetSearchHandlesAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayergetsearchhandlesasync.md) method.  

The following filter scenarios are currently supported.

| Filter by | Search filter string |
| --- | --- |
| A single member xuid '1234566' | "session/memberXuids/any(d:d eq '1234566')" |
| A single owner xuid '1234566' | "session/ownerXuids/any(d:d eq '1234566')" |
| A string 'forzacarclass' that's equal to 'classb' | "tolower(strings/forzacarclass) eq 'classb'" |
| A number 'forzaskill' that's equal to 6 | "numbers/forzaskill eq 6" |
| A number 'halokdratio' that's greater than 1.5 | "numbers/halokdratio gt 1.5" |
| A tag 'coolpeopleonly' | "tags/any(d:tolower(d) eq 'coolpeopleonly')" |
| Sessions that don't contain the tag 'cursingallowed' | "tags/any(d:tolower(d) ne 'cursingallowed')" |
| Sessions that don't contain a number 'rank' that's equal to 0 | "numbers/rank ne 0" |
| Sessions that don't contain a string 'forzacarclass' that's equal to 'classa' | "tolower(strings/forzacarclass) ne 'classa'" |
| A tag 'coolpeopleonly' and a number 'halokdratio' that's equal to 7.5 | "tags/any(d:tolower(d) eq 'coolpeopleonly') eq true and numbers/halokdratio eq 7.5" |
| A number 'halodkratio' that's greater than or equal to 1.5, a number 'rank' that's less than 60, and a number 'customnumbervalue' that's less than or equal to 5 | "numbers/halokdratio ge 1.5 and numbers/rank lt 60 and numbers/customnumbervalue le 5" |
| An achievement ID '123456' | "achievementIds/any(d:d eq '123456')" |
| The language code 'en' | "language eq 'en'" |
| Scheduled time, returns all scheduled times that are less than or equal to the specified time | "session/scheduledTime le '2009-06-15T13:45:30.0900000Z'" |
| Posted time, returns all posted times that are less than the specified time | "session/postedTime lt '2009-06-15T13:45:30.0900000Z'" |
| Session registration state | "session/registrationState eq 'registered'" |
| Where the number of session members is equal to 5 | "session/membersCount eq 5" |
| Where the session member target count is greater than 1 | "session/targetMembersCount gt 1" |
| Where the max count of session members is less than 3 | "session/maxMembersCount lt 3" |
| Where the difference between the session member target count and the number of session members is less than or equal to 5 | "session/targetMembersCountRemaining le 5" |
| Where the difference between the max count of session members and the number of session members is greater than 2 | "session/maxMembersCountRemaining gt 2" |
| Where the difference between the session member target count and the number of session members is less than or equal to 15.</br> If the role doesn't have a target that's specified, then this query filters against the difference between the max count of session members and the number of session members. | "session/needs le 15" |
| Role "confirmed" of the role type "lfg" where the number of members with that role is equal to 5 | "session/roles/lfg/confirmed/count eq 5" |
| Role "confirmed" of the role type "lfg" where the target of that role is greater than 1.</br> If the role doesn't have a target that's specified, then the max of the role is used instead. | "session/roles/lfg/confirmed/target gt 1" |
| Role "confirmed" of the role type "lfg" where the difference between the target of the role and the number of members with that role is less than or equal to 15.</br> If the role doesn't have a target specified, then this query filters against the difference between the max of the role and the number of members with that role. | "session/roles/lfg/confirmed/needs le 15" |
| All search handles that point to a session that contains a particular keyword | "session/keywords/any(d:tolower(d) eq 'level2')" |
| All search handles that point to a session that belongs to a particular SCID | "session/scid eq '151512315'" |
| All search handles that point to a session that uses a particular template name | "session/templateName eq 'mytemplate1'" |
| All search handles that have the tag 'elite' or have a number 'guns' that's greater than 15 and string 'clan' equal to 'purple' | "tags/any(a:tolower(a) eq 'elite') or number/guns gt 15 and string/clan eq 'purple'" |

### Refreshing search results

Your game should avoid automatically refreshing a list of sessions. Give the user the option to manually refresh the list by using the UI. 
This is helpful if the user refines their search criteria to better filter the results. 
If a user attempts to join a session, but that session is full or closed, then your game should refresh the search results, as well.  
> [!NOTE]
> Too many search refreshes can lead to service throttling. 
Your title should limit the rate at which the query can be refreshed.  
  
To reduce service call volume, search handles include custom session properties that can be used to store and query 
rapidly changing session attributes. These attributes shouldn't be stored in search attributes.


### Query for search handles

The following code shows how to query for search handles.
The API returns a collection of `XblMultiplayerSearchHandle` objects that represent all the search handles that match the query.

#### Flat C  


```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->queue = queue;
asyncBlock->context = nullptr;
asyncBlock->callback = [](XAsyncBlock* asyncBlock)
{
    std::unique_ptr<XAsyncBlock> asyncBlockPtr{ asyncBlock }; // Take over ownership of the XAsyncBlock*
    size_t resultCount{ 0 };
    auto hr = XblMultiplayerGetSearchHandlesResultCount(asyncBlock, &resultCount);
    if (SUCCEEDED(hr) && resultCount > 0)
    {
        auto handles = new XblMultiplayerSearchHandle[resultCount];

        hr = XblMultiplayerGetSearchHandlesResult(asyncBlock, handles, resultCount);

        if (SUCCEEDED(hr))
        {
            // Process handles
            for (auto i = 0u; i < resultCount; ++i)
            {
                const char* handleId{ nullptr };
                XblMultiplayerSearchHandleGetId(handles[i], &handleId);

                XblMultiplayerSearchHandleCloseHandle(handles[i]);
            }
        }
    }

};

const char* sessionName{ "MinGameSession" };
const char* orderByAttribute{ nullptr };
bool orderAscending{ false };
const char* searchFilter{ nullptr };
const char* socialGroup{ nullptr };

HRESULT hr = XblMultiplayerGetSearchHandlesAsync(
    xblContextHandle,
    scid,
    sessionName,
    orderByAttribute,
    orderAscending,
    searchFilter,
    socialGroup,
    asyncBlock.get()
);
if (SUCCEEDED(hr))
{
    // The call succeeded, so release the std::unique_ptr ownership of XAsyncBlock* since the callback will take over ownership.
    // If the call fails, the std::unique_ptr will keep ownership and delete the XAsyncBlock*
    asyncBlock.release();
}
```

For more information about the functions used in the code example, see [multiplayer_c](../../../../reference/live/xsapi-c/multiplayer_c/multiplayer_c_members.md).




## Join a session by using a search handle

After a user has retrieved a search handle for a session that they want to join, 
ensure that they can add themselves to the session by using [XblMultiplayerWriteSessionByHandleAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionbyhandleasync.md).
> [!NOTE]
> The [XblMultiplayerWriteSessionAsync](../../../../reference/live/xsapi-c/multiplayer_c/functions/xblmultiplayerwritesessionasync.md) methods can't be used to join a multiplayer session browse session.