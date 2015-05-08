//
//  Models.swift
//  MvvmDemo
//
//  Created by Will Johansson on 2015-05-08.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

class LoginUser {
    var email: String = ""
    var password: String = ""
}

enum LoginMode {
    case Login
    case SignUp
}