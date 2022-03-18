//
//  TokenResponse.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import Foundation

struct TokenResponse : Codable{
    var success : Bool
    var expires_at : String
    var request_token : String
}
