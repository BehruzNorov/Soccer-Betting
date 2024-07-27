//
//  TeamDescriptionViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 16/07/24.
//

import UIKit

class TeamDescriptionViewController: UIViewController {
    @IBOutlet weak var desriptionView: UIView!
    @IBOutlet weak var teamDescriptionScrollView: UIScrollView!
    @IBOutlet weak var descriptionImage: UIImageView!
    @IBOutlet weak var backButtonOutlet: UIBarButtonItem!
    @IBOutlet weak var descriptionNavigation: UINavigationItem!
    var data : Teams!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        backButtonOutlet.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        if let image = UIImage(named: data.viewImage) {
                   descriptionImage.image = image
               }
        descriptionNavigation.title = data.name
        backButtonOutlet.target = self
        backButtonOutlet.action = #selector(customBackButtonTapped)
    }
    @objc func customBackButtonTapped() {
           navigationController?.popViewController(animated: true)
       }
}
