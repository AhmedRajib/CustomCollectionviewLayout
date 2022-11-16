//
//  Extensions.swift
//  GridViewDesign
//
//  Created by MacBook Pro on 16/11/22.
//

import Foundation
import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return separetedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if separetedArray[indexPath.row] == 4 {
            multiCellIsAlreadyShow = false
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediumCell.identifier, for: indexPath) as? MediumCell
            return cell!
        }else if separetedArray[indexPath.row] == 8 {
            multiCellIsAlreadyShow = false
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: fullWidthItem.identifier, for: indexPath) as? fullWidthItem
            
            return cell!
        }else {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MultipleCell.identifier, for: indexPath) as? MultipleCell
            if !multiCellIsAlreadyShow {

                cell?.totalCell = multiCellItemValue[indexPath.row]
                
                
//                dynamicArray.remove(at: 0)
                debugPrint("Index of path ",dynamicArraySize)
//                cell?.totalCell.remove(at: 0)
                multiCellIsAlreadyShow = true
                return cell!
            }else {
                return cell!
            }
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsperRow = 2
        let spacingbetweencells = 10
        
        debugPrint("Sepated Item ", separetedArray[indexPath.row])
        
        if separetedArray[indexPath.row] == 8 {
            
//            let width = (Int(collection.bounds.width) - totalSpacing)/numberOfItemsperRow
            return CGSize(width: Int(collectionview.bounds.width - 20), height: 150)
            
        }else {
            let totalSpacing = (2 * Int(self.spacing)) + ((numberOfItemsperRow - 1) * spacingbetweencells)
            
            if let collection = self.collectionview{
                let width = (Int(collection.bounds.width) - totalSpacing )/numberOfItemsperRow
                return CGSize(width: width , height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        
    }
}

