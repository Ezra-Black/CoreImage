//
//  CustomCell.swift
//  CoreImageViewController
//
//  Created by Ezra Black on 6/1/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
//    fileprivate let button: UIButton = {
//        let buttonToUse = UIButton()
//        buttonToUse.translatesAutoresizingMaskIntoConstraints = false
//        buttonToUse.clipsToBounds = true
//        return buttonToUse
//    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init decoder:) has not been implemented")
    }
}
