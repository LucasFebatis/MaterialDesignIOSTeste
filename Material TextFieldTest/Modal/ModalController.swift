//
//  ModalController.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 16/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import Foundation
import UIKit

class ModalController: UIViewController {
    
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblSubTitle: UILabel!
    
    @IBOutlet var btnConfirmar: UIButton!
    @IBOutlet var btnCancelar: UIButton!
    
    var modalTitle: String?
    var modalSubTitle: String?
    
    /**
        NOTA: Por ser um metodo do Obj-C, deve ter o mesmo nome da propriedade.
        Ex.:
        ```
        controller.btnConfirmarClick = btnConfirmarClick
        ```
     */
    @objc var btnConfirmarClick: (()->Void)?
    
    /**
         NOTA: Por ser um metodo do Obj-C, deve ter o mesmo nome da propriedade.
         Ex.:
         ```
         controller.btnCancelarClick = btnCancelarClick
         ```
     */
    @objc var btnCancelarClick: (()->Void)?
    
    /**
     NOTA: Por ser um metodo do Obj-C, deve ter a referencia de qual viewController estão as funções do Swift
     */
    var viewController: UIViewController?
    
    override func viewDidLoad() {
        
        lblTitle.text = modalTitle
        lblSubTitle.text = modalSubTitle
        
        btnCancelar.addTarget(viewController, action: #selector(getter: btnCancelarClick), for: .touchUpInside)
        
        btnConfirmar.addTarget(viewController, action: #selector(getter: btnConfirmarClick), for: .touchUpInside)
        
    }
    
}
