//
//  CurrentWeekViewController.swift
//  codepath_app
//
//  Created by Jules Walter on 8/3/15.
//  Copyright (c) 2015 Jules Walter. All rights reserved.
//

import UIKit

class CurrentWeekViewController: UIViewController {
    

    @IBOutlet weak var courseTitleLabel: UILabel!
    @IBOutlet weak var classCardImageView: UIImageView!
    @IBOutlet weak var currentWeekLabel: UILabel!
    @IBOutlet weak var weekTitleLabel: UILabel!
    @IBOutlet weak var weekTimeLocationLabel: UILabel!
    @IBOutlet weak var weekDescriptionText: UITextView!
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var checkinButton: UIButton!
    @IBOutlet weak var absenceButton: UIButton!
    var itemIndex: Int?
    
    var weekTitleText: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        weekTitleLabel.text  = self.weekTitleText
        classCardImageView.image = UIImage(named:"week1_class_card")
//        classCardImageView.image = self.firstImage
        firstImageView.image = UIImage(named:"week1_first_image")
        secondImageView.image = UIImage(named:"week1_second_image")
        thirdImageView.image = UIImage(named:"week1_third_image")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressClose(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
