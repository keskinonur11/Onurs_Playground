//
//  DataService.swift
//  Playground
//
//  Created by Onur Keskin on 16.12.2019.
//  Copyright © 2019 Onur Keskin. All rights reserved.
//

import Foundation

class DataService {
    static let shared = DataService()
    fileprivate let baseURLString = "https://api.github.com"
    fileprivate let baseURLScheme = "https"
    fileprivate let baseURLHost = "api.github.com"
    
    private init() {}
    
    func fetchGists(completion: @escaping (Result<[GistModel], Error>) -> Void) {
        //        ways to create desired url
        //        var gistURL = URL(string: baseURLString)
        //        gistURL?.appendPathComponent("/bla")
        //        let composedGistURL = URL(string: "/bla", relativeTo: gistURL)
        
        let requestURL = createURL(scheme: baseURLScheme, host: baseURLHost, path: "/gists/public")  //generalized the method for simplicity
        
        guard let validURL = requestURL.url else {
            print("URL failed for fetch gist")
            return
        }
        
        URLSession.shared.dataTask(with: validURL) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode) for path \(validURL.absoluteString)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                //                let json = try JSONSerialization.jsonObject(with: validData, options: [])
                let gists = try JSONDecoder().decode([GistModel].self, from: validData)
                completion(.success(gists))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
        }.resume()
    }
    
    func creteNewGist(newGist: Gist, completion: @escaping (Result<Any, Error>) -> Void) {
        let requestURL = createURL(scheme: baseURLScheme, host: baseURLHost, path: "/gists")
        
        guard let postURL = requestURL.url else {
            print("URL failed for create gist")
            return
        }
        
        var postRequest = URLRequest(url: postURL)
        postRequest.httpMethod = "POST"
        
        //Basic auth
        let authString = "keskin.onur11@gmail.com:5122482-onuRR"
        var authStringBase64 = ""
        
        if let authData = authString.data(using: .utf8) {
            authStringBase64 = authData.base64EncodedString()
        }
        
        postRequest.setValue("Basic \(authStringBase64)", forHTTPHeaderField: "Authorization")
        postRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        postRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let gistData = try JSONEncoder().encode(newGist)
            postRequest.httpBody = gistData
        } catch {
            print("Json encode for create gist")
        }
        
        URLSession.shared.dataTask(with: postRequest) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode) for path \(postURL.absoluteString)")
            }
            
            guard let validData = data, error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let responseJson = try JSONSerialization.jsonObject(with: validData)
                completion(.success(responseJson))
            } catch let serializationError {
                completion(.failure(serializationError))
            }
            
            
        }.resume()
    }
    
    func createURL(scheme: String, host: String, path: String) -> URLComponents {
        var componentURL = URLComponents()
        componentURL.scheme = scheme
        componentURL.host = host
        componentURL.path = path
        return componentURL
    }
}
