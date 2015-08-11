//
//  ViewController.swift
//  codepath_app
//
//  Created by Jules Walter on 8/1/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    @IBOutlet weak var cancelBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var classmatesBarButtonItem: UIBarButtonItem!
    
    var pageViewController: UIPageViewController!
    let pageTitles = ["Title 1", "Title 2"]
    var count = 2
    //let class_cards, images, etc
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5)
        
        createPageViewController()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func createPageViewController(){
        
        let pageController = self.storyboard!.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        pageController.dataSource = self
        
        if count > 0 {
            let firstController = getItemController(0)!
            let startingViewControllers: NSArray = [firstController]
            pageController.setViewControllers(startingViewControllers as [AnyObject], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        }
        
        pageViewController = pageController
        addChildViewController(pageViewController!)
        self.view.addSubview(pageViewController!.view)
        pageViewController!.didMoveToParentViewController(self)
        
    }

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! CurrentWeekViewController
        
        if itemController.itemIndex>0 {
            return getItemController(itemController.itemIndex - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! CurrentWeekViewController
        
        if itemController.itemIndex+1 < count {
            return getItemController(itemController.itemIndex + 1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> CurrentWeekViewController? {
        
        if itemIndex < count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("CurrentWeekViewController") as! CurrentWeekViewController
//            pageItemController.itemIndex = itemIndex
//            pageItemController.imageName = contentImages[itemIndex]
            return pageItemController
        }
        
        return nil
    }

}

