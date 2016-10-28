//
//  RecipeViewController.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/27/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var images = [UIImage]()
    
    //CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    let cellItemSpacing : CGFloat = 1
    
    override func viewDidAppear(_ animated: Bool) {
        let parent = self.parent as! UIPageViewController
        let mainParent = parent.parent as! MainViewController
        mainParent.pageOpen(index: 3)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //Setup collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        collectionView!.collectionViewLayout = layout
        
        //Random Imgs
        let img1 = UIImage(named: "reg1.jpg")
        let img2 = UIImage(named: "reg6.jpg")
        let img3 = UIImage(named: "reg3.jpg")
        let img4 = UIImage(named: "reg4.jpg")
        let img5 = UIImage(named: "wide1.jpg")
        let img6 = UIImage(named: "reg5.jpg")
        let img7 = UIImage(named: "reg2.jpg")
        let img8 = UIImage(named: "reg7.jpg")
        let img9 = UIImage(named: "reg8.jpg")
        let img10 = UIImage(named: "wide2.jpg")
        images.append(img1!)
        images.append(img2!)
        images.append(img3!)
        images.append(img4!)
        images.append(img5!)
        images.append(img6!)
        images.append(img7!)
        images.append(img8!)
        images.append(img9!)
        images.append(img10!)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recipeCell", for: indexPath)
        
        let imgView = cell.contentView.viewWithTag(1) as! UIImageView
        
        imgView.image = images[indexPath.row]
        
        //Config cell img sizes
        if (indexPath.row == 4 || indexPath.row == 9){
            let size = CGSize(width: self.view.frame.width, height: self.view.frame.height/4)
            imgView.frame.size = size
        } else {
            let size = CGSize(width: self.view.frame.width/2, height: self.view.frame.height/4 )
            imgView.frame.size = size
        }
 
        return cell
    }
    
    //Config cell sizes
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
         if (indexPath.row == 4 || indexPath.row == 9){
            let size = CGSize(width: self.view.frame.width, height: self.view.frame.height/4)
            return size
         }
        
        let size = CGSize(width: self.view.frame.width/2 - cellItemSpacing, height: self.view.frame.height/4)
        return size
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
