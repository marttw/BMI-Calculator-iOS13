//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Martiniano Villalba on 11/04/2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
  var bmi: BMI?
  
  mutating func calculateBMI(height: Float, weight: Float) {
    let bmiValue = weight / (height * height)
    
    let color = (underweight: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), healthy: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), overweight: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1))
    
    if bmiValue < 18.5 {
      bmi = BMI(value: bmiValue, advice: "Eat more pies!", color: color.underweight)
    } else if bmiValue < 24.9 {
      
      bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: color.healthy)
      
    } else {
      bmi = BMI(value: bmiValue, advice: "Eat less pies!", color: color.overweight)
      
    }
    
  }
  
  func getBMIValue() -> String {
    /* Opción 1
     if bmi != nil {
     return String(format: "%.1f", bmi!)
     } else {
     return "0.0"
     }*/
    /* Opción 2 optional binding
     if let safeBMI = bmi {
     return String(format: "%.1f", safeBMI)
     } else {
     return "0.0"
     }*/
    
    // Using nil coalescing
    
    let bmiToOneDecimalPlace = String(format:"%.1f", bmi?.value ?? 0.0)
    return bmiToOneDecimalPlace
  }
  
  func getAdvice() -> String {
    return bmi?.advice ?? "No advice"
  }
  
  func getColor() -> UIColor {
    return bmi?.color ?? UIColor.white
  }
}


