//
//  SignInRequest.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import Foundation

struct SignInRequest : Codable{
    var username : String
    var password : String
    var request_token : String
}
