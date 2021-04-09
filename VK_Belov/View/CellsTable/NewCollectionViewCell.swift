//
//  NewTableViewCell.swift
//  VK_Belov
//
//  Created by Алексей Белов on 21.03.2021.
//

import UIKit

class NewCollectionViewCell: UICollectionViewCell {

    static let reuseId = "NewCollectionViewCell"
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var titleFoto: UIImageView!
    
    func configure(topic: String, text: String, titleFotoString: String){
        
        titleLable.text = topic
        titleText.text  = text
        titleFoto.image = UIImage(named: titleFotoString)
        
    }
    
}
