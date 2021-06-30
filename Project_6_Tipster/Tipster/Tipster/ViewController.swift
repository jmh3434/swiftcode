//
//  ViewController.swift
//  Tipster
//
//  Created by James Hunt on 6/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    var tipValueMid = Int()
    var tipValueMin = Int()
    var tipValueMax = Int()
    
    var currentTipValue = Int()
    
    
    @IBOutlet var tipPercentageLabels: [UILabel]!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var priceAmountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        currentTipValue = 9
        
        updateValues(value: currentTipValue)
        priceAmountLabel.text = ""
    }
    @IBAction func numberPressed(_ sender: UIButton){
        
        if let value = sender.titleLabel?.text {
            priceAmountLabel.text?.append(value)
        }
        updateValues(value: currentTipValue)
    
    }
    @IBAction func clear(_ sender: Any) {
        priceAmountLabel.text = ""
    }
    
    @IBAction func tipChanged(_ sender: UISlider){
        
        currentTipValue = Int(sender.value)
        print(currentTipValue)
        print(sender.value)
        updateValues(value: currentTipValue)
    }
    
    @IBAction func groupSizeChanged(_ sender: UISlider) {
        
        let groupSize = Int(sender.value)
        
        groupSizeLabel.text = "Group Size: \(groupSize)"
        
        
        if groupSize > 5 {
            updateValues(value: 22)
            tipSlider.value = 22
        }
        
        
            
            
           
        
    }
    func updateValues(value:Int){
        tipValueMid = value
        tipValueMin = tipValueMid - 5
        tipValueMax = tipValueMid + 5
        
        tipPercentageLabels[0].text = "\(tipValueMin)%"
        tipPercentageLabels[1].text = "\(tipValueMid)%"
        tipPercentageLabels[2].text = "\(tipValueMax)%"
    
        
        if let priceText = priceAmountLabel.text {
            
            if let price = Double(priceText){
                
                let minTip = price*(Double(tipValueMin)*(0.01))
                let midTip = price*(Double(tipValueMid)*(0.01))
                let maxTip = price*(Double(tipValueMax)*(0.01))
                let totalMin = minTip+price
                let totalMid = midTip+price
                let totalMax = maxTip+price
                
                tipPercentageLabels[3].text = "$\(minTip.rounded(toPlaces: 2))"
                tipPercentageLabels[4].text = "$\(midTip.rounded(toPlaces: 2))"
                tipPercentageLabels[5].text = "$\(maxTip.rounded(toPlaces: 2))"
                
                tipPercentageLabels[6].text = "$\(totalMin.rounded(toPlaces: 2))"
                tipPercentageLabels[7].text = "$\(totalMid.rounded(toPlaces: 2))"
                tipPercentageLabels[8].text = "$\(totalMax.rounded(toPlaces: 2))"
            }
        }
    }
    
}

extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
