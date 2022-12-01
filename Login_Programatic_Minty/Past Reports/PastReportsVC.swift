//
//  PastReportsVC.swift
//  Login_Programatic_Minty
//
//  Created by Kritagya Parajuli on 11/29/22.
//

import UIKit

class PastReportsVC: UIViewController {

  
    // MARK: - Initialization
    
    lazy var mainView: UIView = {
        let mainview = UIView()
        mainview.translatesAutoresizingMaskIntoConstraints = false
        
        return mainview
    }()
    
    lazy var lblTitle: UILabel = {
        let lblTitle = UILabel()
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "Past Reports"
        lblTitle.textColor = .white
        lblTitle.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        
        return lblTitle
    }()
    
    lazy var btnBack: UIButton = {
        let btnBack = UIButton()
        btnBack.translatesAutoresizingMaskIntoConstraints = false
        btnBack.backgroundColor = .clear
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 22, weight: .heavy, scale: .large)
        let largeBoldBack = UIImage(systemName: "chevron.backward", withConfiguration: largeConfig)
        btnBack.setImage(largeBoldBack, for: .normal)
        btnBack.isUserInteractionEnabled = true
        btnBack.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        
        return btnBack
    }()
    
    // MARK: - Constants and variables
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        vcConfig()
        setup()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    // MARK: - IBAction Functions
    
    // MARK: - Additional Functions
    @objc func backAction(){
        self.dismiss(animated: true, completion: nil)
    }

}

extension PastReportsVC{
    
    private func vcConfig(){
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Background2")
        
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        backgroundImage.isUserInteractionEnabled = true
    }
    
    private func setup(){
        autoLayoutMainView()
        autoLayoutheaderView()
    }
    
    //MARK: - AutoLayout Functions
    
    private func autoLayoutMainView(){
        view.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.widthAnchor.constraint(equalTo: view.widthAnchor),
            mainView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
    }
    
    private func autoLayoutheaderView(){
        mainView.addSubview(btnBack)
        mainView.addSubview(lblTitle)
        //headerView.sendSubviewToBack(imgHeader)
        
        
        NSLayoutConstraint.activate([
            btnBack.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 64),
            btnBack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 30),
            btnBack.heightAnchor.constraint(equalToConstant: 22),
            btnBack.widthAnchor.constraint(equalToConstant: 14),
            lblTitle.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            lblTitle.centerYAnchor.constraint(equalTo: btnBack.centerYAnchor)
            
            
        ])
        
        
    }
    
 
    
}
