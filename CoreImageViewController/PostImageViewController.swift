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
        let cellCIPhotoEffectNoir = CustomCell(title: "Noir")
        let cellPhotoEffectInstant = CustomCell(title: "Candid")
        let cellCIVirbrance = CustomCell(title: "Vibrance")
        let cellCIWhitePointAdjust = CustomCell(title: "WhitePoint")
        let cellCISharpenLuminance = CustomCell(title: "Sharpen")
        #warning("Why cant i set my title here?")
        cellCIPhotoEffectNoir.button.setTitle("Noir", for: .normal)
        cellPhotoEffectInstant.button.setTitle("Candid", for: .normal)
        cellCIVirbrance.button.setTitle("Vibrance", for: .normal)
        cellCIWhitePointAdjust.button.setTitle("WhitePoint", for: .normal)
        cellCISharpenLuminance.button.setTitle("Sharpen", for: .normal)

        cellsToDisplay.append(cellCIPhotoEffectNoir)
        cellsToDisplay.append(cellPhotoEffectInstant)
        cellsToDisplay.append(cellCIVirbrance)
        cellsToDisplay.append(cellCIWhitePointAdjust)
        cellsToDisplay.append(cellCISharpenLuminance)
        
    }
    
    @objc func editPhotoButtonTapped(button: UIButton) -> Void {
        
        // TODO: get cell for button being tapped by comparing or using a delegate protocol to send a message. Now we will call certain functions for certain scenarios.
        if button.titleLabel?.text == "Button" {
            print("Noir button tapped")
        } else if button.titleLabel?.text == "Candid" {
            print("Candid button tapped")
        } else if button.titleLabel?.text == "Vibrance" {
            print("Vibrance button tapped")
        } else if button.titleLabel?.text == "WhitePoint" {
            print("WhitePoint button tapped")
        } else if button.titleLabel?.text == "Sharpen" {
            print("Sharpen button tapped")
        }
        
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
        cell.button.addTarget(self, action: #selector(editPhotoButtonTapped(button:)), for: .touchUpInside)
        return cell
    }
}

extension PostImageViewController: ImageCellDelegate {
    func didTapButtonInside(cell: CustomCell) {
        
    }
}



