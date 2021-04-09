//
//  LikeControl.swift
//  VK_Belov
//
//  Created by Алексей Белов on 13.03.2021.
//

import UIKit

class CostomLikeControl: UIControl {
    
    @IBOutlet weak var bottomLike: UIButton!
    @IBOutlet weak var titleLike: UILabel!
    
    var numberLikeInt: Int = 0
    var Foto: UIImage!
        
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        
    }
    
    

}
