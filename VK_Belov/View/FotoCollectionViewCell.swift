//
//  FotoCollectionViewCell.swift
//  VK_Belov
//
//  Created by Алексей Белов on 13.03.2021.
//

import UIKit

class FotoCollectionViewCell: UICollectionViewCell {

    static let reuseId = "FotoCollectionViewCell"
    
    @IBOutlet weak var iconFotoFrends: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //let bounds: CGRect = UIScreen.main.bounds
        //let width:CGFloat = bounds.size.width
        //let height:CGFloat = bounds.size.height
        
        //self.frame = CGRect(x: 0, y: 0, width: Int(width)/2, height: Int(width)/2)
        
    }
    
    func configure(width: CGFloat) {
        //let widthContentView = width / 3
        
//        self.frame.size.width = widthContentView
//        self.frame.size.height = widthContentView
//
        
        iconFotoFrends.image = UIImage(systemName: "sun.min")
        //iconFotoFrends.center = center
        //iconFotoFrends.frame = CGRect(x: 0, y: 0, width: Int(width), height: Int(width))
    }
    
    @IBAction func like(_ sender: UIButton) {
        
    }
    //
    
}
