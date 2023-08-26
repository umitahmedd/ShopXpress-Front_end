//
//  CloseKeyborard.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import UIKit
import SwiftUI

extension UIApplication {
   func closeKeyboard() {
      sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
   }
}
