//
//  MultipleCell.swift
//  GridViewDesign
//
//  Created by Ahmed Rajib on 10/11/22.
//

import UIKit

class MultipleCell: UICollectionViewCell {

    @IBOutlet weak var collectionview: UICollectionView!
    
    var totalCell:[Int] = [1,1,1,1]
    
    let columnLayout = FlowLayout(
        minimumInteritemSpacing: 10,
        minimumLineSpacing: 10,
        sectionInset: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    )
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.collectionViewLayout = columnLayout
        
        collectionview.register(InnerCollectionViewCell.nib, forCellWithReuseIdentifier: InnerCollectionViewCell.identifier)

    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}

extension MultipleCell: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalCell.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InnerCollectionViewCell", for: indexPath) as? InnerCollectionViewCell
        return cell!
    }
    
    
}
