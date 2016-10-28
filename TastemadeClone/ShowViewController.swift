//
//  ShowViewController.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/27/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let picArray = ["showPic1.png", "showPic2.png", "showPic3.png", "showPic4.png"]

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        let parent = self.parent as! UIPageViewController
        let mainParent = parent.parent as! MainViewController
        mainParent.pageOpen(index: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.clear
        tableView.showsVerticalScrollIndicator = false

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
        return picArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath)
        var showPicture = cell.contentView.viewWithTag(1) as! UIImageView
        showPicture.image = UIImage(named: picArray[indexPath.row])
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
