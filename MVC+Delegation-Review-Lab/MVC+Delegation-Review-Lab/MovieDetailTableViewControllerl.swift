//
//  MovieDetailTableViewCell.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Margiett Gil on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieDetailTableView: UIViewController {
    
    @IBOutlet weak var fontUpdatingLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    
    var currentFontSize: CGFloat!
  
    
    
    // this is where i am configuring
    @IBAction func fontStepperAction(_ sender: UIStepper) {
        fontSlider.value = Float(sender.value)
        currentFontSize = CGFloat(sender.value) // we are
        fontUpdatingLabel.text = ("Current Font Size: \(currentFontSize)")
        
    }
    
    @IBAction func fontSliderAction(_ sender: UISlider) {
        fontStepper.value = Double(sender.value) // might need to add a double
        currentFontSize = CGFloat(sender.value)
         fontUpdatingLabel.text = ("Current Font Size: \(currentFontSize)")
    }
    
  
}
