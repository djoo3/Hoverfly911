//
//  LoginController.swift
//  HoverflyBeta
//
//  Created by Aaron Slusser on 3/15/18.
//  Copyright © 2018 Aaron Slusser. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    let InputsContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.cornerRadius = 5
        view.layer.masksToBounds = true
        return view
    }()
    
    let LoginRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        button.setTitle("Register", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(handleLoginRegister), for: .touchUpInside)
        return button
    }()
    
    let FirstnameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "First Name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()

    let NameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let LastnameTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Last Name"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let LastNameSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let EmailTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Email"
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    let EmailSeperatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let PasswordTextField: UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.translatesAutoresizingMaskIntoConstraints = false
        field.isSecureTextEntry = true
        return field
    }()
    
    let LoginImageView: UIImageView = {
        let ImageView = UIImageView()
        ImageView.image = UIImage(named: "HovFlyLogoFinal")
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        ImageView.contentMode = .scaleAspectFill
        return ImageView
    }()
    
    lazy var LoginRegisterSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Login", "Register"])
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.tintColor = UIColor.white
        sc.selectedSegmentIndex = 1
        sc.addTarget(self, action: #selector(handleLoginRegisterChange), for: .valueChanged)
        return sc
    }()
    
    @objc func handleLoginRegisterChange() {
        let title = LoginRegisterSegmentedControl.titleForSegment(at: LoginRegisterSegmentedControl.selectedSegmentIndex)
        LoginRegisterButton.setTitle(title, for: .normal)
        
        // change height of inputcontainerview
        inputsContainerViewHeightAnchor?.constant = LoginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 100 : 200
        
        //change height of FirstnameTextField
        firstnameTextFieldHeightAnchor?.isActive = false
        firstnameTextFieldHeightAnchor = FirstnameTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: LoginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/4)
        firstnameTextFieldHeightAnchor?.isActive = true
        
        //change height of LastNameTextfield
        lastnameTextFieldHeightAnchor?.isActive = false
        lastnameTextFieldHeightAnchor = LastnameTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: LoginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 0 : 1/4)
        lastnameTextFieldHeightAnchor?.isActive = true
        
        //change height of emailTextfield
        emailTextFieldHeightAnchor?.isActive = false
        emailTextFieldHeightAnchor = EmailTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: LoginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        //change height of passwordTextField
        passwordTextFieldHeightAnchor?.isActive = false
        passwordTextFieldHeightAnchor = PasswordTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: LoginRegisterSegmentedControl.selectedSegmentIndex == 0 ? 1/2 : 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
        
        FirstnameTextField.delegate = self
        LastnameTextField.delegate = self
        PasswordTextField.delegate = self
        EmailTextField.delegate = self
    
        view.addSubview(InputsContainerView)
        view.addSubview(LoginRegisterButton)
        view.addSubview(LoginImageView)
        view.addSubview(LoginRegisterSegmentedControl)
        
        setupInputsContainerView()
        setupLoginRegisterButton()
        setupLoginImageView()
        setupLoinRegisterSegmentedControl()
    }
    
    func setupLoinRegisterSegmentedControl() {
        //add constraints
        //need x,y,width,height
        LoginRegisterSegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LoginRegisterSegmentedControl.bottomAnchor.constraint(equalTo: InputsContainerView.topAnchor, constant: -12).isActive = true
        LoginRegisterSegmentedControl.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor, multiplier: 1).isActive = true
        LoginRegisterSegmentedControl.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupLoginImageView(){
        //add constraints
        //need x,y,width,height
        LoginImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LoginImageView.bottomAnchor.constraint(equalTo: LoginRegisterSegmentedControl.topAnchor, constant: -12).isActive = true
        LoginImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        LoginImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    var inputsContainerViewHeightAnchor: NSLayoutConstraint?
    var firstnameTextFieldHeightAnchor: NSLayoutConstraint?
    var lastnameTextFieldHeightAnchor: NSLayoutConstraint?
    var emailTextFieldHeightAnchor: NSLayoutConstraint?
    var passwordTextFieldHeightAnchor: NSLayoutConstraint?
    
    func setupInputsContainerView(){
        //add constraints
        //need x,y,width,height
        InputsContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        InputsContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        InputsContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputsContainerViewHeightAnchor = InputsContainerView.heightAnchor.constraint(equalToConstant: 200)
        inputsContainerViewHeightAnchor?.isActive = true
        
        InputsContainerView.addSubview(FirstnameTextField)
        InputsContainerView.addSubview(NameSeperatorView)
        InputsContainerView.addSubview(LastnameTextField)
        InputsContainerView.addSubview(LastNameSeperatorView)
        InputsContainerView.addSubview(EmailTextField)
        InputsContainerView.addSubview(EmailSeperatorView)
        InputsContainerView.addSubview(PasswordTextField)
        
        //add constraints
        //need x,y,width,height
        
        FirstnameTextField.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor, constant: 12).isActive = true
        FirstnameTextField.topAnchor.constraint(equalTo: InputsContainerView.topAnchor).isActive = true
        FirstnameTextField.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        firstnameTextFieldHeightAnchor = FirstnameTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: 1/4)
        firstnameTextFieldHeightAnchor?.isActive = true
        
        //add constraints
        //need x,y,width,height
        
        NameSeperatorView.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor).isActive = true
        NameSeperatorView.topAnchor.constraint(equalTo: FirstnameTextField.bottomAnchor).isActive = true
        NameSeperatorView.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        NameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //add constraints
        //need x,y,width,height
        
        LastnameTextField.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor, constant: 12).isActive = true
        LastnameTextField.topAnchor.constraint(equalTo: FirstnameTextField.bottomAnchor).isActive = true
        LastnameTextField.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        lastnameTextFieldHeightAnchor = LastnameTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: 1/4)
        lastnameTextFieldHeightAnchor?.isActive = true
        
        //add constraints
        //need x,y,width,height
        
        LastNameSeperatorView.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor).isActive = true
        LastNameSeperatorView.topAnchor.constraint(equalTo: LastnameTextField.bottomAnchor).isActive = true
        LastNameSeperatorView.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        LastNameSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //add constraints
        //need x,y,width,height
        
        EmailTextField.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor, constant: 12).isActive = true
        EmailTextField.topAnchor.constraint(equalTo: LastnameTextField.bottomAnchor).isActive = true
        EmailTextField.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        emailTextFieldHeightAnchor = EmailTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: 1/4)
        emailTextFieldHeightAnchor?.isActive = true
        
        //add constraints
        //need x,y,width,height
        
        EmailSeperatorView.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor).isActive = true
        EmailSeperatorView.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
        EmailSeperatorView.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        EmailSeperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        //add constraints
        //need x,y,width,height
        
        PasswordTextField.leftAnchor.constraint(equalTo: InputsContainerView.leftAnchor, constant: 12).isActive = true
        PasswordTextField.topAnchor.constraint(equalTo: EmailTextField.bottomAnchor).isActive = true
        PasswordTextField.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        passwordTextFieldHeightAnchor = PasswordTextField.heightAnchor.constraint(equalTo: InputsContainerView.heightAnchor, multiplier: 1/4)
        passwordTextFieldHeightAnchor?.isActive = true
        
    }
    @objc func handleLoginRegister() {
        if LoginRegisterSegmentedControl.selectedSegmentIndex == 0 {
            LoginButtonTapped()
        } else {
            RegisterButtonTapped()
        }
    }
    
    
    
    @objc func LoginButtonTapped(){
        print("logging in")
        self.dismiss(animated: true) {
            print("yes")
        }
        


    }
    @objc func RegisterButtonTapped() {
        
        let Username = FirstnameTextField.text
        let lastName = LastnameTextField.text
        let Password = PasswordTextField.text
        let Email = EmailTextField.text
        
        let parameters = ["Username": Username!, "Password": Password!, "LastName": lastName!, "FirstName": Username!, "Email": Email!]
        if (!JSONSerialization.isValidJSONObject(parameters)){
            print("not a valid json object")
            return
        }
        
        guard let url = URL(string: "https://hoverflyinc.com/api/user/create.php") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        do{
            let jsonBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonBody
        }catch{}
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response , err ) in
            guard let data = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {}
        }
        task.resume()
        

        self.dismiss(animated: true) {
            print("yes")
        }
        

    }
    
    func setupLoginRegisterButton(){
        //add constraints
        //need x,y,width,height
        LoginRegisterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        LoginRegisterButton.topAnchor.constraint(equalTo: InputsContainerView.bottomAnchor, constant: 12).isActive = true
        LoginRegisterButton.widthAnchor.constraint(equalTo: InputsContainerView.widthAnchor).isActive = true
        LoginRegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        LoginRegisterButton.layer.cornerRadius = 5
        LoginRegisterButton.layer.masksToBounds = false
       
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

}

extension LoginController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
