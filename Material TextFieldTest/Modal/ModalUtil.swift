//
//  ModalUtil.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 16/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import Foundation
import UIKit

class ModalUtil {
    
    class func openModal(viewController: UIViewController, modalTitle: String, modalSubTitle: String, btnConfirmarClick: (()->Void)?, btnCancelarClick: (()->Void)?) -> ModalController {
        
        let storyboard = UIStoryboard(name: "Modal", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ModalController") as! ModalController
        
        controller.modalPresentationStyle = .overCurrentContext
        
        controller.modalTitle = modalTitle
        controller.modalSubTitle = modalSubTitle
        
        controller.btnConfirmarClick = btnConfirmarClick
        controller.btnCancelarClick = btnCancelarClick
        
        controller.viewController = viewController
        
        viewController.present(controller, animated: true, completion: nil)
        
        return controller
        
    }
    
}
