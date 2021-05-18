//
//  FireBase.swift
//  VK_Belov
//
//  Created by Алексей Белов on 17.05.2021.
//

import Foundation
import Firebase

class FirebaseUser {
    // 1
    let name: String
    let id: String
    let ref: DatabaseReference?
    
    init(name: String, id: String) {
        // 2
        self.ref = nil
        self.name = name
        self.id = id
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
            let id = value["id"] as? String,
            let name = value["name"] as? String else {
                return nil
        }
        
        self.ref = snapshot.ref
        self.name = name
        self.id = id
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
            "name": name,
            "id": id
        ]
    }
}

class FirebaseGropueUser {
    // 1
//    let name: String
//    let id: String
    let groupeId: Int
    let ref: DatabaseReference?
    
    init(name: String, id: String, groupeId: Int) {
        // 2
        self.ref = nil
//        self.name = name
//        self.id = id
        self.groupeId = groupeId
    }
    
    init?(snapshot: DataSnapshot) {
        // 3
        guard
            let value = snapshot.value as? [String: Any],
//            let id = value["id"] as? String,
//            let name = value["name"] as? String,
            let groupeId = value["groupeId"] as? Int
            else {
                return nil
        }
        
        self.ref = snapshot.ref
//        self.name = name
//        self.id = id
        self.groupeId = groupeId
    }
    
    func toAnyObject() -> [String: Any] {
        // 4
        return [
//            "name": name,
//            "id": id,
            "groupeId"+String(groupeId): groupeId
        ]
    }
}



class SaveDataInBase{
    
    private let refFireBaseUser = Database.database().reference(withPath: "userVK")
    private let refFireBaseGroupe = Database.database().reference(withPath: "groupe")

    func saveInBaseUser(){
        let nameUser  = "user vk " + UserSession.shared.userID
//        let userForFireBase = FirebaseUser(name: nameUser, id: UserSession.shared.userID)
        let userRef = refFireBaseUser.child(nameUser.lowercased())
        
        userRef.child("user_id").setValue(UserSession.shared.userID)
        
        //userRef?.setValue(userForFireBase.toAnyObject())
    }
    
    func saveInBaseGroupe(groupeId: Int){
        let nameUser  = "user vk " + UserSession.shared.userID
//        let userForFireBase = FirebaseGropueUser(name: nameUser, id: UserSession.shared.userID, groupeId: groupeId)
        let userRef = refFireBaseGroupe.child(nameUser.lowercased())
        
        userRef.child("groupeId"+String(groupeId)).setValue(groupeId)
        
        //userRef.setValue(userForFireBase.toAnyObject())
    }
    
}
