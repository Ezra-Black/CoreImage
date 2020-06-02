//
//  CustomCell.swift
//  CoreImageViewController
//
//  Created by Ezra Black on 6/1/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    lazy var title: String? = {
        let t = self.button.titleLabel?.text
        return t
    }()
    
    var delegate: ImageCellDelegate?
    
    lazy var button: UIButton = {
            let button = UIButton(type: .system)
        #warning("why MUST i set my title here?")
            button.translatesAutoresizingMaskIntoConstraints = false
            button.clipsToBounds = true
            return button
        }()
    
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(button)
            addConstraints ([
                // Add to top of view
                button.leadingAnchor.constraint(equalTo: leadingAnchor),
                button.trailingAnchor.constraint(equalTo: trailingAnchor),
                button.topAnchor.constraint(equalTo: topAnchor)
            ])
}
    
    convenience init(title: String) {
        self.init()
        addSubview(button)
        addConstraints ([
            // Add to top of view
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
}
}
