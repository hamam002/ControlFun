//
//  ViewController.swift
//  ControlFun
//
//  Created by Evan Hamamoto on 6/30/15.
//  Copyright (c) 2015 Evan Hamamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var nameField: UITextField!
    
    @IBOutlet var numberField: UITextField!
    
    @IBOutlet var sliderLabel: UILabel!
    
    @IBOutlet var leftSwitch: UISwitch!
    
    @IBOutlet var rightSwitch: UISwitch!
    
    @IBOutlet var doSomethingButton: UIButton!
    
    @IBAction func textFieldDoneEditing(sender: UITextField){
        sender.resignFirstResponder()
    }
    
    @IBAction func backgroundTap(sender: UIControl){
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        let progress = lroundf(sender.value)
        sliderLabel.text = "\(progress)"
    }
    
    @IBAction func toggleControl(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomethingButton.hidden = true
        }
        
        else{
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomethingButton.hidden = false
        }
    }
    
    @IBAction func switchChange(sender: UISwitch) {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let controller = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .ActionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style: .Destructive, handler: { action in let msg = self.nameField.text.isEmpty
            ? "You can breathe easy, everything went ok."
            : "You can breathe easy, \(self.nameField.text),"
             + " everything went okay."
            let controller2 = UIAlertController(title: "Something Was Done", message: msg, preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.presentViewController(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No Way!", style: .Cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController{
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }
}

