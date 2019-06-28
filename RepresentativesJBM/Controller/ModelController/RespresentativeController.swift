//
//  RespresentativeController.swift
//  RepresentativesJBM
//
//  Created by Jason Mandozzi on 6/27/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static let baseURL = URL(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
    
    static func searchRepresentatives(forState state: String, completion: @escaping (([Representative]?) -> Void)) {
        guard let url = baseURL else {completion(nil); return}
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let repSearchQuery = URLQueryItem(name: "state", value: state)
        let jsonQuery = URLQueryItem(name: "output", value: "json")
        components?.queryItems = [repSearchQuery, jsonQuery]
        guard let finalURL = components?.url else {completion(nil); return}
        print(finalURL.absoluteString)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("error getting the data: \(error.localizedDescription)")
                completion(nil); return
            }
            guard let data = data,
                let responseData = String(data: data, encoding: .ascii),
                let fixedData = responseData.data(using: .utf8)
                else {
                    completion(nil)
                    return
            }
            let jsDecoder = JSONDecoder()
            do {
                let decodedData = try jsDecoder.decode([String: [Representative]].self, from: data)
                let repArray = decodedData["results"]
                completion(repArray)
            } catch {
                print("error decoding the data: \(error.localizedDescription)")
            }
        }.resume()
    }
}
