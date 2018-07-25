//
//  CurrencyField.swift
//  Finn
//
//  Created by t-sawass on 7/24/18.
//  Copyright © 2018 t-sawass. All rights reserved.
//

//Implementation courtesy of: https://stackoverflow.com/questions/29782982/how-to-input-currency-format-on-a-text-field-from-right-to-left-using-swift

import Foundation
import UIKit

extension NumberFormatter {
    convenience init(numberStyle: Style) {
        self.init()
        self.numberStyle = numberStyle
    }
}
extension Formatter {
    static let currency = NumberFormatter(numberStyle: .currency)
}
extension String {
    var digits: [UInt8] { return characters.flatMap{ UInt8(String($0)) } }
    // For Swift 4 or later just remove characters
    // var digits: [UInt8] { return flatMap{ UInt8(String($0)) } }
}
extension Collection where Iterator.Element == UInt8 {
    var string: String { return map(String.init).joined() }
    var decimal: Decimal { return Decimal(string: string) ?? 0 }
}
extension Decimal {
    var number: NSDecimalNumber { return NSDecimalNumber(decimal: self) }
}

class CurrencyField: UITextField {
    var string: String { return text ?? "" }
    var decimal: Decimal {
        return string.digits.decimal /
            Decimal(pow(10, Double(Formatter.currency.maximumFractionDigits)))
    }
    var decimalNumber: NSDecimalNumber { return decimal.number }
    var doubleValue: Double { return decimalNumber.doubleValue }
    var integerValue: Int { return decimalNumber.intValue   }
    let maximum: Decimal = 999_999_999.99
    private var lastValue: String = ""
    override func willMove(toSuperview newSuperview: UIView?) {
        // you can make it a fixed locale currency if if needed
        // Formatter.currency.locale = Locale(identifier: "pt_BR") // or "en_US", "fr_FR", etc
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        keyboardType = .numberPad
        textAlignment = .right
        editingChanged()
    }
    override func deleteBackward() {
        text = string.digits.dropLast().string
        editingChanged()
    }
    @objc func editingChanged() {
        guard decimal <= maximum else {
            text = lastValue
            return
        }
        lastValue = Formatter.currency.string(for: decimal) ?? ""
        text = lastValue
        print("integer:", integerValue)
        print("double:", doubleValue)
        print("decimal:", decimal)
        print("currency:", lastValue)
    }
}
