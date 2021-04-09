//
//  UIViewControllerExtension.swift
//  VK_Belov
//
//  Created by Алексей Белов on 22.02.2021.
//

import UIKit

extension UIViewController{
    func showLoginErrorAlert(message: String){
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
