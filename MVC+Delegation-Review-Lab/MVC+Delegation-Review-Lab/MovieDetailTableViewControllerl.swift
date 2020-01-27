//
//  MovieDetailTableViewCell.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Margiett Gil on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

//Step 1 - creating a protocol to conform ViewController to FontSizeDelegate
protocol FontSizeDelegate: AnyObject {
    
    func fontSizeChanged(_ viewController: MovieDetailTableView, _ fontSize: CGFloat)
}

class MovieDetailTableView: UIViewController {
    
    @IBOutlet weak var fontUpdatingLabel: UILabel!
    @IBOutlet weak var fontSlider: UISlider!
    @IBOutlet weak var fontStepper: UIStepper!
    @IBOutlet weak var button: UIButton!
    
    
    var currentFontSize: CGFloat?{
        didSet{
            //Step 3 - make a call for the delegate whenever something happens(currentFontSize CGFloat value has changed), and if you have arguements set for them, they get updated
            // this to make calls on the delegate, the functions inside the protocol gets called and store any values held within the function arguements 
            delegate?.fontSizeChanged(self, currentFontSize!)
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minMaxOfSliderAndStepper()
        updateUI()
        button.isHidden = true
        
    }
    
    //Step 2 - Instantiating the protocol(using it as a delegate)
    weak var delegate: FontSizeDelegate?
    
    // this function is going to get called on when the didSet gets called, so when this view controller gets loaded currentFrontSize is nil, but when i segue from the other view controller via prepare for segure currentFrontSize will than equal to 20
    
    func minMaxOfSliderAndStepper(){
        fontSlider.minimumValue = 0
        fontSlider.maximumValue = 100
        
        fontStepper.minimumValue = 0
        fontStepper.maximumValue = 100
    }
    func updateUI(){
        guard let validFontSize = currentFontSize else { fatalError("font size is nil")
        }
        
        fontSlider?.value = Float(validFontSize)
        fontStepper?.value = Double(validFontSize) // might need to add a double
        fontUpdatingLabel?.text = ("Current Font Size: \(validFontSize)")
        
    }
    
    // this is where i am configuring
    @IBAction func fontStepperAction(_ sender: UIStepper) {
        //fontSlider.value = Float(sender.value)
        currentFontSize = CGFloat(sender.value) // we are
        
        
    }
    
    @IBAction func fontSliderAction(_ sender: UISlider) {
        //fontStepper.value = Double(sender.value) // might need to add a double
        currentFontSize = CGFloat(sender.value)
    }
    
    
}
