//
//  LoginPresenter.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 29/04/25.
//

import UIKit

class LoginPresenter: LoginPresentationLogic {
    
    weak var viewController: LoginDisplayLogic?
    
    func presentLoginSuccess(response: Login.Response.Success) {
        let viewModel = Login.ViewModel.DisplaySuccess(welcomeMessage: "Bem vindo(a), \(response.displayName)")
        viewController?.displaySuccess(viewModel: viewModel)
    }
    
    func presentLoginFailure(response: Login.Response.Failure) {
        let viewModel = Login.ViewModel.DisplayError(message: response.errorMessage)
        viewController?.displayError(viewModel: viewModel)
    }
}
