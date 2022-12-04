//
//  AddRoom+CollectionDelagte.swift
//  HalimaSitter
//
//  Created by Moustafa on 08/08/2021.
//

import UIKit
//MARK: - Extension

//MARK:-UICollectionViewDelegate And UICollectionViewDataSource

extension AddRoomViewController : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func setUpCollectionView(){
        roomImageCoolectionView.delegate = self
        roomImageCoolectionView.dataSource = self
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayRoomImage.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RoomImageCollectionViewCell", for: indexPath) as! RoomImageCollectionViewCell
        let cellIndex = indexPath.item
        cell.roomImage.image = arrayRoomImage[cellIndex]
        return cell
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
    }
}



//MARK:-UICollectionViewDelegateFlowLayout

extension AddRoomViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let cellSize = CGSize(width: 60 , height: 60)
        return cellSize
        
        
    }
}
