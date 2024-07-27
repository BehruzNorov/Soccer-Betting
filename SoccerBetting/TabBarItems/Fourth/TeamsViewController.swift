//
//  TeamsViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 17/07/24.
//

import UIKit

class TeamsViewController: UIViewController {
    @IBOutlet weak var topTableView: UIView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var retrieveView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var retrieveImg: UIImageView!
    @IBOutlet weak var savedMatchesOutlet: UIButton!
    let clubs = Data().teams
    override func viewDidLoad() {
        super.viewDidLoad()
        savedMatchesOutlet.layer.cornerRadius = 5
        addBlueBorder(to: retrieveView, img: retrieveImg)
        bigView.layer.borderWidth = 0.4
        bigView.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        retrieveView.isHidden = true
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "TeamsCell", bundle: nil), forCellReuseIdentifier: "teamsCellIdentifier")
        addBottomBorder(to: topTableView, color: UIColor(red: 201/255, green: 138/255, blue: 186/255, alpha: 1), thickness: 0.5)
        backButton.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        deleteButton.image = UIImage(named: "deleteIcon")?.withRenderingMode(.alwaysOriginal)
        
    }
        private func addBottomBorder(to view: UIView, color: UIColor, thickness: CGFloat) {
                let bottomBorder = UIView()
                bottomBorder.backgroundColor = color
                bottomBorder.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(bottomBorder)
                
                NSLayoutConstraint.activate([
                    bottomBorder.heightAnchor.constraint(equalToConstant: thickness),
                    bottomBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    bottomBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    bottomBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
            }
    
    @IBAction func unwindToMatchAddingVC(_ segue: UIStoryboardSegue) {
            if let sourceVC = segue.source as? AlertViewController {
                scrollView.isHidden = sourceVC.scrollViewIsHidden
                retrieveView.isHidden = sourceVC.retrieveViewIsHidden
            }
        }
    @IBAction func deleteAction(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "clearSegue", sender: self)
    }
    @IBAction func showSavedMatches(_ sender: UIButton) {
        performSegue(withIdentifier: "showMatchesSegue", sender: self)
        
        
    }
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func retrieveTable(_ sender: UIButton) {
        scrollView.isHidden = false
        retrieveView.isHidden = true
    }
    

}
extension TeamsViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        clubs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamsCellIdentifier") as! TeamsCell
        let data = clubs[indexPath.row]
        cell.stayedPlace.text = "\(indexPath.row + 1)"
        cell.teamImage.image = UIImage(named: "\(data.imageName)")
        cell.teamName.text = "\(data.name)"
        let points = (data.w * 3) + data.d
        cell.totalPoints.text = "\(points)"
        let matches = data.w + data.d + data.l
        cell.totalGames.text = "\(matches)"
        cell.wins.text = "\(data.w)"
        cell.draws.text = "\(data.d)"
        cell.losts.text = "\(data.l)"
        cell.differenceOfGoals.text = "\(data.gf - data.ga)"
        cell.goalsDivision.text = "\(data.gf)/\(data.ga)"
        return cell
    }
    
    
    
    
}
