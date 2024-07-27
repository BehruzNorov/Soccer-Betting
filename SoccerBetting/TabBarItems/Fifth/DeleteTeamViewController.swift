//
//  DeleteTeamViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 25/07/24.
//

import UIKit

class DeleteTeamViewController: UIViewController {
    @IBOutlet weak var deleteView: UIView!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var delete: UIButton!
    var isDeleteAllowed = false
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    override func viewDidLoad() {
        super.viewDidLoad()
        delete.layer.borderWidth = 0.4
        cancel.layer.borderWidth = 0.4
        deleteView.layer.borderWidth = 0.4
        delete.layer.borderColor = color
        cancel.layer.borderColor = color
        deleteView.layer.borderColor = color
        
        
    }
    @IBAction func cancelBtnPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
    @IBAction func deleteBtnPressed(_ sender: UIButton) {
        
        isDeleteAllowed = true
        performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
    

    

}
