//
//  UserDataService.swift
//  smack
//
//  Created by Pedro Paulo on 09/12/20.
//

import Foundation


class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var name = ""
    public private(set) var email = ""
    
    func setUserData(
        id: String,
        avatarColor: String,
        avatarName: String,
        name: String,
        email: String
    ){
        self.id = id
        self.avatarColor = avatarColor
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
}
