//
//  LoginRouter.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 05/05/25.
//

//Navigation routes to change between screens
import UIKit

final class LoginRouter: LoginRoutingLogic {
    
    weak var viewController: UIViewController?
    
    func navigateToHome() {
        let homeVC = HomeViewController()
        viewController?.navigationController?.pushViewController(homeVC, animated: true)
    }
}
