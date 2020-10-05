//
//  CreateChallengeViewModel.swift
//  Giggle
//
//  Created by Rohit Saini on 01/10/20.
//

import SwiftUI

final class CreateChallengeViewModel:ObservableObject{
    @Published var dropdowns: [ChallengePartViewModel] = [
        .init(type: .exercise),
        .init(type: .startAmount),
        .init(type: .increase),
        .init(type: .lenght)
    ]
    
    enum Action {
        case selectOption(index:Int)
    }
    
    var hasSelectedDropdown: Bool{
        selectedDropdownIndex != nil
    }
    
    var selectedDropdownIndex: Int?{
        dropdowns.enumerated().first(where: {$0.element.isSelected})?.offset
    }
    
    var displayedOptions:[DropDownOption]{
        guard let selectedDropdownIndex = selectedDropdownIndex else {return []}
        return dropdowns[selectedDropdownIndex].options
    }
    
    func send(action: Action){
        switch action {
        case let .selectOption(index):
            guard let selectedDropdownIndex = selectedDropdownIndex else{return}
            clearSelectedOptions()
            dropdowns[selectedDropdownIndex].options[index].isSelected = true
            clearSelectedDropdowns()
        }
    }
    
    func clearSelectedOptions(){
        guard let selectedDropdownIndex = selectedDropdownIndex else{return}
        dropdowns[selectedDropdownIndex].options.indices.forEach { index in
            dropdowns[selectedDropdownIndex].options[index].isSelected = false
        }
    }
    func clearSelectedDropdowns(){
        guard let selectedDropdownIndex = selectedDropdownIndex else{return}
        dropdowns[selectedDropdownIndex].isSelected = false
    }
    
}

extension CreateChallengeViewModel{
    struct ChallengePartViewModel:DropDownItemProtocol{
        var options: [DropDownOption]
        
        var headerTitle: String{
            type.rawValue
        }
        
        var dropDownTitle: String{
            options.first(where: {$0.isSelected})?.formatted ?? ""
        }
        
        var isSelected: Bool = false
        
        private let type: ChallengePartType
        init(type: ChallengePartType){
            switch type {
            case .exercise:
                self.options = ExerciseOption.allCases.map {$0.toDropDownOption}
            case .startAmount:
                self.options = StartOption.allCases.map {$0.toDropDownOption}
            case .increase:
                self.options = IncreaseOption.allCases.map {$0.toDropDownOption}
            case .lenght:
                self.options = LenghtOption.allCases.map {$0.toDropDownOption}
            }
            self.type = type
        }
        
        enum ChallengePartType:String,CaseIterable {
            case exercise = "Exercise"
            case startAmount = "Starting Amount"
            case increase = "Daily Increase"
            case lenght = "Challenge Lenght"
        }
        
        enum ExerciseOption:String,CaseIterable,DropDownOptionProtocol {
            case pullups
            case pushups
            case situps
            var toDropDownOption: DropDownOption{
                .init(type: .text(rawValue), formatted: rawValue.capitalized, isSelected: self == .pullups)
            }
        }
        enum StartOption:Int,CaseIterable,DropDownOptionProtocol {
            case one = 1,two,three,four,five
            var toDropDownOption: DropDownOption{
                .init(type: .number(rawValue), formatted: "\(rawValue)", isSelected: self == .one)
            }
        }
        enum IncreaseOption:Int,CaseIterable,DropDownOptionProtocol {
            case one = 1,two,three,four,five
            var toDropDownOption: DropDownOption{
                .init(type: .number(rawValue), formatted: "+\(rawValue)", isSelected: self == .one)
            }
        }
        enum LenghtOption:Int,CaseIterable,DropDownOptionProtocol {
            case seven = 7,fourteen = 14,twentyOne = 21,twentyEight = 28
            var toDropDownOption: DropDownOption{
                .init(type: .number(rawValue), formatted: "\(rawValue) days", isSelected: self == .seven)
            }
        }
        
    }
}
