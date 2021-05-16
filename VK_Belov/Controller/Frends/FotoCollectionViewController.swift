//
//  FotoCollectionViewController.swift
//  VK_Belov
//
//  Created by Алексей Белов on 23.02.2021.
//

import UIKit
import RealmSwift

class FotoCollectionViewController: UICollectionViewController,
                                    //UICollectionViewDataSource,
                                    //UICollectionViewDelegate,
                                    UICollectionViewDelegateFlowLayout {

    var selectFrends:[ItemFrends] = []
    var photoFrends:[ItemPhotoFrends] = []
    var tokenFrends: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "FotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: FotoCollectionViewCell.reuseId)
        
        loadPhoto()
    }

    private func loadPhoto(){
        if let idfriend = selectFrends.first?.id{
            
            //self.tokenFrends =
            
            //1. загрузка данных из базы Realm
            photoFrends = loadItemPhotoFrendsRealData(idFrend: String(idfriend))

            guard let realm = try? Realm() else { return }

            // подключение отслеживание изменений в таблице Realm с фото
            let itemPhotoFrendsRealm = realm.objects(ItemPhotoFrendsRealm.self)
            
            WebService().photosGetAllRequest(idFrend: String(idfriend)){[weak self] photoElementRequest in
            //                    self?.photoFrends = photoElementRequest
            //                    self?.collectionView.reloadData()
            }
            
            tokenFrends = itemPhotoFrendsRealm.observe { [weak self] (changes: RealmCollectionChange) in
                    switch changes {
                            case .initial(let results):
                                print("Инициализация")
//                                print(results)
                            case let .update(results, deletions, insertions, modifications):
                                print("Изменение")
//                                print(results, deletions, insertions, modifications)
                                self?.photoFrends = loadItemPhotoFrendsRealData(idFrend: String(idfriend))
                                self?.collectionView.reloadData()
                            case .error(let error):
                                print("Ошибка")
                                print(error)
                            }
//                            print("данные изменились")
            }

            
//            //2. обновление базы Realm с сервера
//            if photoFrends.isEmpty {
//                WebService().photosGetAllRequest(idFrend: String(idfriend)){[weak self] photoElementRequest in
//                    self?.photoFrends = photoElementRequest
//                    self?.collectionView.reloadData()
//                }
//            }else{
//                WebService().photosGetAllRequest(idFrend: String(idfriend)){[weak self] photoElementRequest in
//                    self?.photoFrends = photoElementRequest
//                    self?.collectionView.reloadData()
//                }
//            }
            
        }
    }
    
    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoFrends.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FotoCollectionViewCell.reuseId, for: indexPath)
            as! FotoCollectionViewCell
        
        if let photo = photoFrends[indexPath.row].sizes.first?.url{
            let bounds: CGRect = UIScreen.main.bounds
            let width:CGFloat = bounds.size.width
            //let height:CGFloat = bounds.size.height
            
            cell.configure(width: width, URLString: photo)
        }
        
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
