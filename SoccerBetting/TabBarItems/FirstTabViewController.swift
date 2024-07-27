//
//  FirstTabViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class FirstTabViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var featuresOutlet: UIView!
    @IBOutlet weak var featuresImg: UIImageView!
    @IBOutlet weak var historicalOutlet: UIView!
    @IBOutlet weak var historicalImg: UIImageView!
    @IBOutlet weak var significantOutlet: UIView!
    @IBOutlet weak var significantImg: UIButton!
    @IBOutlet weak var signifImg: UIImageView!
    @IBOutlet weak var evolutionOutlet: UIView!
    @IBOutlet weak var evolutionImg: UIButton!
    @IBOutlet weak var evolImg: UIImageView!
    @IBOutlet weak var impactOutlet: UIView!
    @IBOutlet weak var impactImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: mainView, img: mainImg)
        addBlueBorder(to: secondView, img: secondImg)
        addBlueBorder(to: featuresOutlet, img: featuresImg)
        addBlueBorder(to: historicalOutlet, img: historicalImg)
        addBlueBorder(to: significantOutlet, img: signifImg)
        addBlueBorder(to: evolutionOutlet, img: evolImg)
        addBlueBorder(to: impactOutlet, img: impactImg)
       
    }
    
    
    

    @IBAction func featuresAction(_ sender: UIButton) {
        print("features")
        performSegue(withIdentifier: "featuresSegue", sender: self)
    }
    
    @IBAction func historicalAction(_ sender: UIButton) {
        print("historical")
        performSegue(withIdentifier: "historicalSegue", sender: self)
    }
    @IBAction func significantAction(_ sender: UIButton) {
        print("significant")
        performSegue(withIdentifier: "significantSegue", sender: self)
    }
    @IBAction func evolutionAction(_ sender: UIButton) {
        print("evolution")
        performSegue(withIdentifier: "evolutionSegue", sender: self)
    }
    @IBAction func impactAction(_ sender: UIButton) {
        print("impact")
        performSegue(withIdentifier: "impactSegue", sender: self)
    }
    
   

}
