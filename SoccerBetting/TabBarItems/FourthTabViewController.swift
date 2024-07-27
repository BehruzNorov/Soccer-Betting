//
//  FourthTabViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class FourthTabViewController: UIViewController {

    @IBOutlet weak var matchesButtonOutlet: UIButton!
    @IBOutlet weak var addMatchOutlet: UIButton!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        matchesButtonOutlet.layer.cornerRadius = 2
        addMatchOutlet.layer.cornerRadius = 2
    }
    @IBAction func showTableButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToStandingsSegue", sender: self)
    }
    @IBAction func addMatchButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAddMatchSegue", sender: self)
    }
}
