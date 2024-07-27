//
//  FeaturesViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//

import UIKit

class FeaturesViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigImg, img: bigImg)

        backButton.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
    }
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    

    

}
