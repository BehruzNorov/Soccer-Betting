//
//  SecondTabViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class SecondTabViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImg: UIImageView!
    
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var thirdImg: UIImageView!
    
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fourthImg: UIImageView!
    
    @IBOutlet weak var fifthView: UIView!
    @IBOutlet weak var fifthImage: UIImageView!
    
    @IBOutlet weak var sixthView: UIView!
    @IBOutlet weak var sixthImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: mainView, img: mainImg)
        addBlueBorder(to: secondView, img: secondImg)
        addBlueBorder(to: thirdView, img: thirdImg)
        addBlueBorder(to: fourthView, img: fourthImg)
        addBlueBorder(to: fifthView, img: fifthImage)
        addBlueBorder(to: sixthView, img: sixthImage)
    }
    

    

}
