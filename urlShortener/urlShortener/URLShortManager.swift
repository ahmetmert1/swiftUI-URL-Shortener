//
//  URLShortManager.swift
//  urlShortener
//
//  Created by Ahmet Mert ÖZ on 25.07.2022.
//

import Foundation

struct URLShort: Codable {
    var data: URLData
    var code: Int
    var errors: [String?]
}

struct URLData: Codable {
    var domain, alias: String
    var tinyURL: String?
    var url: String
}

@MainActor class URLShortManager : ObservableObject {
    
    private let API_KEY: String = "PJkItAYvNFEETJt0r2KAB2Ob4mzu61pPg5gfFTOsToxb8zcIExuNfhgAJDUK"
    
    @Published var resultURL =  ""
    @Published var inputURL = "https://www.youtube.com/watch?v=gE0HBMk3t0A"
    
    func getData(){
        
        
        guard let url = URL(string: "https://api.tinyurl.com/create?url=\(inputURL)&api_token=\(API_KEY	)")else {
            print("Invalid URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard let data = data else {
                print("Could not retrieve data...")
                
                DispatchQueue.main.async {
                    self.resultURL = "Could not retrieve data...."
                }
                
                return
            }
            
            do{
                let shortenedURL = try JSONDecoder().decode(URLShort.self, from: data)
                
                DispatchQueue.main.async {
                    print(shortenedURL)
                    
                    self.resultURL = "https://tinyurl.com" + shortenedURL.data.alias
                }
                
            }catch{
                DispatchQueue.main.async {
                    print("\(error)")
                    self.resultURL = "Please enter a valid URL..."
                }
            }
            
           
            
        }.resume()
        
        
    }
    
}
