//
//  FirstViewController.swift
//  Engineers
//
//  Created by Maciej Necki on 26/9/20.
//  Copyright © 2020 MYX Systems. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Initialise data loading and styliing of background elements
        backgroundArea.layer.cornerRadius = 14
        secondBackgroundArea.layer.cornerRadius = 14
        saveButton.layer.cornerRadius = 3
        loadData()
    }
    
    // Connections
    @IBOutlet weak var backgroundArea: UIView!
    @IBOutlet weak var secondBackgroundArea: UIView!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var secondField: UITextField!
    @IBOutlet weak var thirdField: UITextField!
    @IBOutlet weak var fourthField: UITextField!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var dateSelector: UIDatePicker!
    
    @IBOutlet weak var firstSwitch: UISwitch!
    @IBOutlet weak var secondSwitch: UISwitch!
    @IBOutlet weak var thirdSwitch: UISwitch!
    @IBOutlet weak var fourthSwitch: UISwitch!
    @IBOutlet weak var FifthSwitch: UISwitch!
    @IBOutlet weak var saveButton: UIButton!
    
    // Functions
    /// Gather text field data input by patients
    func gatherData() -> String {
        
        var serial = ""
        if firstSwitch.isOn {
            serial = "Your Serial: " + firstField.text! + "\n"
        } else {
            serial = "Your Serial: " + "Secret" + "\n"
        }
        
        var location = ""
        if secondSwitch.isOn {
            location = "Implant Location: " + secondField.text! + "\n"
        } else {
            location = "Implant Location: " + "Secret" + "\n"
        }
        
        var date = ""
        if thirdSwitch.isOn {
            date = "Procedure Date: " + dateSelector.date.description + "\n"
        } else {
            date = "Procedure Date: " + "Secret" + "\n"
        }
        
        var type = ""
        if fourthSwitch.isOn {
            type = "Procedure Type: " + thirdField.text! + "\n"
        } else {
            type = "Procedure Type: " + "Secret" + "\n"
        }
        
        var note = ""
        if FifthSwitch.isOn {
            note = "Notes: " + fourthField.text! + "\n"
        } else {
            note = "Notes: " + "Secret" + "\n"
        }
        
        let text = serial + location + date + type + note
        return text
    }
    
    /// Load text field data into a summary field
    func loadData() {
        summaryLabel.text = gatherData()
    }
    
    // Actions
    @IBAction func fieldEdited(_ sender: Any) {
        loadData()
    }
    @IBAction func bgTapped(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func switchChanged(_ sender: UISwitch) {
        loadData()
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        // do save
    }
    
    
}
