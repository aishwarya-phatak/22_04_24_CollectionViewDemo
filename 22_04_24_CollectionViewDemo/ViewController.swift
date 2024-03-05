//
//  ViewController.swift
//  22_04_24_CollectionViewDemo
//
//  Created by Vishal Jagtap on 04/03/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuCollectionView: UICollectionView!
    @IBOutlet weak var menuCollectionViewFlowLayout: UICollectionViewFlowLayout!
    var menuCollectionViewCell : MenuCollectionViewCell?
    var foodItems = ["VadaPav","Pohe","Upma","Dosa","Samosa","Pattice"]
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        let uiNIb = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        menuCollectionView.register(uiNIb, forCellWithReuseIdentifier: "MenuCollectionViewCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        menuCollectionViewFlowLayout.scrollDirection = .vertical
        menuCollectionViewFlowLayout.minimumInteritemSpacing = 0
        menuCollectionViewFlowLayout.minimumLineSpacing = 5.0
    }
}

extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        menuCollectionViewCell = self.menuCollectionView.dequeueReusableCell(withReuseIdentifier: "MenuCollectionViewCell", for: indexPath) as! MenuCollectionViewCell
        menuCollectionViewCell?.backgroundColor = .lightGray
        menuCollectionViewCell?.menuItemLabel.text = foodItems[indexPath.item]
        return menuCollectionViewCell!
    }
}

extension ViewController :UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        return CGSize(width: 120, height: 120)
        let totalWidth = self.menuCollectionView.bounds.size.width
        let numberOfCellsInARow = 3
        let evenOdd = (indexPath.row)/(numberOfCellsInARow) % 2
        let dimensions = CGFloat(Int(totalWidth)/numberOfCellsInARow)
        if evenOdd == 0{
            return CGSize(width: dimensions, height: dimensions)
        } else {
            return CGSize(width: dimensions, height: dimensions/2)
        }
    }
}


extension ViewController : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
    }
}
