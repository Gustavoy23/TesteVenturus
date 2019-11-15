//
//  ViewController.swift
//  Teste Venturus
//
//  Created by Gustavo on 11/11/19.
//  Copyright © 2019 Gustavo Sousa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Definindo objetos,variaveis e propiedades
    private let reuseIdentifier = "Cell"
    private let sectionInsets = UIEdgeInsets(top: 10.0, left: 20.0, bottom: 10.0, right: 20.0)
    private let itemsPerRow: CGFloat = 3
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var imgurs = [Imgur]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Inicilaizar Dados JSON e depois atualizar UICollection
        
        network.shared.getImgurs { (response) in
        self.imgurs = response.imgurs
        self.collectionView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        imageCache.removeAllObjects()
    }

}

extension ViewController:UICollectionViewDataSource {
    
    // Função quantidade de seçoes
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    //Contagem de items do JSON
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgurs.count
    }
    
    //Atualização dos dados do UICollection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: imgurs[indexPath.item])
        return cell
    }
    
   //Botao Atualizar
    @IBAction func atualizar(_ sender: Any) {
        self.collectionView.reloadData()
        
    }
}
    extension ViewController : UICollectionViewDelegateFlowLayout {
        //1
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            //2
            let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
            let availableWidth = view.frame.width - paddingSpace
            let widthPerItem = availableWidth / itemsPerRow
            
            let thisTag = imgurs[indexPath.row];
            
            //Condicao para carregar somente links com figuras extensão JPG
            
            if (thisTag.type != "image/jpeg"){
                return CGSize(width: 0, height: 0)
            }else{
                return CGSize(width: widthPerItem, height: widthPerItem)
            }
        }
        
    
       /* func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            return sectionInsets
        }*/
        
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return sectionInsets.left
        }
    }
    



