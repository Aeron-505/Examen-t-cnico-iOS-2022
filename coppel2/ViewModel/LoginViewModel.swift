//
//  LoginViewModel.swift
//  coppel2
//  Created by Macbook air Aeron505 on 16/03/22.

import Foundation

class LoginViewModel : ObservableObject {
    @Published var username = ""
    @Published var password = ""
    private let api = "25dca6c6bf7649b1a28b5541b681bbfa"
    @Published var complete = false
    @Published var error = ""
    @Published var loading = false
    
    // MARK: - Validation Functions
    func isUsernameEmpty() -> Bool {
        return username.isEmpty
    }
    
    //MARK: - Login Functions
    func getToken(_ completion: @escaping (Result<(TokenResponse, URLResponse), Error>) -> Void){
        let url = URL(string: "https://api.themoviedb.org/3/authentication/token/new?api_key=\(api)")
        if let url = url{
            URLSession.shared.dataTask(with: url){(data,response,err) in
                if let error = err {
                    completion(.failure(error))
                } else if let data = data, let response = response {
                    do {
                        let result = try JSONDecoder().decode(TokenResponse.self, from: data)
                        completion(.success((result, response)))
                    }catch {
                        print("JSONSerialization error:", error)
                    }
                }
            }.resume()
        }
    }
   
    func SignIn(){
        self.loading = true
        var tokenResponse = TokenResponse(success: false, expires_at: "", request_token: "")
        getToken(){ result in
            do{
                tokenResponse = try result.get().0
            }catch{
                print("objeto vacio")
            }
            guard let url = URL(string: "https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=\(self.api)") else {
                print("Error: cannot create URL")
                return
            }
            let uploadDataModel = SignInRequest(username: self.username, password: self.password, request_token: tokenResponse.request_token)

            guard let jsonData = try? JSONEncoder().encode(uploadDataModel) else {
                print("Error: Trying to convert model to JSON data")
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.httpBody = jsonData
            URLSession.shared.dataTask(with: request) { data, response, error in
                guard error == nil else {
                    self.loading = false
                    print("Error: error calling POST")
                    print(error!)
                    return
                }
                guard let data = data else {
                    self.loading = false
                    print("Error: Did not receive data")
                    return
                }
                guard let response = response as? HTTPURLResponse, (200 ..< 299) ~= response.statusCode else {
                    self.loading = false
                    self.error = "an error occurred while logging in"
                    return
                }
                do {
                    let result = try JSONDecoder().decode(TokenResponse.self, from: data)
                    if result.success{
                        self.loading = false
                        self.complete = true
                        UserDefaults.standard.set(true, forKey: "auth")
                    }
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            }.resume()
        }
    }
}
