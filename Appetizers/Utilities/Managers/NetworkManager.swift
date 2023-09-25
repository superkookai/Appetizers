//
//  NetworkManager.swift
//  Appetizers
//
//  Created by Weerawut Chaiyasomboon on 24/9/2566 BE.
//

import UIKit

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){ }
    
    private let cache = NSCache<NSString, UIImage>()
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error{
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(AppetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            }catch{
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void ) {
            
            //Found in cache, then return image
            let cacheKey = NSString(string: urlString)
            if let image = cache.object(forKey: cacheKey) {
                completed(image)
                return
            }
            
            //No in cache, download the image
            guard let url = URL(string: urlString) else {
                completed(nil)
                return
            }
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
                
                guard let data, let image = UIImage(data: data) else {
                    completed(nil)
                    return
                }
                
                //set image in cache
                self.cache.setObject(image, forKey: cacheKey)
                completed(image)
            }
            
            task.resume()
        }
    
}
