//
//  imgur.swift
//  Teste Venturus
//
//  Created by Gustavo on 11/14/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit

struct Imgur {
    
    private let id:String
    let link:String
   // let title:String
    let type:String
    
    init?(json: JSON){
        guard let id=json["id"] as? String,
        let link=json["link"] as? String,
       // let title=json["title"] as? String
        let type=json["type"] as? String
        else{return nil}
    
    
    self.id=id
    self.link=link
    //self.title=title
    self.type=type
    }
    
    func image(completion: @escaping (UIImage) -> Void) {
        if let image = imageCache.image(forKey: id) {
            completion(image)
        } else {
            network.shared.downloadImage(fromLink: link)
            { (image) in
                imageCache.add(image, forKey: self.id)
                completion(image)
            }
        }
    }
    
}


