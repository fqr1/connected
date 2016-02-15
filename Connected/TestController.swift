//
//  TestController.swift
//  Connected
//
//  Created by Fabián Quintero Romo on 08/02/16.
//  Copyright © 2016 Fabián Quintero Romo. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    
    var buttons = [UIButton]()
    
    @IBOutlet weak var topView: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillButtons()
        addConstraints()
        
        
//        let button1 = UIButton()
//        button1.translatesAutoresizingMaskIntoConstraints = false
////        button1.setTranslatesAutoresizingMaskIntoConstraints(false)
//        button1.setTitle("Holi", forState: UIControlState.Normal)
//        button1.setTitleColor(UIColor.blackColor(), forState: .Normal)
//
//        
//        self.view.addSubview(button1)
//        
//        
//        let topConstraint = NSLayoutConstraint(item: button1, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
//        let leftConstraint = NSLayoutConstraint(item: button1, attribute: .Leading, relatedBy: .Equal, toItem: self.view, attribute: .LeadingMargin, multiplier: 1, constant: 8)
//        self.view.addConstraint(topConstraint)
//        self.view.addConstraint(leftConstraint)
        

    }
    
    
    func fillButtons(){
        for i in 0..<5 {
            let newButton = UIButton()
            newButton.translatesAutoresizingMaskIntoConstraints = false
            newButton.setTitle("\(i)", forState: .Normal)
            newButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
            if i % 2 == 0{
                newButton.backgroundColor = UIColor.greenColor()
            }
            else{
                newButton.backgroundColor = UIColor.redColor()
            }
            
            buttons.append(newButton)
            self.view.addSubview(newButton)
        }

    }
    
    func addConstraints(){
        var constraints = [NSLayoutConstraint]()
        let button0 = buttons[0]
        let buttonLast = buttons[buttons.count-1]
        
        let leftConstraintForFirstButton = NSLayoutConstraint(item: button0, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 8)
        let topConstraintForFirstButton = NSLayoutConstraint(item: button0, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
        
        let rightConstraintForLastButton = NSLayoutConstraint(item: buttonLast, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: 8)
        let topConstraintForLastButton = NSLayoutConstraint(item: buttonLast, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
        
        constraints.append(leftConstraintForFirstButton)
        constraints.append(topConstraintForFirstButton)
        constraints.append(topConstraintForLastButton)
        constraints.append(rightConstraintForLastButton)
        
        
        
        for i in 1..<buttons.count{
            let leftButton = buttons[i-1]
            let rightButton = buttons[i]
            
            let topConstraintForRightButton = NSLayoutConstraint(item: rightButton, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
            let spacingConstraint = NSLayoutConstraint(item: leftButton, attribute: .Right, relatedBy: .Equal, toItem: rightButton, attribute: .Left, multiplier: 1, constant: 8)
            
            let equalWidthConstraint = NSLayoutConstraint(item: leftButton, attribute: .Width, relatedBy: .Equal, toItem: rightButton, attribute: .Width, multiplier: 1, constant: 0)
            
            constraints.append(topConstraintForRightButton)
            constraints.append(spacingConstraint)
            constraints.append(equalWidthConstraint)
            
        }
        
        self.view.addConstraints(constraints)
    }
    
    
}
