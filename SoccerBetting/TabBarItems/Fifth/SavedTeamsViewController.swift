//
//  SavedTeamsViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 24/07/24.
//

import UIKit
import RealmSwift

class SavedTeamsViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var smallGenderView: UIView!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var gender = "Male"
    var isDeleteAllowed = false
    let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    let teamRealm = try! Realm()
    var clubs: Results<Team>?
    var filtredClubs: Results<Team>?
    override func viewDidLoad() {
        super.viewDidLoad()
        smallGenderView.layer.borderWidth = 0.4
        genderView.layer.borderWidth = 0.4
        smallGenderView.layer.borderColor = color
        genderView.layer.borderColor = color
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideBigGenderView))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        tableView.dataSource = self
        tableView.delegate = self
        genderView.isHidden = true
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        backButton.image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        let nib = UINib(nibName: "AddedTeamsCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "AddedTeamsIdentifier")
        loadTeams()
    }
    @objc func hideBigGenderView() {
        genderView.isHidden = true
    }
    @IBAction func backButtonGetsPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func selectGenderBtn(_ sender: UIButton) {
        genderView.isHidden = false
    }
    @IBAction func unwindToMatchAddingVC(_ segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? DeleteTeamViewController {
            isDeleteAllowed = sourceVC.isDeleteAllowed
        }
        
        if isDeleteAllowed {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let matchDetails = clubs?[indexPath.row] else { return }
            
            let teamRealm = try! Realm()
            try! teamRealm.write {
                teamRealm.delete(matchDetails)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    func didPressDeleteButton(cell: AddedTeamsCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            performSegue(withIdentifier: "goToDeleteTeamSegue", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToDetailsIdentifier" {
            if let destinationVC = segue.destination as? ShowTeamVC, let indexPath = tableView.indexPathForSelectedRow, let data = filtredClubs?[indexPath.row] {
                destinationVC.indexPath = indexPath.row
                destinationVC.teams = clubs
            }
        }
    }
    @IBAction func genderButtons(_ sender: UIButton) {
        genderLabel.text = sender.titleLabel?.text
        gender = (sender.titleLabel?.text)!
        genderView.isHidden = true
        updateMatches()
        
    }
    @IBAction func dismissGenderView(_ sender: UIButton) {
        genderView.isHidden = true
    }
    
    
    func loadTeams(){
        clubs = teamRealm.objects(Team.self)
        print("matches are loaded \(clubs?.count) times")
        updateMatches()
    }
    func updateMatches(){
        filtredClubs = clubs?.filter("gender == %@", genderLabel.text!)
        tableView.reloadData()
    }
}
extension SavedTeamsViewController: UITableViewDelegate, UITableViewDataSource, SavedTeamsCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtredClubs?.count ?? 0
    }
    

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddedTeamsIdentifier", for: indexPath) as? AddedTeamsCell else {
            fatalError("The dequeued cell is not an instance of AddedTeamsCell.")
        }
        
        if let data = filtredClubs?[indexPath.row] {
            cell.colorImageView.image = UIImage(named: data.teamColor)
            cell.teamName.text = data.teamName
            cell.genderLabel.text = data.gender
            cell.contentView.backgroundColor = UIColor.clear
            cell.info = data
            cell.delegate = self
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToDetailsIdentifier", sender: self)
    }
    
}
