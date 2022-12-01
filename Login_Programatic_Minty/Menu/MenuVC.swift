//
//  MenuVC.swift
//  Login_Programatic_Minty
//
//  Created by Kritagya Parajuli on 11/25/22.
//

import UIKit

class MenuVC: UIViewController, UIGestureRecognizerDelegate {
    
    
    // MARK: - Constants and variables
    
    
    // MARK: - View Intializatiion
    lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.frame = view.bounds
        blurView.alpha = 0
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return blurView
    }()
    
    lazy var tapGesture : UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        
        tapGesture.delegate = self
        return tapGesture
        
    }()
    
    
    lazy var mainView: UIView = {
        let mainView = UIView()
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.alpha = 1
        mainView.backgroundColor = UIColor(hexString: "#1E255E")
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 24, height: 24)).cgPath
        mainView.layer.mask = maskLayer

        
        return mainView
    }()
    
    lazy var viewSeparator: UIView = {
        let viewSeparator = UIView()
        
        
        viewSeparator.translatesAutoresizingMaskIntoConstraints = false
        viewSeparator.backgroundColor = .white
        viewSeparator.tintColor  = .white
        viewSeparator.layer.cornerRadius = 2
        viewSeparator.layer.masksToBounds = true
        
        return viewSeparator
    }()
    
    lazy var lblTitle : UILabel = {
        let lblTitle = UILabel()
        
        lblTitle.translatesAutoresizingMaskIntoConstraints = false
        lblTitle.text = "Select Language"
        lblTitle.textColor = .white
        lblTitle.tintColor = .white
        lblTitle.font = UIFont.systemFont(ofSize: 16, weight: .light)
        
        return lblTitle
        
    }()
    
    lazy var segmentLanguge: UISegmentedControl = {
        let segItems = ["English", "Nepali"]
        let segmentLanguge = UISegmentedControl(items: segItems)
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        let titleTextAttributesUnselected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributes, for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes(titleTextAttributesUnselected, for: .normal)
        segmentLanguge.translatesAutoresizingMaskIntoConstraints = false
        segmentLanguge.translatesAutoresizingMaskIntoConstraints = false
        segmentLanguge.addTarget(self, action: #selector(segmentAction(_:)), for: .valueChanged)
        segmentLanguge.selectedSegmentIndex = 0
        segmentLanguge.selectedSegmentTintColor = UIColor.white
        
        return segmentLanguge
    }()
    
   
    
    lazy var stkTitle : UIStackView = {
        let stkTitle = UIStackView()
        
        stkTitle.translatesAutoresizingMaskIntoConstraints = false
        stkTitle.addArrangedSubview(lblTitle)
        stkTitle.addArrangedSubview(segmentLanguge)
        stkTitle.axis = .vertical
        stkTitle.spacing = 18
        
        
        
        return stkTitle
    }()
    
    lazy var btnPastRecords : UIButton = {
        let btnPastRecords  = UIButton()
        
        btnPastRecords.translatesAutoresizingMaskIntoConstraints = false
        btnPastRecords.contentHorizontalAlignment = .left
        btnPastRecords.setImage(UIImage(named: "pastReportIcon"), for: .normal)
        btnPastRecords.setTitle("  View my past records", for: .normal)
        btnPastRecords.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .light)
        btnPastRecords.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 0.0)
        btnPastRecords.backgroundColor = .clear
        btnPastRecords.addTarget(self, action: #selector(btnPastRecordsAction), for: .touchUpInside)
        
        return btnPastRecords
    }()
    
    lazy var btnFeedback : UIButton = {
        let btnFeedback  = UIButton()
        
        btnFeedback.translatesAutoresizingMaskIntoConstraints = false
        btnFeedback.contentHorizontalAlignment = .left
        btnFeedback.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .light)
        btnFeedback.setImage(UIImage(named: "feedbackIcon"), for: .normal)
        btnFeedback.setTitle("  Give feedback", for: .normal)
        btnFeedback.imageEdgeInsets = UIEdgeInsets(top: 0.0, left: 0, bottom: 0.0, right: 0.0)
        btnFeedback.backgroundColor = .clear
        
        return btnFeedback
    }()
    
   
    
    lazy var stkBtm : UIStackView = {
        let stkBtm = UIStackView()
        
        stkBtm.addArrangedSubview(btnPastRecords)
        stkBtm.addArrangedSubview(btnFeedback)
        stkBtm.translatesAutoresizingMaskIntoConstraints = false
        stkBtm.axis = .vertical
        stkBtm.spacing = 40
        
        return stkBtm
    }()
    
    lazy var lblCopyright: UILabel = {
        let lblCopyright = UILabel()
       
        lblCopyright.translatesAutoresizingMaskIntoConstraints = false
        lblCopyright.text = "TouchReport © made by NOTANUWESH"
        lblCopyright.font = UIFont.systemFont(ofSize: 12, weight: .light)
        lblCopyright.textColor = .white
        
        return lblCopyright
    }()
    
    
    
   
    
    
    // MARK: - ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        vcConfig()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    // MARK: - IBAction Functions
    
    @objc func segmentAction(_ segmentLanguage: UISegmentedControl){
        switch (segmentLanguage.selectedSegmentIndex) {
        case 0:
            print("English")
            
        case 1 :
            print("Nepali")
            
        default:
            print("Default")
        }
        
    }
    
    @objc func handleTap(_ tapGesture : UITapGestureRecognizer){
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @objc func btnPastRecordsAction(){
        let vc = PastReportsVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
       
    }
    
    // MARK: - Additional Functions
    
    func gestureRecognizer(_ tapGesture: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view?.isDescendant(of: mainView) == true {
            return false
         }
         return true
    }
    
    private func setup() {
        autoLayoutMainView()
        autoLayoutViewSeparator()
        autoLayoutForTitleStack()
        autoLayoutForBottomStack()
        autoLayoutForCRLabel()
    }
    
    
    private func vcConfig() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(blurView)
        blurView.addGestureRecognizer(tapGesture)
        blurView.contentView.clipsToBounds = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            UIView.animate(withDuration: 0.2) {
                self.blurView.alpha = 1
                
                
            }
        }
        
    }
    
    
    
}

