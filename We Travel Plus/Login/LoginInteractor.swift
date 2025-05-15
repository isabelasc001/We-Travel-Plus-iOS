//
//  LoginInteractor.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 29/04/25.

import Foundation
import FirebaseAuth
import FirebaseFirestore
import GoogleSignIn

final class LoginInteractor: LoginBusinessLogic {
    
    var presenter: LoginPresentationLogic?
    let db = Firestore.firestore()
    
    init(presenter: LoginPresentationLogic) {
            self.presenter = presenter
        }
    
    func loginWithEmail(request: Login.Request.EmailAndPassword) {
        Auth.auth().signIn(withEmail: request.email, password: request.password) { [weak self] result, error in
            if let error = error {
                self?.presenter?.presentLoginFailure(response: .init(errorMessage: error.localizedDescription))
                return
            }
            
            guard let user = result?.user else { return }
            
            let response = Login.Response.Success(displayName: user.displayName ?? "Usuário", email: user.email ?? "Sem email", uid: user.uid)
            self?.presenter?.presentLoginSuccess(response: response)
        }
    }
    
    func loginWithGoogle(request: Login.Request.GoogleSignIn) {
        let credential = GoogleAuthProvider.credential(withIDToken: request.idToken, accessToken: request.accessToken)
        
        Auth.auth().signIn(with: credential) { [weak self] result, error in
            if let error = error {
                self?.presenter?.presentLoginFailure(response: .init(errorMessage: error.localizedDescription))
                return
            }
            
            guard let user = result?.user else { return }
            
            let data: [String: Any] = [
                "displayName":user.displayName ?? "no name",
                "email": user.email ?? "no mail",
                "uid": user.uid
            ]
            
            self?.db.collection("users").document(user.uid).setData(data, merge: true)
            self?.presenter?.presentLoginSuccess(response: .init(displayName: user.displayName ?? "Usuário", email: user.email ?? "", uid: user.uid))
        }
    }
}

