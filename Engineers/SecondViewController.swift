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
        // Do any additional setup after loading the view.
        do { let mlModel = try engineersModel(configuration: MLModelConfiguration()).model
            
            let sentimentPredictor = try NLModel(mlModel: mlModel)
            
            let test = sentimentPredictor.predictedLabel(for: "my back hurts")
            
            print(test)
            
        } catch {
        }
    
        
    }


    


}

