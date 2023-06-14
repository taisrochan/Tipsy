//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Tais Rocha Nogueira on 05/06/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var resultado: Float = 0
    var people = 0
    var percentage: Float = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", resultado)
        settingsLabel.text = "Split between \(people) people, with \(percentage)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func passData(resultado: Float, people: Int, percentage: Float) {
        self.resultado = resultado
        self.people = people
        self.percentage = percentage
    }
}

extension String {
    static let numberFormatter = NumberFormatter()
    
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result =  String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
        
}


