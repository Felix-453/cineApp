//
//  MyCustom.swift
//  cinepolito
//
//  Created by IMAC17 on 24/04/23.
//

import UIKit

class MyCustom: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        img.image = UIImage(named: "increibles")
    }

}
