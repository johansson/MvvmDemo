//
//  LoginViewModel.swift
//  MvvmDemo
//
//  Created by Will Johansson on 2015-05-07.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

protocol ViewModelProtocol {
    var command: CommandProtocol { get }
}

protocol LoginViewModelProtocol: ViewModelProtocol {
    var user: LoginUser { get }
    var mode: LoginMode { get }
    var opposite: String { get }
}

class SignupViewModel: LoginViewModelProtocol {
    let user: LoginUser
    let mode = LoginMode.SignUp
    let opposite = "Have an account?"
    let command: CommandProtocol
    
    init(user: LoginUser) {
        self.user = user
        self.command = SignupCommand(user: user)
    }
}

class LoginViewModel: LoginViewModelProtocol {
    let user: LoginUser
    let mode = LoginMode.Login
    let opposite = "Don't have an account?" 
    let command: CommandProtocol
    
    init(user: LoginUser) {
        self.user = user
        self.command = LoginCommand(user: user)
    }
}
