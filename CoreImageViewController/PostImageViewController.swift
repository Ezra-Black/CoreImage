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
    
    private var originalImage : UIImage? {
         didSet {
                   guard let originalImage = originalImage else {
                       scaledImage = nil
                       return
                   }
                   var scaledSize = photoImageView.bounds.size
                   let scale = UIScreen.main.scale
                   scaledSize = CGSize(width: scaledSize.width * scale, height: scaledSize.height * scale)
                   scaledImage = originalImage.imageByScaling(toSize: scaledSize)
               }
    }
    private var scaledImage: UIImage? {
        didSet {
            updateViews()
        }
    }
    
    private let context = CIContext(options: nil)
    
    //MARK: Outlets -
    
    @IBOutlet weak var slider1Label: UILabel!
    @IBOutlet weak var slider2Label: UILabel!
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    @IBOutlet weak var slider3: UISlider!
    @IBOutlet weak var slider4: UISlider!
    @IBOutlet weak var slider5: UISlider!
    @IBOutlet weak var photoImageView: UIImageView!
    //MARK: IBActions -
    @IBAction func slider1(_ sender: UISlider) {
        updateViews()
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
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let filter1 = CIFilter.colorMonochrome()
        filter1.intensity = 1
        print(filter1.attributes)
        originalImage = photoImageView.image
    }
    
    func updateViews() {
        if let originalImage = originalImage {
            photoImageView.image = filterImage(originalImage)
        } else {
            photoImageView.image = UIImage(named: "selfie")
        }
    }
    
    //MARK: Methods -
    
    
    
    func filterImage(_ image: UIImage) -> UIImage? {
        
        guard let cgImage = image.cgImage else { return nil }
        let ciImage = CIImage(cgImage: cgImage)
        
        let filter = CIFilter.colorMonochrome()
        filter.inputImage = ciImage
        filter.intensity = slider1.value
        
        guard let outputCIImage = filter.outputImage else { return nil }
        guard let outputCGIImage = context.createCGImage(outputCIImage,
                                                         from: CGRect(origin: .zero,
                                                                      size: scaledImage!.size)) else {
                                                                        return nil }
        return UIImage(cgImage: outputCGIImage)
    }
}

