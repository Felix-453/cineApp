//
//  ViewController.swift
//  cinepolito
//
//  Created by IMAC17 on 24/04/23.
//

import UIKit
import Foundation //para calculara el tamaño de la pantalla

class ViewController: UIViewController {

    let images: [String] = ["increibles","deadpool","at-man"]
    var miWidthScreen = UIScreen.main.bounds.width
    var i = 0
    var iActual = 0
    
    var timer = Timer()
    
    @IBOutlet weak var MyCollectionView: UICollectionView!
    
    @IBOutlet weak var CollectionView2: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MyCollectionView.dataSource = self
        MyCollectionView.delegate = self
        MyCollectionView.register(UINib(nibName: "MyCustom", bundle: nil), forCellWithReuseIdentifier: "myCelda")
        CollectionView2.register(UINib(nibName: "PeliculasPrueba", bundle: nil), forCellWithReuseIdentifier: "nuevaCelda")
        timer = Timer.scheduledTimer(timeInterval: 1.0,//cada cuando se va a ejecutar
                                     target: self, selector: #selector(timeAction), userInfo: nil, repeats: true)
    }
    
    @objc func timeAction(){
        iActual = MyCollectionView.indexPathsForVisibleItems[0].row+1
       
        if iActual >= images.count{
            iActual = 0;
            
        }
                
        MyCollectionView.scrollToItem(at: IndexPath(item: iActual, section: 0), at: .right, animated: true)
         
    }

}
extension ViewController: UICollectionViewDataSource  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == CollectionView2){
            return 3
        }
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {//dibuja las celdas
        
        let cell = MyCollectionView.dequeueReusableCell(withReuseIdentifier: "myCelda", for: indexPath) as? MyCustom
        
        if (collectionView == CollectionView2){
            let cell2 = CollectionView2.dequeueReusableCell(withReuseIdentifier: "nuevaCelda", for: indexPath) as! PeliculasPrueba
            cell2.backgroundColor = UIColor.red
            cell2.img.image = UIImage(named: images[indexPath.row])
            return cell2
        }
        // aqui va la imagen correspondiente
        cell?.img.image = UIImage(named: images[indexPath.row])
        return cell!
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}

//permide tibujar las celdas
extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  miWidthScreen, height: 250)
    }
}
