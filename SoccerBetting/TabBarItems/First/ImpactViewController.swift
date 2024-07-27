//
//  ImpactViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//

import UIKit

class ImpactViewController: UIViewController {
    @IBOutlet weak var impactOutlet: UIBarButtonItem!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        impactOutlet.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
    }
    @IBAction func impactAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
