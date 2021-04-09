//
//  LoadingView.swift
//  VK_Belov
//
//  Created by Алексей Белов on 26.03.2021.
//

import UIKit

class LoadingView: UIView {
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        backgroundColor = .clear//.red
//        let activityIndicatorView = UIActivityIndicatorView()
//        activityIndicatorView.startAnimating()
//        addSubview(activityIndicatorView)
//        activityIndicatorView.center = center
    }
    
    func StartAnimating(width: CGFloat, height: CGFloat){
        let rect = CGRect(x: 0, y: 0, width: 20, height: 20)
        
        let viewRect1 = UIView(frame: rect)
        viewRect1.backgroundColor = .darkGray
        viewRect1.layer.cornerRadius = viewRect1.frame.height / 2
        
        let viewRect2 = UIView(frame: rect)
        viewRect2.backgroundColor = .darkGray
        viewRect2.layer.cornerRadius = viewRect2.frame.height / 2

        let viewRect3 = UIView(frame: rect)
        viewRect3.backgroundColor = .darkGray
        viewRect3.layer.cornerRadius = viewRect3.frame.height / 2

        addSubview(viewRect1)
        addSubview(viewRect2)
        addSubview(viewRect3)
        
        UIView.animate(withDuration: 0.5, delay: 0.5, animations: {
            viewRect1.frame.origin.x += width/2 - 30
            viewRect1.frame.origin.y += height/2
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.8, animations: {
            viewRect2.frame.origin.x += (width/2)
            viewRect2.frame.origin.y += height/2
        })
        
        UIView.animate(withDuration: 0.5, delay: 1.1, animations: {
            viewRect3.frame.origin.x += (width/2 + 30)
            viewRect3.frame.origin.y += height/2
        })
        
        UIView.animate(withDuration: 0.4, delay: 1.5, options: [.repeat,.autoreverse], animations: {
            viewRect1.alpha = 0.2
        })
        
        UIView.animate(withDuration: 0.4, delay: 1.7, options: [.repeat,.autoreverse], animations: {
            viewRect2.alpha = 0.2
        })
        
        UIView.animate(withDuration: 0.4, delay: 1.9, options: [.repeat,.autoreverse], animations: {
            viewRect3.alpha = 0.2
        })
    }
    
}
