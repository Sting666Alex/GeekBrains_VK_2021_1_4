//
//  FeedCell.swift
//  VK_Belov
//
//  Created by Алексей Белов on 11.03.2021.
//

import UIKit

class LikeButton {
    @IBOutlet var likeButton: UIButton!
    var likeButtonPressedHandler: (() -> ())?
    var isLikeButtonSelected: Bool {
       get { return likeButton.isSelected }
       set { likeButton.isSelected = newValue }
    }
    @IBAction func likeButtonPressed(_ button: UIButton) {
        likeButtonPressedHandler?()
    }
}
