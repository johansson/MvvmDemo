//
//  MvvmDemoTests.swift
//  MvvmDemoTests
//
//  Created by Will Johansson on 2015-05-07.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

import UIKit
import XCTest
import MvvmDemo

class SignupCommandTest: XCTestCase {
    var user = LoginUser()
    
    override func setUp() {
        super.setUp()
        user = LoginUser()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testInvalidEmail() {
        user.email = "foo@bar.com"
        let command: CommandProtocol = SignupCommand(user: user)
        XCTAssertFalse(command.canExecute, "Invalid email was marked as valid \(user.email)")
    }
    
    func testValidEmail() {
        user.email = "will@rd.io"
        let command: CommandProtocol = SignupCommand(user: user)
        XCTAssertTrue(command.canExecute, "Valid email was marked as invalid \(user.email)")
    }
    
    func testTitle() {
        let command: CommandProtocol = SignupCommand(user: user)
        XCTAssertEqual("Sign up", command.title, "wrong title!")
    }
    
}

class LoginCommandTest: XCTestCase {
    func testTitle() {
        let user = LoginUser()
        let command: CommandProtocol = LoginCommand(user: user)
        XCTAssertEqual("Login", command.title, "wrong title!")
    }
    
    func testInvalidEmailAndNoPassword() {
        let user = LoginUser()
        user.email = "blah@foo.com"
        let command: CommandProtocol = LoginCommand(user: user)
        XCTAssertFalse(command.canExecute, "canExecute incorrectly true")
    }
    
    func testInvalidEmailAndSomePassword() {
        let user = LoginUser()
        user.email = "blah@foo.com"
        user.password = "invalid"
        let command: CommandProtocol = LoginCommand(user: user)
        XCTAssertFalse(command.canExecute, "canExecute incorrectly true")
    }
    
    func testValidEmailAndNoPassword() {
        let user = LoginUser()
        user.email = "will@rd.io"
        let command: CommandProtocol = LoginCommand(user: user)
        XCTAssertFalse(command.canExecute, "canExecute incorrectly true")
    }
    
    func testValidEmailAndSomePassword() {
        let user = LoginUser()
        user.email = "will@rd.io"
        user.password = "foobar"
        let command: CommandProtocol = LoginCommand(user: user)
        XCTAssertTrue(command.canExecute, "canExecute incorrectly false")
    }
}

class LoginViewModelTest: XCTestCase {
    func testLoginMode() {
        let user = LoginUser()
        let viewModel : LoginViewModelProtocol = LoginViewModel(user: user)
        XCTAssertEqual(LoginMode.Login, viewModel.mode, "mode incorrectly not set to .Login")
    }
    
    func testOpposite() {
        let user = LoginUser()
        let viewModel : LoginViewModelProtocol = LoginViewModel(user: user)
        XCTAssertEqual("Don't have an account?", viewModel.opposite, "wrong opposite")
    }
    
    // do we need this since we have a separate test for commands?
    func testCommand() {
        let user = LoginUser()
        let command: CommandProtocol = LoginCommand(user: user)
        let viewModel : LoginViewModelProtocol = LoginViewModel(user: user)
        XCTAssert(command.title == viewModel.command.title, "command title not equal")
        XCTAssert(command.canExecute == viewModel.command.canExecute, "command canExecute not equal")
    }
}

class SignupViewModelTest: XCTestCase {
    func testLoginMode() {
        let user = LoginUser()
        let viewModel : LoginViewModelProtocol = SignupViewModel(user: user)
        XCTAssertEqual(LoginMode.SignUp, viewModel.mode, "mode incorrectly not set to .SignUp")
    }
    
    func testOpposite() {
        let user = LoginUser()
        let viewModel : LoginViewModelProtocol = SignupViewModel(user: user)
        XCTAssertEqual("Have an account?", viewModel.opposite, "wrong opposite")
    }
}