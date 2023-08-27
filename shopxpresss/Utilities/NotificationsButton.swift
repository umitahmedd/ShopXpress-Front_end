//
//  NotificationsButton.swift
//  shopxpresss
//
//  Created by mac on 27.08.2023.
//

import SwiftUI

struct NotificationsButton: View {
   var body: some View {
      Button{
         //action
      }label: {
         Image(systemName: "bell")
            .font(.system(size: 20))
            .foregroundColor(Color(red: 50/255, green: 50/255, blue: 90/255))
      }
   }
}
