//
//  DropDownItemProtocol.swift
//  Giggle
//
//  Created by Rohit Saini on 04/10/20.
//

import SwiftUI

protocol DropDownItemProtocol {
    var options: [DropDownOption] {get}
    var headerTitle: String {get}
    var dropDownTitle: String {get}
    var isSelected: Bool {get set}
}


protocol DropDownOptionProtocol {
    var toDropDownOption: DropDownOption {get}
}
struct DropDownOption {
    enum DropDownOptionType {
        case text(String)
        case number(Int)
    }
    var type: DropDownOptionType
    var formatted: String
    var isSelected: Bool
}
