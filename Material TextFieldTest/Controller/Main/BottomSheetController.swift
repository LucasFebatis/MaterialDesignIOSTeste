//
//  BottomSheetController.swift
//  Material TextFieldTest
//
//  Created by Lucas Batista on 17/06/19.
//  Copyright © 2019 Lucas Batista. All rights reserved.
//

import Foundation
import UIKit
import MaterialComponents

class BottomSheetController: UIViewController {
    
    @IBAction func abrirBottomSheet() {
        
        // View controller the bottom sheet will hold
        let storyboard = UIStoryboard(name: "BottomSheet", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "BottomSheetController") as! BottomSheetViewController
        
        // Initialize the bottom sheet with the view controller just created
        let bottomSheet: MDCBottomSheetController = MDCBottomSheetController(contentViewController: controller)
        // Present the bottom sheet
        present(bottomSheet, animated: true, completion: nil)
        
    }
    
}
