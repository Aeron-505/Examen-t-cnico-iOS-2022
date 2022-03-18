//
//  MovieResponse.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import Foundation

struct MovieResponse : Codable,Identifiable{
    var poster_path : String
    var adult : Bool
    var overview : String
    var release_date : String
    var genre_ids : [Int]
    var id : Int
    var original_title : String
    var original_language : String
    var title : String
    var backdrop_path : String
    var popularity : Double
    var vote_count : Int
    var video : Bool
    var vote_average :Double
}


