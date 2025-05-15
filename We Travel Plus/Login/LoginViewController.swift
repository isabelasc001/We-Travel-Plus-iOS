//
//  LoginViewController.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 28/03/25.
//

//Shows the screen and sends the interactions form the user to the interactor
import UIKit
import GoogleSignIn

class LoginViewController: UIViewController, LoginDisplayLogic {
    
    var interactor: LoginBusinessLogic?
    var router: LoginRoutingLogic?
    
    init(interactor: LoginBusinessLogic, router: LoginRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        setupLayout()
    }
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    } ()
    
    private let userNotRegistered: UIAlertController = {
        let alert = UIAlertController()
        alert.title = "Erro"
        alert.message = "Usuário não cadastrado"
        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
        alert.addAction(UIAlertAction(title: "Criar conta", style: .default))
        return alert
    } ()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite seu e-mail"
        textField.borderStyle = .roundedRect
        return textField
    } ()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite sua senha"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    } ()

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login com email e senha", for: .normal)
        button.addTarget(LoginViewController.self, action: #selector(handleEmailLogin), for: .touchUpInside)
        return button
    } ()
    
    private let googleSignInButton = GIDSignInButton()
    
    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [logoImageView, emailTextField, passwordTextField, loginButton, googleSignInButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func displaySuccess(viewModel: Login.ViewModel.DisplaySuccess) {
        router?.navigateToHome()
    }
    
    func displayError(viewModel: Login.ViewModel.DisplayError) {
        let alert = UIAlertController(title: "Erro", message: viewModel.message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Fechar", style: .cancel))
        present(alert, animated: true)
    }
    
    @objc private func handleEmailLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else
        { return }
        interactor?.loginWithEmail(request: .init(email: email, password: password))
    }
}


