//
//  RoundedToTwoDecimalPlaces.swift
//  shopxpresss
//
//  Created by mac on 25.08.2023.
//

import Foundation

extension Decimal {
    var roundedToTwoDecimalPlaces: Decimal {
        var roundedValue = self
        var originalValue = self
        let handler = NSDecimalNumberHandler(roundingMode: .plain, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false)
        NSDecimalRound(&roundedValue, &originalValue, 2, handler.roundingMode())
        return roundedValue
    }
}


