//
//  AuthenticationResponse.swift
//  shopxpresss
//
//  Created by mac on 12.08.2023.
//

import Foundation

class AuthenticationRespose : Decodable{
    var isLogedIn: Bool?
    var newToken: String?
}
