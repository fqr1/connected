//
//  test2Controller.swift
//  Connected
//
//  Created by Fabián Quintero Romo on 09/02/16.
//  Copyright © 2016 Fabián Quintero Romo. All rights reserved.
//

/*
    fill buttons, create
    fill constraints
        - fill a row, passing by the top vector



*/

import UIKit

class test2Controller: UIViewController {

    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    
    var buttons = [[UIButton]]()
    var itemsForConstraints = [[AnyObject]]()
    
    let size = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fillButtons()
        fillItemsForConstraint()
        fillConstraints()
        fillEventsForButtons()
    }
    
    func fillButtons(){
        for i in 0..<size{
            buttons.append([UIButton]())
            for j in 0..<size{
                let newButton = UIButton()
                newButton.translatesAutoresizingMaskIntoConstraints = false
                newButton.setTitle("[\(i),\(j)]", forState: .Normal)
                newButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
                newButton.tag = (i*10) + j
                if j % 2 == 0{
                    newButton.backgroundColor = UIColor.greenColor()
                }
                else{
                    newButton.backgroundColor = UIColor.redColor()
                }
                
                buttons[i].append(newButton)
                self.view.addSubview(newButton)
            }
        }
    }
    
    func fillItemsForConstraint(){
        let newSize = buttons.count+2
        
        for i in 0..<newSize{
            itemsForConstraints.append([AnyObject]())
            itemsForConstraints[i].append(self.view)
        }
        
        for _ in 1..<newSize{
            itemsForConstraints[0].append(self.topView)
            itemsForConstraints[newSize-1].append(self.bottomView)
        }
        
        for i in 0 ..< buttons.count{
            for j in 0 ..< buttons.count{
                itemsForConstraints[i+1].append(buttons[i][j])
            }
            itemsForConstraints[i+1].append(self.view)
        }
       
      
    }
    
    func fillConstraints(){
        let newSize = itemsForConstraints.count;
        for i in 1 ..< newSize-1{
            self.view.addConstraint(NSLayoutConstraint(item: itemsForConstraints[i][0], attribute: .LeadingMargin, relatedBy: .Equal, toItem: itemsForConstraints[i][1], attribute: .LeadingMargin, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: itemsForConstraints[i][newSize-2], attribute: .TrailingMargin, relatedBy: .Equal, toItem: itemsForConstraints[i][newSize-1], attribute: .TrailingMargin, multiplier: 1, constant: 0))
            self.view.addConstraint(NSLayoutConstraint(item: itemsForConstraints[newSize-1][i], attribute: .Top, relatedBy: .Equal, toItem: itemsForConstraints[newSize-2][i], attribute: .Bottom, multiplier: 1, constant: 0))
        }
        
        for i in 1 ..< itemsForConstraints.count-1{
            for j in 1 ..< itemsForConstraints[i].count-1{
                
                topConstraint(bottomView: itemsForConstraints[i][j], topView: itemsForConstraints[i-1][j])
                
                if j > 1{
                    equalConstraint(view1: itemsForConstraints[i][j-1], view2: itemsForConstraints[i][j])
                    spacingConstraint(leftVIew: itemsForConstraints[i][j-1], rightView: itemsForConstraints[i][j])
                }
                if i > 1 {
                    equalConstraint(view1: itemsForConstraints[i-1][j], view2: itemsForConstraints[i][j])
                }
            }
        }
    }
    
    /*
    func fillConstraintsOld(){
        
        constraintsForTopRow(buttons[0])
        
        for i in 0..<size{
            
            //one row
            var constraints = [NSLayoutConstraint]()
            let button0 = buttons[i][0]
            let buttonLast = buttons[i][buttons.count-1]
            
            let leftConstraintForFirstButton = NSLayoutConstraint(item: button0, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 8)
            let topConstraintForFirstButton = NSLayoutConstraint(item: button0, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
            
            let rightConstraintForLastButton = NSLayoutConstraint(item: buttonLast, attribute: .TrailingMargin, relatedBy: .Equal, toItem: self.view, attribute: .TrailingMargin, multiplier: 1, constant: 0)
            let topConstraintForLastButton = NSLayoutConstraint(item: buttonLast, attribute: .Top, relatedBy: .Equal, toItem: self.topView, attribute: .Bottom, multiplier: 1, constant: 8)
            
            constraints.append(leftConstraintForFirstButton)
            constraints.append(topConstraintForFirstButton)
            constraints.append(topConstraintForLastButton)
            constraints.append(rightConstraintForLastButton)
            
            
            
            for j in 1..<buttons[i].count{
                let leftButton = buttons[i][j-1]
                let rightButton = buttons[i][j]
                
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
*/
    /*
    func spacingConstraints(ForView view:UIView,andButton button:UIButton){}
    func spacingConstraints(ForButton button1:UIView,andButton button2:UIButton){}
    func spacingConstraints(ForButton button:UIView,andView view:UIButton){}
    */
    func spacingConstraint(leftVIew leftView:AnyObject,rightView:AnyObject){
        let spacingConstraint = NSLayoutConstraint(item: leftView, attribute: .Right, relatedBy: .Equal, toItem: rightView, attribute: .Left, multiplier: 1, constant: 0)
        self.view.addConstraint(spacingConstraint)
    }
    
    func equalConstraint(view1 view1:AnyObject,view2:AnyObject){
        let equalWidthConstraint = NSLayoutConstraint(item: view1, attribute: .Width, relatedBy: .Equal, toItem: view2, attribute: .Width, multiplier: 1, constant: 0)
        let equalHeightConstraint = NSLayoutConstraint(item: view1, attribute: .Height, relatedBy: .Equal, toItem: view2, attribute: .Height, multiplier: 1, constant: 0)
        self.view.addConstraints([equalHeightConstraint,equalWidthConstraint])
    }
    
    func topConstraint(bottomView bottomView:AnyObject, topView: AnyObject){
        let topConstraint = NSLayoutConstraint(item: bottomView, attribute: .Top, relatedBy: .Equal, toItem: topView, attribute: .Bottom, multiplier: 1, constant: 0)
        self.view.addConstraint(topConstraint)
    }
    
    /*
    func constraintsForTopRow(row:[UIButton]){
       
        for i in 1..<row.count{
            print("for \(i)")
            spacingConstraint(row[i-1] as! UIView, rightView: row[i] as! UIView)
            
            
            if i<row.count-2{
                equalConstraint(row[i] as! UIView, view2: row[i+1] as! UIView)
                topConstraint(row[i] as! UIView, topView: self.topView)
            }
        }
        
    }
*/
    
    /*
    func constraintsForTopRow(row:[UIButton]){
        var views = row.map{NSKeyedUnarchiver.unarchiveObjectWithData(NSKeyedArchiver.archivedDataWithRootObject($0))}
        views.insert(self.view, atIndex: 0)
        views.insert(self.view, atIndex: views.count)
        for i in 1..<views.count{
            print("for \(i)")
            spacingConstraint(views[i-1] as! UIView, rightView: views[i] as! UIView)
            
            
            if i<views.count-2{
                equalConstraint(views[i] as! UIView, view2: views[i+1] as! UIView)
                topConstraint(views[i] as! UIView, topView: self.topView)
            }
        }
        
    }
    */
    
    func fillEventsForButtons(){
        for i in 0 ..< buttons.count{
            for j in 0 ..< buttons[i].count{
                setEventForButton(buttons[i][j])
            }
        }
    }
    
    func setEventForButton(b1: UIButton){
        addSwipe(b1)
    }
    
    func addSwipe(button:UIButton) {
        let directions: [UISwipeGestureRecognizerDirection] = [.Right, .Left, .Up, .Down]
        for direction in directions {
            let gesture = UISwipeGestureRecognizer(target: self, action: Selector("handleSwipe:"))
            gesture.direction = direction
            button.addGestureRecognizer(gesture)
        }
    }
    
    func handleSwipe(swipeGesture: UISwipeGestureRecognizer) {
        
        
        if let button = swipeGesture.view as? UIButton{
            print("TAG: \(button.tag)")
            print("[\(button.tag.getI()),\(button.tag.getJ())]")
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.Right:
                print("Swiped right")
            case UISwipeGestureRecognizerDirection.Down:
                print("Swiped down")
            case UISwipeGestureRecognizerDirection.Left:
                print("Swiped left")
            case UISwipeGestureRecognizerDirection.Up:
                print("Swiped up")
            default:
                break
            }
        }
    }
}

extension Int{
    func getI()->Int{
        return self / 10
    }
    
    func getJ()->Int{
        return self % 10
    }
}





























