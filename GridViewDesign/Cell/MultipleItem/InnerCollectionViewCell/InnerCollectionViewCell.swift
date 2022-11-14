//
//  InnerCollectionViewCell.swift
//  GridViewDesign
//
//  Created by MacBook Pro on 12/11/22.
//

import UIKit

class InnerCollectionViewCell: UICollectionViewCell {

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
