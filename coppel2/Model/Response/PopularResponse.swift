//
//  PopularResponse.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import Foundation

struct PopularResponse : Codable {
    var page : Int
    var results : [MovieResponse]
    var total_results : Int
    var total_pages : Int
}
