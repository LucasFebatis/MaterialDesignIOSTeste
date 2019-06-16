//
//  GreenController.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 16/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class GreenController: UIViewController {
    
    @IBOutlet weak var tvTeste: MDCTextField!
    
    var tvMaterialController: MDCTextInputControllerFilled!
    
    override func viewDidLoad() {
    
        tvTeste.leftViewMode = .always
        tvTeste.rightViewMode = .always
    
        tvTeste.placeholder = "Full Name"
        tvMaterialController = MDCTextInputControllerFilled(textInput: tvTeste)

        let uiImageView1 = UIImageView(image: UIImage(named: "access-point-network"))
        uiImageView1.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let uiImageView2 = UIImageView(image: UIImage(named: "access-point-network-off"))
        uiImageView2.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        tvTeste.leftView = uiImageView1
        tvTeste.rightView = uiImageView2
        
    }
    
}
