//
//  DltPlayerViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 25/07/24.
//

import UIKit
protocol DltPlayerDelegate: AnyObject {
    func didPressDelete(order: String)
}

class DltPlayerViewController: UIViewController {
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var deleteView: UIView!
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    var isDelete = false
    
    var order = ""
    weak var delegate: DltPlayerDelegate?
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
        isDelete = true
        delegate?.didPressDelete(order: order)
        dismiss(animated: true)
        
    }
    
}
