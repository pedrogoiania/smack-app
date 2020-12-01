//
//  constants.swift
//  smack
//
//  Created by Pedro Paulo on 30/11/20.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// URLs

let BASE_URL = "http://localhost:3005/v1"
let REGISTER_URL = "\(BASE_URL)/account/register"

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwind"

// User defaults
let LOGGED_IN_KEY = "loggerIn"
let USER_EMAIL = "userEmail"
let TOKEN_KEY = "token"
