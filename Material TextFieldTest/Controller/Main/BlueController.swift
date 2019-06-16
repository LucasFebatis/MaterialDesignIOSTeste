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

class BlueController: UIViewController {
    
    var modalController: ModalController!
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func btnOpenModalClick() {
        
        modalController = ModalUtil.openModal(
            viewController: self,
            modalTitle: "Olá Mundo",
            modalSubTitle: "Alguma outra pergunta peculiar",
            btnConfirmarClick: btnConfirmarClick,
            btnCancelarClick: btnCancelarClick
        )
    }
    
    
    @objc func btnConfirmarClick() {
        
        print("Confirmou")
        modalController.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func btnCancelarClick() {
        
        print("Cancelou")
        modalController.dismiss(animated: true, completion: nil)
        
    }
    
}
