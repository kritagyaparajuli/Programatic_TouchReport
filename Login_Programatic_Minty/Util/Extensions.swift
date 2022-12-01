//
//  HexString.swift
//  Login_Programatic_Minty
//
//  Created by Kritagya Parajuli on 11/16/22.
//

import Foundation
import UIKit

extension UIColor {
    
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
    

}

extension UITextField {
    internal func addBottomBorder(height: CGFloat = 1.0, color: UIColor = .white) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(borderView)
        NSLayoutConstraint.activate(
            [
                borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
                borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
                borderView.bottomAnchor.constraint(equalTo: bottomAnchor),
                borderView.heightAnchor.constraint(equalToConstant: height)
            ]
        )
    }
}



let button = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle(){
        
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        button.alpha = 0.4
    }
    
    @objc func togglePasswordView(_ sender: Any) {
        isSecureTextEntry.toggle()
        button.isSelected.toggle()
    }
}





extension UIImageView {
    
    func makeRounded() {
        
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}

extension UINavigationController{
    
    func setupNaviBar(isHidden : Bool = false){
        
      
        var menuimage = UIImage(named: "MenuIcon")
        menuimage = menuimage?.withRenderingMode(.alwaysOriginal)
        var profpic = UIImage(named: "ProfilePicture")
        
        profpic = profpic?.withRenderingMode(.alwaysOriginal)
        let prof = profpic?.resizeImage(targetSize: CGSize(width: 48, height: 48))
        
    
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: prof, style:.plain, target: self, action: #selector(onClickMenuAction))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: menuimage, style: .plain, target: self, action: #selector(onClickProfileAction))
        

        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default) //UIImage.init(named: "transparent.png")
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
    }
    
    @objc func onClickMenuAction(){
        print("Menu Tapped")
        //
    }
    
    @objc func onClickProfileAction(){
        print("Profile Tapped")
        //
    }
   
    
}

extension UIImage {
  func resizeImage(targetSize: CGSize) -> UIImage {
    let size = self.size
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    let newSize = widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()

    return newImage!
  }
}

extension UIImage {
    func resized(to newSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            let hScale = newSize.height / size.height
            let vScale = newSize.width / size.width
            let scale = max(hScale, vScale) // scaleToFill
            let resizeSize = CGSize(width: size.width*scale, height: size.height*scale)
            var middle = CGPoint.zero
            if resizeSize.width > newSize.width {
                middle.x -= (resizeSize.width-newSize.width)/2.0
            }
            if resizeSize.height > newSize.height {
                middle.y -= (resizeSize.height-newSize.height)/2.0
            }
            
            draw(in: CGRect(origin: middle, size: resizeSize))
        }
    }
}
extension UIButton {
    func moveImageLeftTextCenter(imagePadding: CGFloat = 80.0, titlePadding: CGFloat = 0.0, minImageTitleDistance: CGFloat = 10.0){
    guard let imageViewWidth = imageView?.frame.width else{return}
    guard let titleLabelWidth = titleLabel?.intrinsicContentSize.width else{return}
    contentHorizontalAlignment = .left

    let imageLeftInset = imagePadding - imageViewWidth / 2
    var titleLeftInset = (bounds.width - titleLabelWidth) / 2 - imageViewWidth + titlePadding

    if titleLeftInset - imageLeftInset < minImageTitleDistance{
        titleLeftInset = imageLeftInset + minImageTitleDistance
    }

    imageEdgeInsets = UIEdgeInsets(top: 0.0, left: imageLeftInset, bottom: 0.0, right: 0.0)
    titleEdgeInsets = UIEdgeInsets(top: 0.0, left: titleLeftInset, bottom: 0.0, right: 0.0)
    }
}
