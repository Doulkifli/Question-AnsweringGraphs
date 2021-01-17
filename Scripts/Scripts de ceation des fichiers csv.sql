//------------------------ Users
SELECT   `users`.`Id`,
         `users`.`DisplayName`
FROM     `users`

//------------------------------User `Comment` User  (UserId `Comment` OwnerUserId)
SELECT   `comments`.`UserId`,
         `posts`.`OwnerUserId`, COUNT(*)
FROM     `posts` 
INNER JOIN `comments`  ON `posts`.`Id` = `comments`.`PostId` 
GROUP BY `comments`.`UserId`,
         `posts`.`OwnerUserId`


//------------------------------------------------------------------------------User Answer User (T answer posts)
SELECT   `posts`.`OwnerUserId`,
         `T`.`OwnerUserId`, COUNT(*)
FROM     `posts` 
INNER JOIN `posts` `T` ON `posts`.`Id` = `T`.`ParentId` 
WHERE    ( `T`.`PostTypeId` = 2 )
GROUP BY `posts`.`OwnerUserId`,
         `T`.`OwnerUserId`

//-----------------------------------------------------------------------User UpVotes User (UserId UpVotes OwnerUserId)
SELECT   `votes`.`UserId`,
         `posts`.`OwnerUserId`, COUNT(*)
FROM     `votes` 
INNER JOIN `posts`  ON `votes`.`PostId` = `posts`.`Id` 
WHERE    ( `votes`.`VoteTypeId` = 2 )
GROUP BY `votes`.`UserId`,
         `posts`.`OwnerUserId`

//--------------------------------------------------------------------User DownVotes User (UserId DownVotes OwnerUserId)
SELECT   `votes`.`UserId`,
         `posts`.`OwnerUserId`, COUNT(*)
FROM     `votes` 
INNER JOIN `posts`  ON `votes`.`PostId` = `posts`.`Id` 
WHERE    ( `votes`.`VoteTypeId` = 3 )
GROUP BY `votes`.`UserId`,
         `posts`.`OwnerUserId`


//--------------------------------------------------------------User FavoriteVotes User (UserId FavoriteVotes OwnerUserId)
SELECT   `votes`.`UserId`,
         `posts`.`OwnerUserId`, COUNT(*)
FROM     `votes` 
INNER JOIN `posts`  ON `votes`.`PostId` = `posts`.`Id` 
WHERE    ( `votes`.`VoteTypeId` = 5 )
GROUP BY `votes`.`UserId`,
         `posts`.`OwnerUserId`
//-------------------------------------------------------------User  User (UserId FavoriteVotes OwnerUserId)
SELECT   `posts`.`OwnerUserId`,
         `T`.`OwnerUserId`,
          COUNT(*)
FROM     `postlinks` 
INNER JOIN `posts`  ON `postlinks`.`PostId` = `posts`.`Id` 
INNER JOIN `posts` `T` ON `postlinks`.`RelatedPostId` = `T`.`Id` 
WHERE    ( `posts`.`OwnerUserId` <> `T`.`OwnerUserId` )
GROUP BY `T`.`OwnerUserId`,
         `posts`.`OwnerUserId`

//--------------------------------------------------------------------------------------------- Tags
SELECT   `tags`.`Id`,
         `tags`.`TagName`
FROM     `tags`

//-------------------------------------------------------------Tags LieeA Tags (`posttags`.`TagId` LieeA `T`.`TagId`)
SELECT   `posttags`.`TagId`,
         `T`.`TagId`, COUNT(*) 
FROM     `posttags` 
INNER JOIN `posttags` `T` ON `posttags`.`PostId` = `T`.`PostId` 
WHERE    ( `posttags`.`TagId` <> `T`.`TagId` )
GROUP BY `posttags`.`TagId`,
         `T`.`TagId`