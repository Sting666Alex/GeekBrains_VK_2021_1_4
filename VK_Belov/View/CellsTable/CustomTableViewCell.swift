//
//  CustomTableViewCell.swift
//  VK_Belov
//
//  Created by Алексей Белов on 13.03.2021.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    static let reuseId = "CustomTableViewCell"
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var titleFoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        
        titleFoto.addGestureRecognizer(tap)
        titleFoto.isUserInteractionEnabled = true
    }
    
    func configure(name: String, user: User){
        
        titleLable.text = name
        
        titleFoto.backgroundColor = .gray
        titleFoto.layer.cornerRadius = titleFoto.frame.width / 2
        
        
        titleFoto.backgroundColor = .gray
        titleFoto.layer.shouldRasterize = false
        titleFoto.clipsToBounds = false
        titleFoto.layer.shadowPath = UIBezierPath(roundedRect: titleFoto.bounds, cornerRadius: 5).cgPath
        
        titleFoto.layer.shadowColor = UIColor.darkGray.cgColor
        titleFoto.layer.shadowRadius = titleFoto.frame.height * 0.2
        titleFoto.layer.shadowOpacity = 1
        titleFoto.layer.shadowOffset = .init(width: 2, height: 2) //(width: 10, height: 10)
        
        let myImage = UIImageView(frame: titleFoto.bounds)
        if let image = user.urlFoto {
            myImage.image = UIImage(named: image) // titleFoto.image = UIImage(named: image)
        } else {
            myImage.image = UIImage(named: "person")
        }
        
        myImage.clipsToBounds = true
        myImage.layer.cornerRadius = titleFoto.frame.height / 2
        
        titleFoto.addSubview(myImage)
        

    }
    
    @objc func iconTapped(gesture: UITapGestureRecognizer){
        titleFoto.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        UIView.animate(withDuration: 0.7,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.titleFoto.transform = .identity
                       }, completion: nil)
    }
    

//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
}
