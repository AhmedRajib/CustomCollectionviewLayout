//
//  MultipleCell.swift
//  GridViewDesign
//
//  Created by Ahmed Rajib on 10/11/22.
//

import UIKit

class MultipleCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}
