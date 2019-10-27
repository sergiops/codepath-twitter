//
//  MainLoginButton.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class MainLoginButton: UIButton {
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        self.layer.backgroundColor = #colorLiteral(red: 0.1137254902, green: 0.6274509804, blue: 0.9490196078, alpha: 1)
        self.layer.cornerRadius = 20
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(18),                              weight: UIFont.Weight.bold)
        self.setTitle("Login", for: UIControl.State.normal)
        self.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
        
    }

}
