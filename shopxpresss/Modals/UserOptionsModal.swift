//
//  UserOptionsModal.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import Foundation
import SwiftUI

class UserOptionsModal: Identifiable {
    var id = UUID()
    var option_image: String
    var option_name: String
    var page: AnyView
    
    init<V: PageView>(option_image: String, option_name: String, page: V) {
        self.option_image = option_image
        self.option_name = option_name
        self.page = AnyView(page)
    }
}
