sig User {
    owns: set Content, // can have multiple content
    friends: set User, // can have multiple friend
    has: one Wall //
}

abstract sig Content {
    owner: one User,
    comments: set Comment // can have multiple comments
}

sig Photo extends Content {}
sig Comment extends Content {
    parent: lone Content
}

sig Wall {}

fact wallBelongToOneUserOnly {
    all u1,u2:User | u1.has = u2.has => u1 = u2
}

fact numWallEqualNumUser {
    #User = #Wall
}

// Friendship is symmetric
// it creates a biimplication to each friend-relation for user
fact symmetricFriendship {
    all u, v: User | u in v.friends iff v in u.friends 
}

// A user cannot be their own friend
fact noSelfFriendship {
    no u: User | u in u.friends
}

// Users own the content in their walls
fact wallOwnership {
}

// A user can only comment on a piece of content that they own or is visible on another user's wall
fact commentPermission {
}

run {} for 3 but 6 User, 0 Comment, 0 Photo
//run {} for 6 but 6 User, 0 Comment, 0 Photo
