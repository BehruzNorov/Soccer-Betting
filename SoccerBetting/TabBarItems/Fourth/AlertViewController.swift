//
//  AlertViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 18/07/24.
//

import UIKit

class AlertViewController: UIViewController {
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var cancelBtn: UIView!
    @IBOutlet weak var clearBtn: UIButton!
    var scrollViewIsHidden = false
    var retrieveViewIsHidden = true
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.layer.borderWidth = 0.5
        alertView.layer.borderColor = color
        clearBtn.layer.borderWidth = 0.4
        clearBtn.layer.borderColor = color
        cancelBtn.layer.borderWidth = 0.4
        cancelBtn.layer.borderColor = color
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        scrollViewIsHidden = false
         retrieveViewIsHidden = true
        self.performSegue(withIdentifier: "unwindToMatchAddingViewController", sender: self)
    }
    @IBAction func clear(_ sender: UIButton) {
       scrollViewIsHidden = true
        retrieveViewIsHidden = false
        self.performSegue(withIdentifier: "unwindToMatchAddingViewController", sender: self)
    }
    

    

}
