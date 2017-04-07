//
//  ViewController.swift
//  Swift Calc
//
//  Created by Joseph Hernandez on 4/5/17.
//  Copyright © 2017 Skgood Inc. All rights reserved. 
//

import UIKit

class ViewController: UIViewController {

    var valueOnScreen:Double = 0
    var prevValue:Double = 0
    var performMath = false
    var mathOperation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        if performMath == true
        {
            label.text = String(sender.tag-1)
            valueOnScreen = Double(label.text!)!
            performMath = false
        }
        else
        {
            label.text = label.text! + String(sender.tag-1)
            valueOnScreen = Double(label.text!)!
        }
        
    }

    
    @IBOutlet var label: UILabel!
    
    
    
    @IBAction func mathFunctions(_ sender: UIButton)
    {
        
        //if tag isnt clear or equals button
        //user pushed a math funtion
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            
            prevValue = Double(label.text!)!
            
            //divide function
            if sender.tag == 12
            {
                label.text = "/"
            }
            //multiply function
            else if sender.tag == 13
            {
                label.text = "x"
            }
            // minus function
            else if sender.tag == 14
            {
                label.text = "-"
            }
            //addition function
            else if sender.tag == 15
            {
                label.text = "+"
            }
            
            mathOperation = sender.tag
            performMath = true

        }
        // if user pushes equal sign
        else if sender.tag == 16
        {
            //divide function
            if mathOperation == 12
            {
                label.text = String(prevValue / valueOnScreen)
            }
                //multiply function
            else if mathOperation == 13
            {
               label.text = String(prevValue * valueOnScreen)
            }
                // minus function
            else if mathOperation == 14
            {
               label.text = String(prevValue - valueOnScreen)
            }
                //addition function
            else if mathOperation == 15
            {
                label.text = String(prevValue + valueOnScreen)
            }

        }
        //clear
        else if sender.tag == 11
        {
            label.text = ""
            prevValue = 0
            valueOnScreen = 0
            mathOperation = 0
        }
    }
    
    
}

