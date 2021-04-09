//
//  BaseViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 26.03.2021.
//

import UIKit

class BaseViewController: UIViewController {
    

    lazy var loadingView: LoadingView = {
        let width = view.frame.width
        let height = view.frame.height

        
        let view = LoadingView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        //view.backgroundColor = .red
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
   }
    
    func showLoading()  {
        let width = view.frame.width
        let height = view.frame.height

        
        view.addSubview(loadingView)
        loadingView.center = view.center
        
        loadingView.alpha = 0
        
        
        
        loadingView.StartAnimating(width: width, height: height)
        
        UIView.animate(withDuration: 0.5){
                        self.loadingView.alpha = 1
                       }
    }
   
    func hideLoading()  {
        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.loadingView.alpha = 0
                       }, completion: { _ in
                        self.loadingView.removeFromSuperview()
                       })
        
    }
}
