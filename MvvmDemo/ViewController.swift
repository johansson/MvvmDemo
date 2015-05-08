//
//  ViewController.swift
//  MvvmDemo
//
//  Created by Will Johansson on 2015-05-07.
//  Copyright (c) 2015 Will Johansson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    var viewModel: LoginViewModelProtocol = LoginViewModel(user: LoginUser()) {
        didSet {
            refresh()
        }
    }
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var switchButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // With ReactiveCocoa the following actions and enabled stuff
    // would be done slightly differently.
    @IBAction func emailChanged(sender: AnyObject) {
        viewModel.user.email = emailField.text
        loginButton.enabled = viewModel.command.canExecute
    }
    
    @IBAction func passwordChanged(sender: AnyObject) {
        viewModel.user.password = passwordField.text
        loginButton.enabled = viewModel.command.canExecute
    }
    
    @IBAction func onLoginTapped(sender: AnyObject) {
        viewModel.command.execute()
    }
    
    @IBAction func switchViewModels(sender: AnyObject) {
        switch(viewModel.mode) {
        case .Login:
            viewModel = SignupViewModel(user: viewModel.user)
        case .SignUp:
            viewModel = LoginViewModel(user: viewModel.user)
        }
    }
    
    func refresh() {
        loginButton?.setTitle(viewModel.command.title, forState: .Normal)
        switchButton?.setTitle(viewModel.opposite, forState: .Normal)
        passwordField?.hidden = viewModel.mode == .SignUp
        passwordLabel?.hidden = viewModel.mode == .SignUp
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refresh()
        
        emailField.text = viewModel.user.email
        passwordField.text = viewModel.user.password
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

