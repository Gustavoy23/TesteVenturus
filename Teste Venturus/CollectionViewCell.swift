//
//  CollectionViewCell.swift
//  Teste Venturus
//
//  Created by Gustavo on 11/12/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imagem: UIImageView!

    
    func configure(with imgur: Imgur) {
    
         imgur.image { (image) in
            self.imagem.image = image
        }
    }
    
    override func prepareForReuse() {
        imagem.image = nil
    }
}
