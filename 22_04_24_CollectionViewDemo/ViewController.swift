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
    var foodItems = ["VadaPav","Pohe","Upma","Dosa"]
    override func viewDidLoad() {
        super.viewDidLoad()
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        let uiNIb = UINib(nibName: "MenuCollectionViewCell", bundle: nil)
        menuCollectionView.register(uiNIb, forCellWithReuseIdentifier: "MenuCollectionViewCell")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        menuCollectionViewFlowLayout.minimumInteritemSpacing = 30.0
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
        
        return CGSize(width: 120, height: 120)
//        var totalWidth = self.menuCollectionView.bounds.size.width
//        var numberOfCellsInARow = 3.0
//        let evenOdd = (totalWidth / numberOfCellsInARow) as! Int % 2
//
//        if evenOdd == 0{
//            return CGSize(width: 120.0, height: 120.0)
//        } else {
//            CGSize(width: 120.0, height: 60.0)
//        }
    }
}
