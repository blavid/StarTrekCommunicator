//
//  LoginController.swift
//  Star Trek Communicator
//
//  Created by Blake Clough on 4/8/17.
//  Copyright © 2017 Blake Clough. All rights reserved.
//

import UIKit
import Firebase

class LoginController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor(r: 61, g: 91, b: 151)
        setupViews()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupViews() {
        view.addSubview(loginInputsContainerView)
        setupLoginInputsContainerView()
        
        view.addSubview(loginRegisterButton)
        setupLoginRegisterButton()
        
        view.addSubview(loginRegisterSegmentedControl)
        setupLoginRegisterSegmentedControl()
        
        loginInputsContainerView.addSubview(nameTextField)
        loginInputsContainerView.addSubview(inputDividerViews.top)
        loginInputsContainerView.addSubview(emailTextField)
        loginInputsContainerView.addSubview(inputDividerViews.bottom)
        loginInputsContainerView.addSubview(passwordTextField)
        setupInputTextFields()
        setupInputDividerViews()
        
        view.addSubview(profileImageView)
        setupProfileImageView()
    }
    
    // MARK: - Subviews
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "starTrekComm.png")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    func setupProfileImageView() {
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: loginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    let loginRegisterSegmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Login", "Register"])
        control.selectedSegmentIndex = 1
        control.backgroundColor = AppColor.dark
        control.tintColor = AppColor.light
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(handleLoginRegisterToggle), for: .valueChanged)
        return control
    }()
    
    func handleLoginRegisterToggle() {
        let index = loginRegisterSegmentedControl.selectedSegmentIndex
        loginRegisterButton.setTitle(loginRegisterSegmentedControl.titleForSegment(at: index), for: .normal)
        
        // Change height of loginInputsContainerView
        loginInputsContainerViewHeightConstraint?.constant = index == 0 ? 100 : 150
        
        // Change height of nameTextField
        nameTextFieldHeightAnchor?.isActive = false
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: index == 0 ? 0 : 1/3)
        nameTextField.isHidden = index == 0
        inputDividerViews.top.isHidden = index == 0
        nameTextFieldHeightAnchor?.isActive = true
        
        
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: index == 0 ? 1/2 : 1/3)
        emailTextFieldHeightAnchor?.isActive = true

        
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: index == 0 ? 1/2 : 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
}
    
    func setupLoginRegisterSegmentedControl() {
        loginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: loginInputsContainerView.topAnchor, constant: -12).isActive = true
        loginRegisterSegmentedControl.widthAnchor.constraint(equalTo: loginInputsContainerView.widthAnchor, multiplier: 0.5).isActive = true
        loginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    let loginInputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.light
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    var loginInputsContainerViewHeightConstraint: NSLayoutConstraint?
    
    func setupLoginInputsContainerView() {
        loginInputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginInputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginInputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        loginInputsContainerViewHeightConstraint = loginInputsContainerView.heightAnchor.constraint(equalToConstant: 150)
        loginInputsContainerViewHeightConstraint?.isActive = true
    }
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Name"
        textField.textColor = AppColor.darkest
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = AppColor.darkest
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = AppColor.darkest
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        return textField
    }()
    
    var nameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupInputTextFields() {
        nameTextField.leftAnchor.constraint(equalTo: loginInputsContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: loginInputsContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: loginInputsContainerView.widthAnchor).isActive = true
        nameTextFieldHeightAnchor = nameTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: 1/3)
        nameTextFieldHeightAnchor?.isActive = true
        
        emailTextField.leftAnchor.constraint(equalTo: loginInputsContainerView.leftAnchor, constant: 12).isActive = true
        emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = emailTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: 1/3)
        emailTextFieldHeightAnchor?.isActive = true

        
        passwordTextField.leftAnchor.constraint(equalTo: loginInputsContainerView.leftAnchor, constant: 12).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = passwordTextField.heightAnchor.constraint(equalTo: loginInputsContainerView.heightAnchor, multiplier: 1/3)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    let inputDividerViews: (top: UIView, bottom: UIView) = {
        let topView = UIView()
        topView.backgroundColor = AppColor.darkest
        topView.translatesAutoresizingMaskIntoConstraints = false
        let bottomView = UIView()
        bottomView.backgroundColor = AppColor.darkest
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        return (topView, bottomView)
    }()
    
    func setupInputDividerViews() {
        inputDividerViews.top.widthAnchor.constraint(equalTo: loginInputsContainerView.widthAnchor).isActive = true
        inputDividerViews.top.heightAnchor.constraint(equalToConstant: 1).isActive = true
        inputDividerViews.top.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        inputDividerViews.top.leftAnchor.constraint(equalTo: loginInputsContainerView.leftAnchor).isActive = true
        
        inputDividerViews.bottom.widthAnchor.constraint(equalTo: loginInputsContainerView.widthAnchor).isActive = true
        inputDividerViews.bottom.heightAnchor.constraint(equalToConstant: 1).isActive = true
        inputDividerViews.bottom.topAnchor.constraint(equalTo: emailTextField.bottomAnchor).isActive = true
        inputDividerViews.bottom.leftAnchor.constraint(equalTo: loginInputsContainerView.leftAnchor).isActive = true
    }
    
    let loginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = AppColor.dark
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    func setupLoginRegisterButton() {
        loginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginRegisterButton.topAnchor.constraint(equalTo: loginInputsContainerView.bottomAnchor, constant: 12).isActive = true
        loginRegisterButton.heightAnchor.constraint(equalToConstant: 50)
        loginRegisterButton.widthAnchor.constraint(equalTo: loginInputsContainerView.widthAnchor).isActive = true
    }
    
    func handleLoginRegister() {
        if loginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            handleLogin()
        } else {
            handleRegister()
        }
    }
    
    func handleLogin() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            print("incomplete data in form")
            return
        }
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func handleRegister() {
        guard let email = emailTextField.text, let password = passwordTextField.text, let name = nameTextField.text else {
            print("Data in form is invalid.")
            return
        }
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print(error!)
                return
            }
            
            // User is authenticated, so save the user details in the Firebase database
            guard let userId = user?.uid else {
                return
            }
            let ref = FIRDatabase.database().reference(fromURL: kFirebaseUrl)
            let usersRef = ref.child("Users").child(userId)
            usersRef.updateChildValues(["name": name, "email": email], withCompletionBlock: { (err, ref) in
                if err != nil {
                    print("Unable to save user to Firebase database")
                    print(err!)
                    return
                }
                self.dismiss(animated: true, completion: nil)
                print("Successfully saved user to Firebase database")
            })
        })
    }
}
