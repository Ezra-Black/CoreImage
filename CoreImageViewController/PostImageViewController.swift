//
//  PostImageViewController.swift
//  CoreImageViewController
//
//  Created by Ezra Black on 6/1/20.
//  Copyright © 2020 Casanova Studios. All rights reserved.
//
import Foundation
import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins
import Photos

class PostImageViewController: UIViewController {
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCell.self, forCellWithReuseIdentifier: "Filtercell")
        return cv
    }()
    
    private let context = CIContext(options: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFilterCellsArray()
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        view.backgroundColor = .white
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
        collectionView.delaysContentTouches = false  // <- Makes buttons always press
        collectionView.isUserInteractionEnabled = true
    }
    
    var cellsToDisplay: [CustomCell] = []
    
    func createFilterCellsArray() {
        let cellCIPhotoEffectNoir = CustomCell(title: "Noir", id: 0)
        let cellPhotoEffectInstant = CustomCell(title: "Candid", id: 1)
        let cellCIVibrance = CustomCell(title: "Vibrance", id: 2)
        let cellCIWhitePointAdjust = CustomCell(title: "WhitePoint", id: 3)
        let cellCISharpenLuminance = CustomCell(title: "Sharpen", id: 4)
        #warning("Why cant i set my title here?")
        cellsToDisplay.append(cellCIPhotoEffectNoir)
        cellsToDisplay.append(cellPhotoEffectInstant)
        cellsToDisplay.append(cellCIVibrance)
        cellsToDisplay.append(cellCIWhitePointAdjust)
        cellsToDisplay.append(cellCISharpenLuminance)
        
    }
    @objc func noirEffectFunction(button: UIButton) -> Void {
        print("This is Broken.")
    }
    @objc func instantEffectFunction(button: UIButton) -> Void {
        
    }
    @objc func vibranceEffectFunction(button: UIButton) -> Void {
        
    }
    @objc func whiteEffectFunction(button: UIButton) -> Void {
        
    }
    @objc func LuminateEffectFunction(button: UIButton) -> Void {
        
    }
}

extension PostImageViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsToDisplay.count
    }
    //make your cells first.
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Filtercell", for: indexPath) as! CustomCell
        cell.delegate = self
        cell.backgroundColor = .red
        cell.contentView.isUserInteractionEnabled = true
////        cell.button.setTitle("eggyWeggy", for: .normal)
        cell.button.addTarget(self, action: #selector(noirEffectFunction(button:)), for: .touchUpInside)
        
        
        for c in 0..<cellsToDisplay.count {

            #warning("you are accessing the number of items and iterating through them inside of the collectionview. i should probably do this within display.")
            switch c {
            case 0:
                DispatchQueue.main.async {
                    if cell.id == 0 {
                     cell.button.setTitle("Noir", for: .normal)
                    }
                }
            case 1:
                DispatchQueue.main.async {
                    if cell.id == 1 {
                     cell.button.setTitle("Candid", for: .normal)
                    }
                }
            case 2:
                DispatchQueue.main.async {
                    if cell.id == 2 {
                    cell.button.setTitle("Vibrance", for: .normal)
                    }
                }
            case 3:
                DispatchQueue.main.async {
                     if cell.id == 3 {
                    cell.button.setTitle("WhitePoint", for: .normal)
                    }
                }
                
            default:
                DispatchQueue.main.async {
                    cell.button.setTitle("Sharpen", for: .normal)
                }
            }
        }
        
        
        return cell
    }
}

extension PostImageViewController: ImageCellDelegate {
    func didTapButtonInside(cell: CustomCell) {
        
    }
}



