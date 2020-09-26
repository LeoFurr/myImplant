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
        assesButton.layer.cornerRadius = 3
        
    }
    
    // Functions
    func assessWithML() -> String {
        let userText = textField.text
        
        do { let mlModel = try
            engineersModel(configuration: MLModelConfiguration()).model
            let failurePredictor = try NLModel(mlModel: mlModel)
            let predictionLabel = failurePredictor.predictedLabel(for: userText!)
            
            return predictionLabel!
            
        } catch {
            // Things went wrong?
            return ""
        }

    }
    
    // Connections
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var predictionLabel: UILabel!
    @IBOutlet weak var assesButton: UIButton!
    // Actions
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func assessButton(_ sender: UIButton) {
        
        if assessWithML() == "failure" {
            predictionLabel.text = "You may have a hip failure. Consult your doctor."
        } else {
            predictionLabel.text = "We don't think you have a hip implant failure. Consult your doctor if symptoms persist."
        }
        

    }
    
    

}

