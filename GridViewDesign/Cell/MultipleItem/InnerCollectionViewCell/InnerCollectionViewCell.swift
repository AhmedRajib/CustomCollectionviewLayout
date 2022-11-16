//
//  InnerCollectionViewCell.swift
//  GridViewDesign
//
//  Created by MacBook Pro on 12/11/22.
//

import UIKit

class InnerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.layer.cornerRadius = 10
        
    }
    static var nib: UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }

}
