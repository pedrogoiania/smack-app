//
//  constants.swift
//  smack
//
//  Created by Pedro Paulo on 30/11/20.
//

import Foundation
import Alamofire

typealias CompletionHandler = (_ Success: Bool) -> ()

// URLs

let BASE_URL = "http://localhost:3005/v1"
let REGISTER_URL = "\(BASE_URL)/account/register"
let LOGIN_URL = "\(BASE_URL)/account/login"

let HEADERS: HTTPHeaders = [
    HTTPHeader(name:"Content-Type" , value: "application/json")
]

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwind"

// User defaults
let LOGGED_IN_KEY = "loggerIn"
let USER_EMAIL = "userEmail"
let TOKEN_KEY = "token"
