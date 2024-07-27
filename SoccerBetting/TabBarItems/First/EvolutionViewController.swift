//
//  EvolutionViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 14/07/24.
//

import UIKit

class EvolutionViewController: UIViewController {
    @IBOutlet weak var evolutionOutlet: UIBarButtonItem!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        evolutionOutlet.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        addLeftBorder(to: firstView, color: .green, width: 2.0)
        addLeftBorder(to: secondView, color: .white, width: 2.0)
        addLeftBorder(to: thirdView, color: .red, width: 2.0)
    }
    @IBAction func evolutionAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    private func addLeftBorder(to view: UIView, color: UIColor, width: CGFloat) {
            let border = CALayer()
            border.backgroundColor = color.cgColor
            border.frame = CGRect(x: 0, y: 0, width: width, height: view.frame.height)
            view.layer.addSublayer(border)
        }
}
