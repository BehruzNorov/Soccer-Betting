//
//  SaveTeamViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 24/07/24.
//

import UIKit

class SaveTeamViewController: UIViewController {
    var isAddingAllowed = false
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var cancel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        bigView.layer.borderWidth = 0.4
        cancel.layer.borderWidth = 0.4
        bigView.layer.borderColor = color
        cancel.layer.borderColor = color
    }
    @IBAction func canceBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction func saveAndExitPressed(_ sender: UIButton) {
        isAddingAllowed = true
        performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
    

    

}
