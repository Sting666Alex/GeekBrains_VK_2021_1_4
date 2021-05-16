//
//  FirstLetterOfTheName.swift
//  VK_Belov
//
//  Created by Алексей Белов on 10.03.2021.
//

import UIKit

@IBDesignable
class FirstLetterOfTheName: UIControl {
    
    var firstLetters:[String] = []
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        //setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //setup()
    }
    
    private func setup(){
        firstLetters = ["A","B","C"]//User.arrUser.map { String( $0.name.uppercased().prefix(1) ) }
        firstLetters = Array(Set(firstLetters)).sorted()
//        firstLetters = User.getFirstArrUser()
//        
        for firstLetter in firstLetters {
            let button = UIButton(type: .system)
            button.setTitle(firstLetter, for: .normal)
            
            button.addTarget(self, action: #selector(buttomTapped), for: .touchUpInside)
            
            buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: buttons)
        stackView.spacing = 0
        stackView.axis = .vertical //.horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //stackView.frame = bounds
    }
    
    @objc private func buttomTapped(_ sender: UIButton){
        print(#function)
    }

}
