//
//  User.swift
//  TweetProject
//
//  Created by adam janusewski on 7/20/22.
//

import FirebaseFirestoreSwift
import Firebase

struct User: Identifiable, Decodable {
    @DocumentID var id: String?  // Changes the given id of Firebase to the id of the object
    let username: String
    let fullname: String
    let profileImageUrl: String
    let email: String
    
    
    // if the current logged in users id = the id on the object we know this is the current user
    var isCurrentUser: Bool { return Auth.auth().currentUser?.uid == id }
}
