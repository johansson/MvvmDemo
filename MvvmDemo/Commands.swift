//
//  Commands.swift
//  MvvmDemo
//
//  Created by Will Johansson on 2015-05-08.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

protocol CommandProtocol {
    var title: String { get }
    var canExecute : Bool { get }
    func execute() -> Void
}

class SignupCommand: CommandProtocol {
    let title = "Sign up"
    let user : LoginUser
    
    init(user: LoginUser) {
        self.user = user
    }
    
    func isValidEmail(email: String) -> Bool {
        return email == "will@rd.io"
    }
    
    var canExecute : Bool {
        get {
            return isValidEmail(user.email)
        }
    }
    
    func execute() {
        println("attempting to sign up \(user.email)")
    }
}

class LoginCommand: CommandProtocol {
    let title = "Login"
    
    let user : LoginUser
    init(user: LoginUser) {
        self.user = user
    }
    
    func isValidEmail(email: String) -> Bool {
        return email == "will@rd.io"
    }
    
    var canExecute : Bool {
        get {
            return isValidEmail(user.email) && !user.password.isEmpty
        }
    }
    
    func execute() {
        if user.email == "will@rd.io" && user.password == "f00b@r" {
            println("logged in!")
        } else {
            println("wrong email or password")
        }
    }
}