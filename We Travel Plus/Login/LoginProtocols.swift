//
//  LoginProtocols.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 14/05/25.
//

import Foundation

protocol LoginPresentationLogic: AnyObject {
    func presentLoginSuccess(response: Login.Response.Success)
    func presentLoginFailure(response: Login.Response.Failure)
}

protocol LoginDisplayLogic: AnyObject {
    func displaySuccess(viewModel: Login.ViewModel.DisplaySuccess)
    func displayError(viewModel: Login.ViewModel.DisplayError)
}

protocol LoginBusinessLogic {
    func loginWithEmail(request: Login.Request.EmailAndPassword)
    func loginWithGoogle(request: Login.Request.GoogleSignIn)
}

protocol LoginRoutingLogic {
    func navigateToHome()
}
