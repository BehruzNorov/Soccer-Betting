//
//  SignificantViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//

import UIKit

class SignificantViewController: UIViewController {
    @IBOutlet weak var significantOutlet: UIBarButtonItem!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        significantOutlet.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
    }
    
    @IBAction func significantAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
   

}
