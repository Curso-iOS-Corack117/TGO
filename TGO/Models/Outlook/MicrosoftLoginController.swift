//
//  MicrosoftLoginController.swift
//  MIRO
//
//  Created by Sergio Ordaz Romero on 01/02/23.
//

import SwiftUI

class MicrosoftLoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.signIn()
    }
    
    private func signIn() {
        AuthenticationManager.shared.getTokenInteractively(parentView: self) {
            (token: String?, error: Error?) in
            
            DispatchQueue.main.async {
                
                guard let _ = token, error == nil else {
                    // Show the error and stay on the sign-in page
                    let alert = UIAlertController(title: "Error signing in",
                                                  message: error.debugDescription,
                                                  preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    return
                }
            }
        }
    }
}

struct MicrosoftLoginView: UIViewControllerRepresentable {
    typealias UIViewControllerType = MicrosoftLoginController
    
    func makeUIViewController(context: Context) -> MicrosoftLoginController {
        return MicrosoftLoginController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
