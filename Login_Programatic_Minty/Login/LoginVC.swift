//
//  LoginVC.swift
//  Login_Programatic
//
//  Created by Kritagya Parajuli on 11/16/22.
//

import UIKit

class LoginVC: UIViewController{
    
    // MARK: - Initialization
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = UIColor(named: "Minimal_Dark_Bg")
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let mainView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    lazy var lblTitle: UILabel = {
        let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "MINTY"
        lblTitle.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        lblTitle.textColor = UIColor(named: "Title_Color")
        let attributedString = NSMutableAttributedString(string: lblTitle.text!)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: CGFloat(5.0), range: NSRange(location: 0, length: attributedString.length))
        lblTitle.attributedText = attributedString
        
        return lblTitle
    }()
    
    lazy var lblOtherOpt: UILabel = {
        let lblOtherOpt = UILabel()
        lblOtherOpt.translatesAutoresizingMaskIntoConstraints = false
        lblOtherOpt.text = "Other sign in options"
        lblOtherOpt.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        lblOtherOpt.textColor = UIColor(hexString: "98989F")
        
        return lblOtherOpt
    }()
    
    lazy var segmentControl: UISegmentedControl = {
        let segItems = ["Sign In", "Register"]
        let segmentControl = UISegmentedControl(items: segItems)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .normal)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentControl.selectedSegmentIndex = 0
        segmentControl.selectedSegmentTintColor = UIColor(hexString: "#636366")
        
        return segmentControl
        
    }()
    
    lazy var txtFieldPhoneNumber: UITextField = {
        let txtFieldPhoneNumber = UITextField()
        txtFieldPhoneNumber.translatesAutoresizingMaskIntoConstraints = false
        txtFieldPhoneNumber.textColor = .white
        txtFieldPhoneNumber.addBottomBorder(height: 1.0, color: UIColor(hexString: "2E2E30"))
        txtFieldPhoneNumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtFieldPhoneNumber.frame.height))
        txtFieldPhoneNumber.leftViewMode = .always
        txtFieldPhoneNumber.tintColor = .white
        txtFieldPhoneNumber.attributedPlaceholder = NSAttributedString(
            string: "Phone Number",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "98989F")]
        )
        txtFieldPhoneNumber.isHidden = true
        txtFieldPhoneNumber.alpha = 0
        
        return txtFieldPhoneNumber
    }()
    
    lazy var txtFieldEmail: UITextField = {
        let txtFieldEmail = UITextField()
        txtFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        txtFieldEmail.textColor = .white
        txtFieldEmail.addBottomBorder(height: 1.0, color: UIColor(hexString: "2E2E30"))
        txtFieldEmail.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtFieldEmail.frame.height))
        txtFieldEmail.leftViewMode = .always
        txtFieldEmail.tintColor = .white
        txtFieldEmail.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "98989F")]
        )
        
        
        return txtFieldEmail
    }()
    
    lazy var txtFieldPassword: UITextField = {
        let txtFieldPassword = UITextField()
        txtFieldPassword.translatesAutoresizingMaskIntoConstraints = false
        txtFieldPassword.enablePasswordToggle()
        txtFieldPassword.textColor = .white
        txtFieldPassword.tintColor = .white
        txtFieldPassword.addBottomBorder(height: 1.0, color: UIColor(hexString: "2E2E30"))
        txtFieldPassword.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: txtFieldPassword.frame.height))
        txtFieldPassword.leftViewMode = .always
        txtFieldPassword.isSecureTextEntry = true
        txtFieldPassword.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(hexString: "98989F")]
        )
        
        
        return txtFieldPassword
    }()
    
    lazy var txtSignInStackView: UIStackView = {
        let txtSignInStackView   = UIStackView()
        txtSignInStackView.translatesAutoresizingMaskIntoConstraints = false
        txtSignInStackView.axis  = NSLayoutConstraint.Axis.vertical
        //        txtSignInStackView.distribution  = UIStackView.Distribution.equalSpacing
        //        txtSignInStackView.alignment = UIStackView.Alignment.center
        txtSignInStackView.spacing   = 16.0
        
        return txtSignInStackView
    }()
    
    
    lazy var btnForgotPass: UIButton = {
       let btnForgotPass = UIButton()
        btnForgotPass.translatesAutoresizingMaskIntoConstraints = false
        btnForgotPass.setTitle("Forgot Your Password?", for: .normal)
        btnForgotPass.backgroundColor = .clear
        btnForgotPass.setTitleColor(UIColor(hexString: "98989F"), for: .normal)
        btnForgotPass.titleLabel?.font =  UIFont.systemFont(ofSize: 13)
        
        
        return btnForgotPass
    }()
    
    lazy var btnSignIn: UIButton = {
       let btnSignIn = UIButton()
        btnSignIn.translatesAutoresizingMaskIntoConstraints = false
        btnSignIn.setTitle("Sign In", for: .normal)
        btnSignIn.backgroundColor = UIColor(named: "Title_Color")
        btnSignIn.setTitleColor(UIColor.black, for: .normal)
        btnSignIn.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        btnSignIn.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
        
        
        return btnSignIn
    }()
    
    lazy var btnGoogleLogin: UIButton = {
       let btnGoogleLogin = UIButton()
        btnGoogleLogin.translatesAutoresizingMaskIntoConstraints = false
        btnGoogleLogin.setTitle("", for: .normal)
        btnGoogleLogin.backgroundColor = .clear
        btnGoogleLogin.setImage(UIImage(named: "Google_Logo"), for: .normal)
        btnGoogleLogin.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        
        
        return btnGoogleLogin
    }()
    
    lazy var btnFbLogin: UIButton = {
       let btnFbLogin = UIButton()
        btnFbLogin.translatesAutoresizingMaskIntoConstraints = false
        btnFbLogin.setTitle("", for: .normal)
        btnFbLogin.backgroundColor = .clear
        btnFbLogin.setImage(UIImage(named: "Facebook_Logo"), for: .normal)
        btnFbLogin.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        
        
        return btnFbLogin
    }()
    
    lazy var btnAppleLogin: UIButton = {
       let btnAppleLogin = UIButton()
        btnAppleLogin.translatesAutoresizingMaskIntoConstraints = false
        btnAppleLogin.setTitle("", for: .normal)
        btnAppleLogin.backgroundColor = .clear
        btnAppleLogin.setImage(UIImage(named: "Apple_Logo"), for: .normal)
        btnAppleLogin.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .bold)
        
        
        return btnAppleLogin
    }()
    
    
    
    lazy var stkViewOtherOptions: UIStackView = {
        let stkViewOtherOptions = UIStackView()
        stkViewOtherOptions.translatesAutoresizingMaskIntoConstraints = false
        stkViewOtherOptions.axis  = NSLayoutConstraint.Axis.vertical
        stkViewOtherOptions.distribution  = UIStackView.Distribution.equalSpacing
        stkViewOtherOptions.alignment = UIStackView.Alignment.center
        stkViewOtherOptions.spacing   = 12.0
        
        return stkViewOtherOptions
    }()
    
    lazy var stkViewOtherOptionsIcn: UIStackView = {
        let stkViewOtherOptionsIcn = UIStackView()
        stkViewOtherOptionsIcn.translatesAutoresizingMaskIntoConstraints = false
        stkViewOtherOptionsIcn.axis  = NSLayoutConstraint.Axis.horizontal
        stkViewOtherOptionsIcn.spacing   = 12.0
        
        return stkViewOtherOptionsIcn
    }()
    
    
    
    
    
    // MARK: - Constants and variables
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        vcConfig()
    }
     
    
    
    // MARK: - IBAction Functions
    
    @objc func segmentAction(_ segmentControl: UISegmentedControl) {
        switch (segmentControl.selectedSegmentIndex) {
        case 0:
            UIView.animate(withDuration: 0.3){
                self.btnSignIn.layer.cornerRadius = 0
                self.btnSignIn.setTitle("Sign In", for: .normal)
                self.txtFieldPhoneNumber.alpha = 0
                self.txtFieldPhoneNumber.isHidden = true
                self.txtFieldEmail.resignFirstResponder()
                self.txtFieldPassword.resignFirstResponder()
                self.txtFieldPhoneNumber.resignFirstResponder()
                
            }
            
        case 1:
            UIView.animate(withDuration: 0.3){
                self.btnSignIn.layer.cornerRadius = 24
                self.btnSignIn.setTitle("Register", for: .normal)
                self.txtFieldPhoneNumber.alpha = 1
                self.txtFieldPhoneNumber.isHidden = false
                self.txtFieldEmail.resignFirstResponder()
                self.txtFieldPassword.resignFirstResponder()
                self.txtFieldPhoneNumber.resignFirstResponder()
            }
        default:
            print("default")
        }
        
    }
    
    
    @objc func signInAction(){
        print("SignedIn..")
        let vc = LandingVC()
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: - Additional Functions
    
    private func setup() {
        
        vcConfig()
        
        autoLayoutForScrollView()
        
        autoLayoutForMainView()
        
        autoLayoutLabel()
        
        autoLayoutSegmentControl()
        
        autoLayoutPhoneTextField()
        
        autoLayoutEmailTextField()
        
        autoLayoutPasswordTextField()
        
        autoLayouttxtSignInStackView()
        
        autoLayoutBtnForgotPass()
        
        autoLayoutBtnSignIn()
        
        autoLayouttxtLoginButtonsStackView()
        
        autoLayoutOtherOptionsStackView()
        
        autoLayoutGoogleLogin()
        
        autoLayoutFbLogin()
        
        autoLayoutAppleLogin()
        
    }
    
    
    
    private func vcConfig() {
        view.backgroundColor = UIColor(named: "Minimal_Dark_Bg")
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
    
    // MARK: - AUTOLAYOUT FUNCTIONS
    
    private func autoLayoutForScrollView() {
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
            
            
        ])
        
    }
    
    private func autoLayoutForMainView() {
        
        scrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
            
            
        ])
        
    }
    
    private func autoLayoutLabel() {
        let safeLayout = mainView.layoutMarginsGuide
        mainView.addSubview(lblTitle)
        
        NSLayoutConstraint.activate([
            
            lblTitle.topAnchor.constraint(equalTo: safeLayout.topAnchor, constant: 150),
            lblTitle.centerXAnchor.constraint(equalTo: safeLayout.centerXAnchor)
            
        ])
    }
    
   
    private func autoLayoutSegmentControl() {
        mainView.addSubview(segmentControl)
        
        NSLayoutConstraint.activate([
            
            segmentControl.topAnchor.constraint(equalTo: lblTitle.bottomAnchor, constant: 50),
            segmentControl.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            segmentControl.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            segmentControl.heightAnchor.constraint(equalToConstant: 32)
            
        ])
        
    }
    
    private func autoLayoutEmailTextField() {
        
        NSLayoutConstraint.activate([
            
            txtFieldEmail.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func autoLayoutPasswordTextField() {
        //mainView.addSubview(txtPassword) ----- NOT NEEDED
        
        NSLayoutConstraint.activate([
            
            txtFieldPassword.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    private func autoLayoutPhoneTextField() {
        //mainView.addSubview(txtPassword) ----- NOT NEEDED
        
        NSLayoutConstraint.activate([
            
            txtFieldPhoneNumber.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    
    
    private func autoLayouttxtSignInStackView(){
        mainView.addSubview(txtSignInStackView)
        
        
        txtSignInStackView.addArrangedSubview(txtFieldPhoneNumber)
        txtSignInStackView.addArrangedSubview(txtFieldEmail)
        txtSignInStackView.addArrangedSubview(txtFieldPassword)
        
        NSLayoutConstraint.activate([
            
            txtSignInStackView.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 36),
            txtSignInStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 37),
            txtSignInStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -37)
        ])
        
        
    }
    
  
    
    private func autoLayouttxtLoginButtonsStackView(){
        //mainView.addSubview(stkViewOtherOptionsIcn)
        
        stkViewOtherOptionsIcn.addArrangedSubview(btnFbLogin)
        stkViewOtherOptionsIcn.addArrangedSubview(btnAppleLogin)
        stkViewOtherOptionsIcn.addArrangedSubview(btnGoogleLogin)
        
        NSLayoutConstraint.activate([
            
            //stkViewOtherOptionsIcn.topAnchor.constraint(equalTo: lblOtherOpt.bottomAnchor, constant: 12),
            //stkViewOtherOptionsIcn.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
            
        ])
        
        
    }
    
    private func autoLayoutOtherOptionsStackView(){
        mainView.addSubview(stkViewOtherOptions)
        
        
        stkViewOtherOptions.addArrangedSubview(lblOtherOpt)
        stkViewOtherOptions.addArrangedSubview(stkViewOtherOptionsIcn)
        
        NSLayoutConstraint.activate([
            
            stkViewOtherOptions.topAnchor.constraint(equalTo: btnSignIn.bottomAnchor, constant: 78),
            stkViewOtherOptions.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            stkViewOtherOptions.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10)
            
            
            
        ])
        
        
    }
    
    private func autoLayoutBtnForgotPass(){
        mainView.addSubview(btnForgotPass)
        
        NSLayoutConstraint.activate([
            
            btnForgotPass.topAnchor.constraint(equalTo: txtSignInStackView.bottomAnchor, constant: 20),
            btnForgotPass.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
            
        
        ])
    }
    
    private func autoLayoutBtnSignIn(){
        mainView.addSubview(btnSignIn)
        
        NSLayoutConstraint.activate([
            
            btnSignIn.topAnchor.constraint(equalTo: btnForgotPass.bottomAnchor, constant: 32),
            btnSignIn.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            btnSignIn.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            btnSignIn.heightAnchor.constraint(equalToConstant: 48)
            
            
        
        ])
    }
    
    private func autoLayoutGoogleLogin(){
        //mainView.addSubview(btnGoogleLogin)
        
        NSLayoutConstraint.activate([
            
            
            btnGoogleLogin.heightAnchor.constraint(equalToConstant: 36),
            btnGoogleLogin.widthAnchor.constraint(equalToConstant: 36)
                        
        
        ])
    }
    
    private func autoLayoutFbLogin(){
        //mainView.addSubview(btnFbLogin)
        
        NSLayoutConstraint.activate([
            
            
            btnFbLogin.heightAnchor.constraint(equalToConstant: 36),
            btnFbLogin.widthAnchor.constraint(equalToConstant: 36)
                        
        
        ])
    }
    
    private func autoLayoutAppleLogin(){
        //mainView.addSubview(btnAppleLogin)
        
        NSLayoutConstraint.activate([
            
            
            btnAppleLogin.heightAnchor.constraint(equalToConstant: 36),
            btnAppleLogin.widthAnchor.constraint(equalToConstant: 36)
                        
        
        ])
    }
    
    
    
    
}
