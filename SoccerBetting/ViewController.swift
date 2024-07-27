//
//  ViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ballImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var currentIndex = 1
        let totalImages = 4
        _ = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: true) { timer in
            self.ballImage.image = UIImage(named: "Group-\(currentIndex)")
            currentIndex += 1
            
            if currentIndex > totalImages {
                timer.invalidate()
                self.performSegue(withIdentifier: "goToMain", sender: self)
            }
        }
    }
}
