//
//  SecondViewController.swift
//  Engineers
//
//  Created by Maciej Necki on 26/9/20.
//  Copyright © 2020 MYX Systems. All rights reserved.
//

import NaturalLanguage
import CoreML
import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Styling
        textField.layer.cornerRadius = 7
        
    }
    
    // Functions
    func assessWithML() {
        let userText = textField.text
        
        do { let mlModel = try
            engineersModel(configuration: MLModelConfiguration()).model
            let failurePredictor = try NLModel(mlModel: mlModel)
            let test = failurePredictor.predictedLabel(for: userText!)
            
            print(test)
        } catch {
            // Things went wrong?
        }
    }
    
    // Connections
    @IBOutlet weak var textField: UITextView!
    

    // Actions
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func assessButton(_ sender: UIButton) {
        assessWithML()
    }
    


}

