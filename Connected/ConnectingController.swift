//
//  ConnectingController.swift
//  Connected
//
//  Created by Fabián Quintero Romo on 23/01/16.
//  Copyright © 2016 Fabián Quintero Romo. All rights reserved.
//

import UIKit

class ConnectingController: UIViewController {

    @IBOutlet weak var b11: UIButton!
    @IBOutlet weak var b12: UIButton!
    @IBOutlet weak var b13: UIButton!
    @IBOutlet weak var b14: UIButton!
    
    @IBOutlet weak var b21: UIButton!
    @IBOutlet weak var b22: UIButton!
    @IBOutlet weak var b23: UIButton!
    @IBOutlet weak var b24: UIButton!
    
    @IBOutlet weak var b31: UIButton!
    @IBOutlet weak var b32: UIButton!
    @IBOutlet weak var b33: UIButton!
    @IBOutlet weak var b34: UIButton!
    
    @IBOutlet weak var b41: UIButton!
    @IBOutlet weak var b42: UIButton!
    @IBOutlet weak var b43: UIButton!
    @IBOutlet weak var b44: UIButton!
    
    
    var buttons = [[UIButton]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var path1 = [Node]()
        
        path1.append(Node(x: 0, y: 0, value: 1))
        path1.append(Node(x: 1, y: 1, value: 3))
        path1.append(Node(x: 2, y: 2, value: 2))
        path1.append(Node(x: 3, y: 2, value: 1))
        path1.append(Node(x: 2, y: 1, value: 3))
        path1.append(Node(x: 3, y: 3, value: 4))
        
        
        buttons = [[b11,b12,b13,b14],[b21,b22,b23,b24],[b31,b32,b33,b34],[b41,b42,b43,b44]]
        
       
        
        for button in buttons{
            for button1 in button{
                button1.setTitle("", forState: UIControlState.Normal)
            }
        }
        
        for node in path1{
            buttons[node.y][node.x].setTitle("\(node.value)", forState: UIControlState.Normal)
        }
        
        //init buttons
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


class Node{
    let x:Int
    let y:Int
    var count:Int
    let value:Int
    
    init(x:Int,y:Int,value:Int){
        self.x = x
        self.y = y
        self.value = value
        self.count = 0
    }
}
