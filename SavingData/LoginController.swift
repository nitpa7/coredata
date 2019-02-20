//
//  ViewController.swift
//  SavingData
//
//  Created by Nitesh  on 20/02/19.
//  Copyright © 2019 Nitesh . All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        return tf
    }()
    
    let passswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        return tf
    }()
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(handleSignIn), for: .touchUpInside)
        return button
    }()
    
    // To check if the email is valid
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    // For creating alerts
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Got It", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func handleSignIn() {
        
        guard let email = emailTextField.text, isValidEmail(testStr: email) else {
            self.createAlert(title: "Invalid email", message: "Please enter a valid email")
            return
        }
        
        guard let password = passswordTextField.text, password.count > 6, password.count < 16 else {
            self.createAlert(title: "Password Invalid", message: "Please enter a password of more than 6 characters")
            return
        }
        
        print("your email is \(email), your password is \(password)")
        
        let tableView = AddPersonController()
        navigationController?.pushViewController(tableView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupInputs()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    fileprivate func setupInputs() {
        let stackViews = UIStackView(arrangedSubviews: [emailTextField, passswordTextField, signInButton])
        stackViews.distribution = .fillEqually
        stackViews.axis = .vertical
        stackViews.spacing = 10
        
        view.addSubview(stackViews)
        stackViews.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 200, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 200)
    }
}

extension UIView {
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,  paddingTop: CGFloat, paddingLeft: CGFloat, paddingBottom: CGFloat, paddingRight: CGFloat, width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            self.topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        
        if let left = left {
            self.leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}


