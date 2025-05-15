//
//  LoginModel.swift
//  We Travel Plus
//
//  Created by Isabela da Silva Cardoso on 02/05/25.
//

//Contains data Structs to represent data and responses from scene
import Foundation

enum Login {
    
    enum Request {
        struct EmailAndPassword {
            let email: String
            let password: String
        }
        
        struct GoogleSignIn {
            let idToken: String
            let accessToken: String
        }
    }
    
    enum Response {
        struct Success {
            let displayName: String
            let email: String
            let uid: String
        }

        struct Failure {
            let errorMessage: String
        }
    }
    
    enum ViewModel {
        struct DisplaySuccess {
            let welcomeMessage: String
        }

        struct DisplayError {
            let message: String
        }
    }
}


