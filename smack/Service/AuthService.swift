//
//  AuthService.swift
//  smack
//
//  Created by Pedro Paulo on 01/12/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoggedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCasedEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCasedEmail,
            "password": password
        ]
        
        AF.request(REGISTER_URL,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: HEADERS)
            .validate(statusCode: 200..<300)
            .responseData { (response) in
                switch response.result{
                case .failure( _):
                    completion(false)
                    
                case .success( _):
                    completion(true)
                }
            }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler){
        let lowerCasedEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCasedEmail,
            "password": password
        ]
        
        AF.request(LOGIN_URL,
                   method: .post,
                   parameters: body,
                   encoding: JSONEncoding.default,
                   headers: HEADERS)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                switch response.result{
                case .failure( _):
                    completion(false)
                    
                case let .success(values):
                    
                    let data = JSON(values)
                    self.userEmail = data["user"].stringValue
                    self.authToken = data["token"].stringValue
                    
                    self.isLoggedIn = true
                    completion(true)
                }
            }
    }
        
}
