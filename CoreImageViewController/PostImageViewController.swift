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
    
    //MARK: Properties -
    
    private let context = CIContext(options: nil)
    
    //MARK: Outlets -
    
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    //MARK: IBActions -
    @IBAction func slider1(_ sender: Any) {
    }
    @IBAction func slider2(_ sender: Any) {
    }
    @IBAction func slider3(_ sender: Any) {
    }
    @IBAction func slider4(_ sender: Any) {
    }
    @IBAction func slider5(_ sender: Any) {
    }
    @IBAction func addPhotoButtonPressed(_ sender: Any) {
    }
    @IBAction func savePhotoButtonPressed(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let filter1 = CIFilter.colorMonochrome()
        filter1.intensity = 1
        print(filter1.attributes)
        
    }
    
    //MARK: Methods -
    
    func filterImage(_ image: UIImage) -> UIImage? {
        return nil
    }

}

