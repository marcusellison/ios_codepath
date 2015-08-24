//
//  ViewController.swift
//  codepath_app
//
//  Created by Jules Walter on 8/1/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class WeeksContainerViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var weeksCollectionView: UICollectionView!
    
    var weeksData: [String] = ["week 1", "week 2", "week 3", "week 4", "week 5", "week 6", "week 7", "week 8"]
    
    
    let layout = UICollectionViewFlowLayout()
    
    private let reuseIdentifier = "WeeksCell"
    // What does sectionInsets do?
    // private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    var pageViewController: UIPageViewController!
    let weekTitles = ["Title 1", "Title 2", "Title 3", "Title 4", "Title 5", "Title 6", "Title 7", "Title 8"]
    let weekDescriptions = ["first description", "Second Description"]
    var count = 8
    var currentPage = 1
    
    var weeksOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        createPageViewController()
        
        weeksCollectionView.scrollEnabled = false
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        weeksCollectionView.backgroundColor = UIColor.clearColor()
        
        // hook up delegate and datesource
        weeksCollectionView.dataSource = self
        weeksCollectionView.delegate = self
        
        // Traverse through views in the pageViewConroller,
        // if the view exists, set 'scrollView' to the active view and make its delegate itself
        
        for view in self.pageViewController.view.subviews {
            if let scrollView = view as? UIScrollView {
                
                scrollView.delegate = self
                
//                UIView.animateWithDuration(1, animations: { () -> Void in
//                    
//                    self.weeksCollectionView.contentOffset.x = scrollView.contentOffset.x
//                    
//                })
        
            }
        }
        
        
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
        self.view.insertSubview(pageViewController.view, atIndex: 0)
        pageViewController!.didMoveToParentViewController(self)
        pageViewController.view.frame = CGRectMake(0,30,self.view.frame.width, self.view.frame.height)
        
    }
    
    
    // MARK: - Page View Controller Data Source

    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! CurrentWeekViewController
        
        if itemController.itemIndex>0 {
            
             self.currentPage -= 1
            
            return getItemController(itemController.itemIndex! - 1)
        }
        
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let itemController = viewController as! CurrentWeekViewController
        
        if itemController.itemIndex!+1 < count {
            
            self.currentPage += 1
            
            return getItemController(itemController.itemIndex! + 1)
        }
        
        return nil
    }
    
    private func getItemController(itemIndex: Int) -> CurrentWeekViewController? {
        
        if itemIndex < count {
            let pageItemController = self.storyboard!.instantiateViewControllerWithIdentifier("CurrentWeekViewController") as! CurrentWeekViewController
            pageItemController.itemIndex = itemIndex
            pageItemController.weekTitleText = weekTitles[itemIndex]
            //  pageItemController.imageName = contentImages[itemIndex]
            //  println("item index\(itemIndex)")
            
            return pageItemController
        }
        
        return nil
    }
    
     //implement scrollview protocol
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        self.weeksCollectionView.contentOffset.x = scrollView.contentOffset.x
        
    }
    
    
}

extension WeeksContainerViewController : UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weeksData.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(collectionView.bounds.size.width, collectionView.bounds.size.height)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! WeeksCell
        cell.backgroundColor = UIColor.clearColor()
        
        cell.weeksLabel.text = weeksData[indexPath.row]
        // Configure the cell
        return cell
    }
    
    
}

