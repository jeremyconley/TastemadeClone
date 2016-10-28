//
//  TasteMakersViewController.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/27/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import UIKit

class TasteMakersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //let tastemakers = ["Dini Klein": "After graduating with a degree in Fashion and Culinary Arts, Dini went on to launch her food blog in 2010 and found her catering service Dini Delivers. Growing up between St. Louis, Missouri, and Israel, Dini fuses the flavors of the Mediterranean with American cuisine, drawing inspiration from all over the world.", "Julie Nolke": "A young actress from Canada, who refuses to starve. On her channel she shares her incredible love for movies and cooking by creating innovative recipe videos that are little blockbusters themselves. Each video includes a movie parody and cheeky recipe to match.", "Marcus Meacham": "A self-taught culinary guru who has worked his way to the top of the food scene in Columbus. He describes his unique style as \"Imaginative Cuisine\"...anything with bold and creative flavors that has a cool combination of creamy, smooth, bright, and earthy. Dishes that may seems like a lot to comprehend but when you taste it you know whats up.", "Vijaya Selvaraju": "An adventurous and dynamic self-taught cook and on-camera presenter from Toronto. Born in Chennai, India, Vijaya shares eclectic recipes from her childhood as well as explores cuisines and flavors from the countries she visits."]
    
    var tastemakers = [Tastemaker]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        let parent = self.parent as! UIPageViewController
        let mainParent = parent.parent as! MainViewController
        mainParent.pageOpen(index: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false
        
        let tmakerPic1 = UIImage(named: "diniImg2.jpg")
        let tmakerPic2 = UIImage(named: "jenImg2.jpg")
        let tmakerPic3 = UIImage(named: "vijayaImg.jpg")
        let tmakerPic4 = UIImage(named: "marcusImg.jpg")
        
        let tastemaker1 = Tastemaker(name: "Dini Klein", description: "After graduating with a degree in Fashion and Culinary Arts, Dini went on to launch her food blog in 2010 and found her catering service Dini Delivers. Growing up between St. Louis, Missouri, and Israel, Dini fuses the flavors of the Mediterranean with American cuisine, drawing inspiration from all over the world.", picture: tmakerPic1!)
        let tastemaker2 = Tastemaker(name: "Jen Phanomrat", description: "Jen creates down-home video recipes where she shows viewers how to have fun in the kitchen. Jen’s recipes spring from the roots of good times, amazing people, and a hungry soul.", picture: tmakerPic2!)
        let tastemaker3 = Tastemaker(name: "Vijaya Selvaraju", description: "An adventurous and dynamic self-taught cook and on-camera presenter from Toronto. Born in Chennai, India, Vijaya shares eclectic recipes from her childhood as well as explores cuisines and flavors from the countries she visits.", picture: tmakerPic3!)
        let tastemaker4 = Tastemaker(name: "Marcus Meacham", description: "A self-taught culinary guru who has worked his way to the top of the food scene in Columbus. He describes his unique style as \"Imaginative Cuisine\"...anything with bold and creative flavors that has a cool combination of creamy, smooth, bright, and earthy. Dishes that may seems like a lot to comprehend but when you taste it you know whats up.", picture: tmakerPic4!)
        
        tastemakers.append(tastemaker1)
        tastemakers.append(tastemaker2)
        tastemakers.append(tastemaker3)
        tastemakers.append(tastemaker4)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tastemakers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tastemakerCell", for: indexPath)
        let tastemaker = tastemakers[indexPath.row]
        
        let tastemakerName = cell.contentView.viewWithTag(1) as! UILabel
        let tastemakerDescription =  cell.contentView.viewWithTag(2) as! UILabel
        let tasteMakerPic = cell.contentView.viewWithTag(4) as! UIImageView
        
        if indexPath.row == 0 {
            tastemakerDescription.textColor = UIColor(red: 188/255, green: 1, blue: 105/255, alpha: 1)
            tastemakerName.textColor = UIColor(red: 188/255, green: 1, blue: 105/255, alpha: 1)
        } else if indexPath.row == 1 || indexPath.row == 3 {
            tastemakerDescription.textColor = UIColor(red: 63/255, green: 41/255, blue: 19/255, alpha: 1)
            tastemakerName.textColor = UIColor(red: 63/255, green: 41/255, blue: 19/255, alpha: 1)
        } else if indexPath.row == 2 {
            tastemakerDescription.textColor = UIColor.white
            tastemakerName.textColor = UIColor.white
        }
        
        tastemakerName.text = tastemaker.name
        tastemakerDescription.text = tastemaker.description
        tasteMakerPic.image = tastemaker.picture
        
        return cell
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
