//
//  Login.swift
//  TableView
//
//  Created by Claire De Guzman on 2020-03-04.
//  Copyright © 2020 Claire De Guzman. All rights reserved.
//

import UIKit

protocol loginDelegate: class {
    func generateNow(_cell: UICollectionViewCell, buttonTapped: UIButton)
}

class Login: UICollectionViewCell {
    var delegate: loginDelegate?
 
    
    let loginImageView: UIImageView = {
        let liv = UIImageView()
        liv.image = UIImage(named:"Login")
        liv.contentMode = .scaleAspectFit
        liv.clipsToBounds = true
        return liv
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "go"), for: .normal)
        button.contentMode = .scaleAspectFill
        self.delegate?.generateNow(_cell: self, buttonTapped: button)
        return button
    }()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(loginImageView)
        addSubview(loginButton)
        
        loginImageView.anchorToTop(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        loginButton.anchor(topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 570, leftConstant: 70, bottomConstant: 10, rightConstant: 62, widthConstant: 0, heightConstant:0)

}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}




}

