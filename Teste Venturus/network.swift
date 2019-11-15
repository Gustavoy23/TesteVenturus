//
//  network.swift
//  Teste Venturus
//
//  Created by Gustavo on 11/12/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit

typealias JSON = [String: Any]

class network {
    static let shared=network()
    private init(){};
    let session = URLSession.shared

    enum MyError: Error {
        case someError
        
    }

    struct GetImgursResponse {
        
        let imgurs: [Imgur]
        
        init(json: JSON) throws {
            guard let data = json["data"] as? [JSON] else { throw
                MyError.someError
            }
            
            let imgurs = data.map{ Imgur(json: $0) }.compactMap{ $0 }
            self.imgurs = imgurs
            print(imgurs)
        }
    }
    
    
    func getImgurs(success successBlock: @escaping (GetImgursResponse) -> Void) {
        guard let url = URL(string: "https://api.imgur.com/3/gallery/r/cats") else { return }
        var request = URLRequest(url: url)
        request.addValue("Client-ID 1ceddedc03a5d71", forHTTPHeaderField: "authorization")
        
        session.dataTask(with: request) { (data, _, _) in
            guard let data = data else { return }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? JSON else { return }
                
                
                print(json)
                let getImgursResponse = try GetImgursResponse(json: json)
                DispatchQueue.main.async {
                    successBlock(getImgursResponse)
                }
            } catch {}
            }.resume()
    }
    
    func downloadImage(fromLink link: String, success successBlock: @escaping (UIImage) -> Void) {
        guard let url = URL(string: link) else { return }
        session.dataTask(with: url) { (data, _, _) in
            guard let data = data,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async {
                successBlock(image)
            }
            }.resume()
    }
    
}
