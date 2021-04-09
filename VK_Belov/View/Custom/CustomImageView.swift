//
//  Custom1.swift
//  VK_Belov
//
//  Created by Алексей Белов on 06.03.2021.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {
    
    @IBInspectable var cornerRadius: Int = 0 { didSet { updateShadow() } }
    
    @IBInspectable var shadowColor: UIColor = .clear { didSet { updateShadow() } }
    
    @IBInspectable var shadowOpacity: Int = 1 { didSet { updateShadow() } }
    
    @IBInspectable var shadowRadius: Int = 5 { didSet { updateShadow() } }
    
    @IBInspectable var shadowOffset: CGSize = .zero { didSet { updateShadow() } }
    
    @IBInspectable var masksToBounds: Bool = true { didSet { updateShadow() } }

    private var likeButton: UIButton!
    
    override static var layerClass: AnyClass {
        return CALayer.self
    }
    
    var shadowLayers: CALayer {
        likeButton = UIButton(type: .system)
        //addSubview.(<#T##self: UIView##UIView#>)
        return self.layer //as! CALayer
    }
    
    func updateShadow(){
        shadowLayers.cornerRadius = CGFloat(cornerRadius)
        shadowLayers.shadowColor = shadowColor.cgColor
        shadowLayers.shadowOpacity = Float(shadowOpacity)
        shadowLayers.shadowRadius = CGFloat(shadowRadius)
        shadowLayers.shadowOffset = shadowOffset
        shadowLayers.masksToBounds = masksToBounds
    }
    
    
}
