//
//  AuthService.swift
//  smack
//
//  Created by Pedro Paulo on 01/12/20.
//

import Foundation
import Alamofire

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
        
        let headers: HTTPHeaders = [
            HTTPHeader(name:"content-type" , value: "application/json; utf-8")
        ]
        
        let body: [String: Any] = [
            "email": lowerCasedEmail,
            "password": password
        ]
        
        AF.request(REGISTER_URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseString { response in
            
            debugPrint(response)
            
            _ = response.result.flatMapError { (AFError) -> Result<String, Error> in debugPrint(String)
                
            }
            
        }
    }
    
    
}
