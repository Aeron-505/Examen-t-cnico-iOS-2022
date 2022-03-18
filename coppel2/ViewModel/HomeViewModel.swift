//
//  SignInRequest.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.
//

import Foundation

class HomeViewModel : ObservableObject {
    private let api = "25dca6c6bf7649b1a28b5541b681bbfa"
    @Published var error = ""
    @Published var popularMovie = PopularResponse(page: 0, results: [], total_results: 0, total_pages: 0)
    
    func getPopularMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(api)&language=en-US&page=1")
        if let url = url{
            URLSession.shared.dataTask(with: url){(data,response,err) in
                if let error = err {
                    self.error = error.localizedDescription
                } else if let data = data, let response = response {
                    do {
                        let result = try JSONDecoder().decode(PopularResponse.self, from: data)
                        self.popularMovie = result
                    }catch {
                        print("JSONSerialization error:", error)
                    }
                }
            }.resume()
        }
    }
    
}
