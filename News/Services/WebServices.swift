//
//  WebServices.swift
//  News
//
//  Created by Livia Carvalho Keller on 12/10/22.
//

import Foundation

class WebServices {
    
    func getArticles(url: URL, completion: @escaping ([Any]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                print(data)
            }
        }.resume()
    }
    
}