extension MenuVC {
    // MARK: - AutoLayout Functions
    
    private func autoLayoutMainView() {
        blurView.contentView.addSubview(mainView)
        
        NSLayoutConstraint.activate([
            
            mainView.bottomAnchor.constraint(equalTo: blurView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: blurView.trailingAnchor),
            mainView.trailingAnchor.constraint(equalTo: blurView.leadingAnchor,constant: self.view.frame.width),
            mainView.widthAnchor.constraint(equalTo: blurView.widthAnchor),
            mainView.heightAnchor.constraint(equalTo: blurView.heightAnchor, multiplier: 0.35)
            
            
        ])
        
    }
    
    private func autoLayoutViewSeparator() {
        mainView.addSubview(viewSeparator)
        
        NSLayoutConstraint.activate([
            viewSeparator.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            viewSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            viewSeparator.heightAnchor.constraint(equalToConstant: 4),
            viewSeparator.widthAnchor.constraint(equalToConstant: 48)
            
        ])
        
    }

    
    private func autoLayoutForTitleStack() {
        mainView.addSubview(stkTitle)
        
        NSLayoutConstraint.activate([
            segmentLanguge.heightAnchor.constraint(equalToConstant: 32),
            stkTitle.topAnchor.constraint(equalTo: viewSeparator.bottomAnchor, constant: 32),
            stkTitle.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 27),
            stkTitle.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27)
        ])
        
    }
    
    private func autoLayoutForBottomStack() {
        mainView.addSubview(stkBtm)
        
        NSLayoutConstraint.activate([
            btnPastRecords.heightAnchor.constraint(equalToConstant: 20),
            btnFeedback.heightAnchor.constraint(equalToConstant: 20),
            stkBtm.topAnchor.constraint(equalTo: stkTitle.bottomAnchor, constant: 34),
            stkBtm.leadingAnchor.constraint(equalTo: mainView.leadingAnchor,constant: 27),
            stkBtm.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -27)
        ])
        
    }
    
    private func autoLayoutForCRLabel() {
        mainView.addSubview(lblCopyright)
        
        NSLayoutConstraint.activate([
           
            
            lblCopyright.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            lblCopyright.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -27)
            
        ])
        
    }
    
    
    
}
