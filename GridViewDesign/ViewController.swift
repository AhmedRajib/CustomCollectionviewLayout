//
//  ViewController.swift
//  GridViewDesign
//
//  Created by Ahmed Rajib on 10/11/22.
//

import UIKit

class ViewController: UIViewController {

     // MARK: - Outlet Collection list
    @IBOutlet weak var collectionview: UICollectionView!
    
    
     // MARK: - Variable Declarations
    let mainArray = [1,1,1,1,8,4,4,4,8]
    
    var subArray: [Int] = []
    var separetedArray:[Int] = []
    let spacing:CGFloat = 10

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        separetedArray = mainArray
        
        for item in mainArray {
            if item == 1 {
                subArray.append(item)
                separetedArray.remove(at: item)
            }
        }
        
        
        debugPrint("SUb array ", mainArray, "  se ", separetedArray )
        
        setupUI()
    }

    private func setupUI() {
        
        collectionview.register(MediumCell.nib, forCellWithReuseIdentifier: MediumCell.identifier)
        collectionview.register(fullWidthItem.nib, forCellWithReuseIdentifier: fullWidthItem.identifier)
        collectionview.register(MultipleCell.nib, forCellWithReuseIdentifier: MultipleCell.identifier)

        collectionview.delegate = self
        collectionview.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        self.collectionview.collectionViewLayout = layout
        
        
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return separetedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if separetedArray[indexPath.row] == 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediumCell", for: indexPath) as? MediumCell
            return cell!
        }else if separetedArray[indexPath.row] == 8 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "fullWidthItem", for: indexPath) as? fullWidthItem
            
            return cell!
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MultipleCell", for: indexPath) as? MultipleCell
            
            return cell!
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItemsperRow = 2
        let spacingbetweencells = 16
        
        debugPrint("Sepated Item ", separetedArray[indexPath.row])
        
        if separetedArray[indexPath.row] == 8 {
            
//            let width = (Int(collection.bounds.width) - totalSpacing)/numberOfItemsperRow
            return CGSize(width: Int(collectionview.bounds.width - 20), height: 150)
            
        }else {
            let totalSpacing = (2 * Int(self.spacing)) + ((numberOfItemsperRow - 1) * spacingbetweencells)
            
            if let collection = self.collectionview{
                let width = (Int(collection.bounds.width - 20) - totalSpacing)/numberOfItemsperRow
                return CGSize(width: width, height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
        
    }
}

