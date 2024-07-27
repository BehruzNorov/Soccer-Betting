//
//  HistoricalViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//

import UIKit

class HistoricalViewController: UIViewController {
    @IBOutlet weak var historicalOutlet: UIBarButtonItem!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        historicalOutlet.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
    }
    @IBAction func historicalAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    


}
