//
//  LandingVC.swift
//  Login_Programatic_Minty
//
//  Created by Kritagya Parajuli on 11/23/22.
//

import UIKit
import IBAnimatable

class LandingVC: UIViewController {
    
    
    // MARK: - Constants and variables
    
    // MARK: - Initialization
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        return scrollView
    }()
    
    lazy var mainView: UIView = {
        let mainview = UIView()
        mainview.translatesAutoresizingMaskIntoConstraints = false
        
        return mainview
    }()
    
    lazy var headerView: UIView = {
        let headerView = UIView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        return headerView
    }()
    
    lazy var imgHeader: UIImageView = {
        let imgHeader = UIImageView()
        imgHeader.translatesAutoresizingMaskIntoConstraints = false
        imgHeader.image = UIImage(named: "ViewBackground")
        imgHeader.contentMode = .scaleAspectFill
        imgHeader.isUserInteractionEnabled = true
        imgHeader.clipsToBounds = true
        
        return imgHeader
    }()
    
    lazy var btnMenu: UIButton = {
        let btnMenu = UIButton()
        btnMenu.translatesAutoresizingMaskIntoConstraints = false
        btnMenu.backgroundColor = .clear
        btnMenu.setImage(UIImage(named: "MenuIcon"), for: .normal)
        btnMenu.isUserInteractionEnabled = true
        btnMenu.addTarget(self, action: #selector(menuAction), for: .touchUpInside)
        
        return btnMenu
    }()
    
    lazy var btnProfilePic : UIButton = {
        let btnProfilePic = UIButton()
        btnProfilePic.translatesAutoresizingMaskIntoConstraints = false
        btnProfilePic.backgroundColor = .clear
        btnProfilePic.setImage(UIImage(named: "ProfilePicture"), for: .normal)
        btnProfilePic.layer.cornerRadius = 20
        btnProfilePic.layer.masksToBounds = true
        btnProfilePic.addTarget(self, action: #selector(profileClickAction), for: .touchUpInside)
        
        return btnProfilePic
    }()
    
    lazy var imgLogo : UIImageView = {
        let imgLogo = UIImageView()
        imgLogo.translatesAutoresizingMaskIntoConstraints = false
        imgLogo.backgroundColor = .clear
        imgLogo.image = UIImage(named: "TouchReportLogo")
        
        
        
        return imgLogo
    }()
    
    lazy var lblHello : UILabel = {
       let lblHello = UILabel()
        lblHello.translatesAutoresizingMaskIntoConstraints = false
        lblHello.text = "Hello, KdkAnuwesh"
        lblHello.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        lblHello.textColor = .white
        
        return lblHello
    }()
    
    lazy var lblReportedInidents : UILabel = {
       let lblReportedInidents = UILabel()
        lblReportedInidents.translatesAutoresizingMaskIntoConstraints = false
        lblReportedInidents.text = "23 people reported incidents today"
        lblReportedInidents.font = UIFont.systemFont(ofSize: 16, weight: .light)
        lblReportedInidents.textColor = .white
        
        return lblReportedInidents
    }()
    
    lazy var lblHelp : UILabel = {
       let lblHelp = UILabel()
        lblHelp.translatesAutoresizingMaskIntoConstraints = false
        lblHelp.text = "How can we help?"
        lblHelp.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        lblHelp.textColor = .white
        
        return lblHelp
    }()
    
    lazy var btnNeedHelp: AnimatableButton = {
        let btnNeedHelp = AnimatableButton()
        btnNeedHelp.translatesAutoresizingMaskIntoConstraints = false
        btnNeedHelp.setTitle("I need help!", for: .normal)
        btnNeedHelp.setImage(UIImage(named: "INeedHelpIcon"), for: .normal)
        btnNeedHelp.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 20.0)
        //btnNeedHelp.setBackgroundImage(UIImage(named: "INeedHelpIcon"), for: .normal)
        btnNeedHelp.backgroundColor = UIColor(named: "darkBlue")
        
        btnNeedHelp.layer.cornerRadius = 15
        btnNeedHelp.layer.masksToBounds = true
        
        return btnNeedHelp
        
    }()
    
    lazy var btnIncident: UIButton = {
        let btnIncident = UIButton()
        btnIncident.translatesAutoresizingMaskIntoConstraints = false
        btnIncident.setImage(UIImage(named: "IncidentIcon"), for: .normal)
        btnIncident.setTitle("There's been an incident", for: .normal)
        btnIncident.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 20.0)
        btnIncident.backgroundColor = UIColor(named: "darkBlue")
        btnIncident.layer.cornerRadius = 15
        btnIncident.layer.masksToBounds = true
        
        return btnIncident
        
    }()
    
    lazy var btnCrime: UIButton = {
        let btnCrime = UIButton()
        btnCrime.translatesAutoresizingMaskIntoConstraints = false
        btnCrime.setImage(UIImage(named: "CrimeIcon"), for: .normal)
        btnCrime.setTitle("I've witnessed a crime", for: .normal)
        btnCrime.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 20.0)
        btnCrime.backgroundColor = UIColor(named: "darkBlue")
        btnCrime.layer.cornerRadius = 15
        btnCrime.layer.masksToBounds = true
        
        return btnCrime
        
    }()
    
    lazy var btnMeNoGood: UIButton = {
        let btnMeNoGood = UIButton()
        btnMeNoGood.translatesAutoresizingMaskIntoConstraints = false
        btnMeNoGood.setImage(UIImage(named: "MeNoGoodIcon"), for: .normal)
        btnMeNoGood.setTitle("I do not feel so good", for: .normal)
        btnMeNoGood.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 20.0)
        btnMeNoGood.backgroundColor = UIColor(named: "darkBlue")
        btnMeNoGood.layer.cornerRadius = 15
        btnMeNoGood.layer.masksToBounds = true
        
        return btnMeNoGood
        
    }()
    
    lazy var helpStack: UIStackView = {
        let helpStack = UIStackView()
        helpStack.translatesAutoresizingMaskIntoConstraints = false
        helpStack.addArrangedSubview(btnNeedHelp)
        helpStack.addArrangedSubview(btnIncident)
        helpStack.addArrangedSubview(btnCrime)
        helpStack.addArrangedSubview(btnMeNoGood)
        helpStack.axis  = .vertical
        helpStack.spacing = 16
        
        
        
        return helpStack
    }()
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        vcconfig()
        
        
        
    }
    
    // MARK: - IBAction Functions
    
    @objc func menuAction(){
        print("Menu tapped")
        let vc = MenuVC()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func profileClickAction(){
        print("Profile tapped")
    }
    
    // MARK: - Additional Functions
    
    // MARK: - AutoLayout Functions
    
    private func setup(){
        
        autoLayoutscrollView()
        autoLayoutmainView()
        autoLayoutheaderView()
        autoLayoutNavbar()
        autoLayoutLblHeader()
        autoLayoutHelpStack()
        
        
    }
    
    private func vcconfig(){
      
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background2")
        
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        backgroundImage.isUserInteractionEnabled = true
        
        
        
        
    }
    
    
    private func autoLayoutscrollView(){
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
            
        ])
        
    }
    
    private func autoLayoutmainView(){
        scrollView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            mainView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            mainView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            
        ])
        
    }
    
    private func autoLayoutheaderView(){
        mainView.addSubview(headerView)
        headerView.addSubview(imgHeader)
        //headerView.sendSubviewToBack(imgHeader)
        
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: mainView.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 300),
            imgHeader.topAnchor.constraint(equalTo: headerView.topAnchor),
            imgHeader.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            imgHeader.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            imgHeader.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
        ])
        
        
    }
    
    
    private func autoLayoutNavbar(){
        
        imgHeader.addSubview(imgLogo)
        imgHeader.addSubview(btnMenu)
        imgHeader.addSubview(btnProfilePic)
        
        
        NSLayoutConstraint.activate([
            btnMenu.topAnchor.constraint(equalTo: imgHeader.topAnchor, constant: 66),
            btnMenu.leadingAnchor.constraint(equalTo: imgHeader.leadingAnchor,constant: 32),
            btnMenu.widthAnchor.constraint(equalToConstant: 16),
            btnMenu.heightAnchor.constraint(equalToConstant: 16),
            btnProfilePic.centerYAnchor.constraint(equalTo: btnMenu.centerYAnchor),
            btnProfilePic.trailingAnchor.constraint(equalTo: imgHeader.trailingAnchor,constant: -32),
            btnProfilePic.widthAnchor.constraint(equalToConstant: 40),
            btnProfilePic.heightAnchor.constraint(equalToConstant: 40),
            imgLogo.centerYAnchor.constraint(equalTo: btnMenu.centerYAnchor),
            imgLogo.centerXAnchor.constraint(equalTo: imgHeader.centerXAnchor),
            imgLogo.heightAnchor.constraint(equalToConstant: 27),
            imgLogo.widthAnchor.constraint(equalToConstant: 186)
            
            
        ])
        
        
    }
    
    private func autoLayoutHelpStack(){
        mainView.addSubview(helpStack)
        
        NSLayoutConstraint.activate([
            btnNeedHelp.heightAnchor.constraint(equalToConstant: 63),
            btnIncident.heightAnchor.constraint(equalToConstant: 63),
            btnCrime.heightAnchor.constraint(equalToConstant: 63),
            btnMeNoGood.heightAnchor.constraint(equalToConstant: 63),
            helpStack.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 46),
            helpStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 27),
            helpStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27),
            helpStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }
    
    private func autoLayoutLblHeader(){
        imgHeader.addSubview(lblHello)
        imgHeader.addSubview(lblReportedInidents)
        imgHeader.addSubview(lblHelp)
        
        NSLayoutConstraint.activate([
            lblHello.topAnchor.constraint(equalTo: imgLogo.topAnchor, constant: 80),
            lblHello.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            lblReportedInidents.topAnchor.constraint(equalTo: lblHello.bottomAnchor, constant: 16),
            lblReportedInidents.centerXAnchor.constraint(equalTo: lblHello.centerXAnchor),
            lblHelp.topAnchor.constraint(equalTo: lblReportedInidents.bottomAnchor, constant: 16),
            lblHelp.centerXAnchor.constraint(equalTo: lblReportedInidents.centerXAnchor)
        ])
    }
    
    
    
    
    
    
}
