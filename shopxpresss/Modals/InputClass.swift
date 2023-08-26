//
//  InputClass.swift
//  shopxpresss
//
//  Created by mac on 26.08.2023.
//

import Foundation

class InputClass: Identifiable {
    let id = UUID()
    let name: String
    var value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
