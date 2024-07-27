//
//  DeleteMatchViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 22/07/24.
//

import UIKit

class DeleteMatchViewController: UIViewController {
    @IBOutlet weak var cancelOutlet: UIStackView!
    @IBOutlet weak var deleteOutlet: UIButton!
    @IBOutlet weak var deleteView: UIView!
    var isDeleteEnabled: Bool = false
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    override func viewDidLoad() {
        super.viewDidLoad()
        deleteView.layer.borderWidth = 0.4
        deleteView.layer.borderColor = color
        cancelOutlet.layer.borderWidth = 0.4
        cancelOutlet.layer.borderColor = color
        deleteOutlet.layer.borderWidth = 0.4
        deleteOutlet.layer.borderColor = color
    }
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        isDeleteEnabled = false
        self.performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        isDeleteEnabled = true
        self.performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
}
