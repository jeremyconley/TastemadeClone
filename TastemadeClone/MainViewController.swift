//
//  MainViewController.swift
//  TastemadeClone
//
//  Created by Jeremy Conley on 10/26/16.
//  Copyright © 2016 JeremyConley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    
    //PageVC
    var pageViewController: UIPageViewController!
    let pages = ["FirstVc", "SecondVc", "ThirdVc", "FourthVc"]
    
    var firstOpen = true;
    
    
    //Outlets
    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var TodayLabel: UILabel!
    @IBOutlet weak var ShowsLabel: UILabel!
    @IBOutlet weak var TastemakerLabel: UILabel!
    @IBOutlet weak var RecipeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setup pages navigation
        pageView.layer.borderWidth = 0.5
        pageView.layer.borderColor = UIColor.gray.cgColor
        TodayLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        

        //Setup PageVC
        if let pageVc = storyboard?.instantiateViewController(withIdentifier: "PageViewController"){
            self.addChildViewController(pageVc)
            self.view.addSubview(pageVc.view)
        
            pageViewController = pageVc as! UIPageViewController
            pageViewController.dataSource = self
            pageViewController.delegate = self
            pageViewController.setViewControllers([viewControllerAtIndex(index: 0)], direction: UIPageViewControllerNavigationDirection.forward, animated: true, completion: nil)
            pageViewController.didMove(toParentViewController: self)
        }

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        self.view.bringSubview(toFront: pageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Change Font Attributes
    func pageOpen(index: Int){
        if index == 0 {
            //Bold selected page
            TodayLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            TodayLabel.textColor = UIColor.black
            //Unselect others
            ShowsLabel.font = UIFont.systemFont(ofSize: 14.0)
            ShowsLabel.textColor = UIColor.gray
            TastemakerLabel.font = UIFont.systemFont(ofSize: 14.0)
            TastemakerLabel.textColor = UIColor.gray
            RecipeLabel.font = UIFont.systemFont(ofSize: 14.0)
            RecipeLabel.textColor = UIColor.gray
        } else if index == 1 {
            //Bold selected page
            ShowsLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            ShowsLabel.textColor = UIColor.black
            //Unselect others
            TodayLabel.font = UIFont.systemFont(ofSize: 14.0)
            TodayLabel.textColor = UIColor.gray
            TastemakerLabel.font = UIFont.systemFont(ofSize: 14.0)
            TastemakerLabel.textColor = UIColor.gray
            RecipeLabel.font = UIFont.systemFont(ofSize: 14.0)
            RecipeLabel.textColor = UIColor.gray
        }else if index == 2 {
            //Bold selected page
            TastemakerLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            TastemakerLabel.textColor = UIColor.black
            //Unselect others
            ShowsLabel.font = UIFont.systemFont(ofSize: 14.0)
            ShowsLabel.textColor = UIColor.gray
            TodayLabel.font = UIFont.systemFont(ofSize: 14.0)
            TodayLabel.textColor = UIColor.gray
            RecipeLabel.font = UIFont.systemFont(ofSize: 14.0)
            RecipeLabel.textColor = UIColor.gray
        }else if index == 3 {
            //Bold selected page
            RecipeLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
            RecipeLabel.textColor = UIColor.black
            //Unselect others
            ShowsLabel.font = UIFont.systemFont(ofSize: 14.0)
            ShowsLabel.textColor = UIColor.gray
            TastemakerLabel.font = UIFont.systemFont(ofSize: 14.0)
            TastemakerLabel.textColor = UIColor.gray
            TodayLabel.font = UIFont.systemFont(ofSize: 14.0)
            TodayLabel.textColor = UIColor.gray
        }
    }
    
    //Previous Page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let index = pages.index(of: viewController.restorationIdentifier!){
            if (index > 0) {
                return viewControllerAtIndex(index: index - 1)
            }
        }
        return nil
    }
    
    //Next Page
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let index = pages.index(of: viewController.restorationIdentifier!){
            if (index < pages.count - 1) {
                return viewControllerAtIndex(index: index + 1)
            }
        }
        return nil
    }
    
    //Show selected page
    func viewControllerAtIndex(index: Int) -> UIViewController {
        let vc = storyboard?.instantiateViewController(withIdentifier: pages[index])
        return vc!
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
