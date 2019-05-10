//
//  conversion.swift
//  Calculator
//
//  Created by Alex Davis on 4/12/19.
//  Copyright © 2019 Alex Davis. All rights reserved.
//

import Foundation

struct conversion {
    let label: ConverterType
    let input: String
    let output: String
    
   /* init(label: String, input: String, output: String) {
        self.label = label
        self.input = input
        self.output = output
}*/
}

enum ConverterType: String {
    case cToF = "celsius to fahrenheit"
    case fToC = "fahrenheit to celsius"
    case kmToMi = "kilometers to miles"
    case miToKm = "miles to kilometers"
}
