//
//  TodayViewController.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/26/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class TodayViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var selectedCellImg = UIImageView()
    
    var posts = [TodayPost]()
    
    //Video
    let avControl = AVPlayerViewController()
    
    //User Pics
    let scranImage = UIImage(named: "scranImg.jpg")
    let jenImage = UIImage(named: "jenImg.png")
    let diniImage = UIImage(named: "diniImg.jpg")
    
    //Dish Pics
    let brainFoodImg = UIImage(named: "brainFood.jpg")
    let pslImg = UIImage(named: "pslCupcake.jpg")
    let babkaImg = UIImage(named: "babka.jpg")
    let wontonImg = UIImage(named: "wonton.jpg")
    
    override func viewDidAppear(_ animated: Bool) {
        
        //Call font bold function
        let parent = self.parent as! UIPageViewController
        let mainParent = parent.parent as! MainViewController
        mainParent.pageOpen(index: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup and fill table
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        createRandPosts()
        
        self.addChildViewController(avControl)
        

        // Do any additional setup after loading the view.
    }
    
    //Fill table
    func createRandPosts(){
        let post1 = TodayPost(dish: "Brain Food Cupcakes", dishPicture: brainFoodImg!, description: "A few sweet and surprising ingredients make this perfect food for zombies", user: "The Scran Line", userPic: scranImage!)
        let post2 = TodayPost(dish: "Mini Pumpkin Babka Knots", dishPicture: babkaImg!, description: "We're stuffing delicious bread knots full of fall flavor", user: "Dini Klein", userPic: diniImage!)
        let post3 = TodayPost(dish: "Creamy Crunchy Cream Cheese Wontons", dishPicture: wontonImg!, description: "Make one of your favorite nontraditional take-out orders at home", user: "Jen Phanomrat", userPic: jenImage!)
        let post4 = TodayPost(dish: "PSL Cupcakes FTW", dishPicture: pslImg!, description: "You haven't tried a pumpkin spice latte until you've tried it as a cupcake", user: "The Scran Line", userPic: scranImage!)
        posts.append(post1)
        posts.append(post2)
        posts.append(post3)
        posts.append(post4)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodayCell", for: indexPath)
        
        //Configure cell content
        let dishPicture = cell.contentView.viewWithTag(1) as! UIImageView
        let dishName = cell.contentView.viewWithTag(2) as! UILabel
        let description = cell.contentView.viewWithTag(3) as! UILabel
        let userPicture = cell.contentView.viewWithTag(4) as! UIImageView
        let userName = cell.contentView.viewWithTag(5) as! UILabel
        let watchLabel = cell.contentView.viewWithTag(6) as! UILabel
        
        //Set cell items to current post
        let post = posts[indexPath.row]
        dishPicture.image = post.dishPicture
        dishName.text = post.dish
        description.text = post.description
        userPicture.image = post.userPic
        userPicture.layer.cornerRadius = 25
        userPicture.layer.masksToBounds = true
        watchLabel.layer.cornerRadius = 15
        watchLabel.layer.masksToBounds = true
        userName.text = post.user
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCellImg.isHidden = false
        let cell = self.tableView.cellForRow(at: indexPath as IndexPath)
        let videoURL = NSURL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
        let player = AVPlayer(url: videoURL! as URL)
        let currCellImg = cell?.contentView.viewWithTag(1) as! UIImageView
        let viewSize:CGSize = currCellImg.frame.size
        avControl.player = player
        avControl.view.frame.size = CGSize(width: (cell?.frame.width)!, height: viewSize.height)
        cell?.addSubview(avControl.view)
        //cell?.bringSubview(toFront: avControl.view)
        selectedCellImg = currCellImg
        selectedCellImg.isHidden = true
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        avControl.player?.pause()
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
