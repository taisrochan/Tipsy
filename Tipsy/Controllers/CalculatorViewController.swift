//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didClickScreen))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    func didClickScreen() {
        view.endEditing(true)
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = Int(sender.value).description
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ResultsViewController") as! ResultsViewController
        
        let doubleValue = (billTextField.text ?? "0,0").doubleValue
        let userInput = Float(doubleValue)
        guard let people = Int(splitNumberLabel.text ?? "0") else {
            return
        }
        
        var resultado: Float
        var percentage: Float
        
        if zeroPctButton.isSelected {
            percentage = 0.0
        } else if tenPctButton.isSelected {
            percentage = 0.1
        } else {
            percentage = 0.2
        }
        resultado = userInput * percentage / Float(people)
        vc.passData(resultado: resultado, people: people, percentage: percentage)
        self.present(vc, animated: true)
    }
 }


