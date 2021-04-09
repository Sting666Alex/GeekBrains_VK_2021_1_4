//
//  FotoCollectionViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 23.02.2021.
//

import UIKit

class FotoCollectionViewController: UICollectionViewController,
                                    //UICollectionViewDataSource,
                                    //UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {

    var selectFrends = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "FotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FotoCollectionViewCell.reuseId)
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FotoCollectionViewCell.reuseId, for: indexPath)
            as! FotoCollectionViewCell
        
        
        let bounds: CGRect = UIScreen.main.bounds
        let width:CGFloat = bounds.size.width
        //let height:CGFloat = bounds.size.height
        
        cell.configure(width: width)
        
        return cell
    }
    
   
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        //get width screen
        let width = collectionView.frame.width / 2
        
        return CGSize(width: width, height: width)
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
}
