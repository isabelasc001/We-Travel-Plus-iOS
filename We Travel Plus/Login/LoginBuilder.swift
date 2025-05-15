//
//  LoginBuilder.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 08/05/25.
//

import UIKit
enum LoginBuilder {
    static func build() -> UIViewController {
        let presenter = LoginPresenter()
        let interactor = LoginInteractor(presenter: presenter)
        let router = LoginRouter()
        
        let viewController = LoginViewController(interactor: interactor, router: router)
        presenter.viewController = viewController
        router.viewController = viewController
        viewController.router = router
      
        return UINavigationController(rootViewController: viewController)
    }
}

