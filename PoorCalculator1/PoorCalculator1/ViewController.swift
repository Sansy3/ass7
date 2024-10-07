//
//  ViewController.swift
//  PoorCalculator1
//
//  Created by beqa on 06.10.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var Switch2: UISwitch!
        
    @IBOutlet weak var FirstNumber: UITextField?
    
    @IBOutlet weak var SecondNumber: UITextField?
    
    @IBOutlet weak var Switch: UISwitch!
    
    @IBOutlet weak var ResultLabel: UILabel?
    
    @IBOutlet weak var Label: UILabel?
    
    @IBOutlet weak var Label2: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Switch2.isOn = false
        Switch.isOn = false

        
    }
    
    @IBAction func Darkmode(_ sender: Any) {
        if Switch2.isOn == false 
        {
        view.backgroundColor = UIColor.white
             Label?.textColor = UIColor.black
             Label2?.textColor = UIColor.black

        }
        else
        {
        view.backgroundColor = UIColor.black
            Label?.textColor = UIColor.white
            Label2?.textColor = UIColor.white

        }
    }
    
    
    @IBAction func CalulactionButton(_ sender: UIButton) {
        if let firsttext = FirstNumber?.text,
           
            let secondtext = SecondNumber?.text {
            
            if let FirstNumber = Int(firsttext),
               
                let SecondNumber = Int(secondtext) {

                if SecondNumber == 0 {
                    ResultLabel?.text = "ნულზე გაყოფა არ შეიძლება"
                    return
                }
                if Switch.isOn  {
                    let reminderResult = FirstNumber % SecondNumber
                    ResultLabel?.text = "პასუხია: \(reminderResult)"
                }
                
                else {
                    let normalResult = Double(FirstNumber / SecondNumber)
                    ResultLabel?.text = "პასუხია: \(normalResult)"
                }
            }
            
        }
    }
}
