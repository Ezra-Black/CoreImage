//
//  PostImageViewController.swift
//  CoreImageViewController
//
//  Created by Ezra Black on 6/1/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import Photos

class PostImageViewController: UIViewController {
    
    //MARK: Outlets -
    
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider3Label: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    
    //MARK: Actions -
    @IBAction func slider1(_ sender: Any) {
    }
    @IBAction func slider2(_ sender: Any) {
    }
    @IBAction func slider3(_ sender: Any) {
    }
    
    private let context = CIContext(options: nil)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

}
