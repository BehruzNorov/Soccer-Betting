//
//  FifthTabViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class FifthTabViewController: UIViewController {
    @IBOutlet weak var addTeamBtn: UIButton!
    @IBOutlet weak var savedTeamBtn: UIButton!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        
    }
    @IBAction func addTeamBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "addTeamSegue", sender: self)
    }
    @IBAction func savedTeamBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSaveds", sender: self)
    }
    
    
    
}
