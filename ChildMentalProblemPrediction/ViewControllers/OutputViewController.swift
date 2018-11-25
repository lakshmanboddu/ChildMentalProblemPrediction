//
//  OutputViewController.swift
//  ChildMentalProblemPrediction
//
//  Created by Lakshman Babu Boddu on 26/11/18.
//  Copyright © 2018 Lakshman Babu Boddu Lakshman Babu Boddu. All rights reserved.
//

import UIKit

class OutputViewController: UIViewController {

    @IBOutlet weak var btnTakeAgain: UIButton!
    @IBOutlet weak var lblResult: UILabel!
    private var outputFinal : Int64 = Int64.random(in: 0...1)
 //   private let logisticReg = Logistic()
    private let linReg = LogisticFinal()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblResult.text = "\( outputFinal)"
        btnTakeAgain.layer.borderColor = UIColor.white.cgColor
    }
    
    @IBAction func btnPressed(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    public func showOuptput( values: [Double])  {

        let input = LogisticFinalInput(Age: values[0], Family_History: values[1], Under_Medication: values[2], Academic_Performance: values[3], Behavioral_Problem: values[4], Concentration: values[5], Restless: values[6], Seizures: values[7], Learning_Difficulty: values[08], Major_Depressive_Episode: values[9])
        let output = try? linReg.prediction(input: input)
        
    }

   

}
