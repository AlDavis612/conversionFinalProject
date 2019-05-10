//
//  ConverterViewController.swift
//  Calculator
//
//  Created by Alex Davis on 4/12/19.
//  Copyright © 2019 Alex Davis. All rights reserved.
//

import UIKit

class ConverterViewController: UIViewController {
    
    
    
    @IBAction func numbers(_ sender: UIButton) {
        numConverted += String(sender.tag-1)
        updateInputField()
    }
    var numConverted: String = ""
    var isNegative = false
    var decimal = false
    
    @IBOutlet weak var inputDisplay: UITextField!
    @IBOutlet weak var outputDisplay: UITextField!
    
   /*@IBAction func buttons(_ sender: UIButton) {
        
    }*/
    
    
    var inputValue: String = ""
    var outputValue: String = ""
    
    var conversions = [conversion(label: ConverterType.fToC, input: "°F", output: "°C"),
                       conversion(label: ConverterType.cToF, input: "°C", output: "°F"),
                       conversion(label: ConverterType.miToKm, input: "mi", output: "km"),
                       conversion(label: ConverterType.kmToMi, input: "km", output: "mi")]
    
    var currentConversion: conversion = conversion(label: ConverterType.fToC, input: "°F", output: "°C")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputValue = ""
        outputValue = ""
        inputDisplay.text = conversions[0].input
        outputDisplay.text = conversions[0].output
        currentConversion = conversions[0]
        // Do any additional setup after loading the view.
    }
    

    @IBAction func converterButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Converter", message: "", preferredStyle: UIAlertController.Style.actionSheet)
        for convType in conversions {
            alert.addAction(UIAlertAction(title: convType.label.rawValue, style: UIAlertAction.Style.default, handler: { (alertAction) in
                self.inputDisplay.text = convType.input
                self.outputDisplay.text = convType.output
                self.currentConversion = convType
            }))
    }
        self.present(alert, animated:true, completion: nil)
    }
    
    func convert() {
        guard let input = Double(numConverted) else {
            return
        }
        var output:Double? = nil
        
        switch currentConversion.label {
        case .fToC:
            output = (input - 32) * 5/9
        case .cToF:
            output = (input * 9/5) + 32
        case .miToKm:
            output = (input / 0.62137)
        case .kmToMi:
            output = (input * 0.62137)
        }
        
        outputDisplay.text = String(format: "%.2f", output!) + " " + currentConversion.output
    }
    
    func updateInputField() {
        inputDisplay.text = numConverted + " " + currentConversion.input
        convert()
    }
    
    @IBAction func addDecimal(_ sender: UIButton) {
        if decimal{
            return
        }
        numConverted += "."
        decimal = true
        updateInputField()
    }
    
    @IBAction func addPlusMinus(_ sender: UIButton) {
        if !numConverted.isEmpty {
            if !isNegative {
                isNegative = true
                numConverted = "-" + numConverted
            }else {
                isNegative = false
                numConverted.remove(at: numConverted.startIndex)
            }
            updateInputField()
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        outputDisplay.text = currentConversion.output
        numConverted = ""
        updateInputField()
    }
    
}

