//
//  ShowTeamVC.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 25/07/24.
//

import UIKit
import RealmSwift

class ShowTeamVC: UIViewController, DltPlayerDelegate {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var navigationTitle: UINavigationItem!
    
    @IBOutlet weak var teamColor: UIImageView!
    @IBOutlet weak var firstNama: UITextField!
    @IBOutlet weak var firstRole: UITextField!
    @IBOutlet weak var secondName: UITextField!
    @IBOutlet weak var secondRole: UITextField!
    @IBOutlet weak var thirdName: UITextField!
    @IBOutlet weak var thirdRole: UITextField!
    @IBOutlet weak var fourthName: UITextField!
    @IBOutlet weak var fourthRole: UITextField!
    @IBOutlet weak var fifthName: UITextField!
    @IBOutlet weak var fifthRole: UITextField!
    
    
    
    @IBOutlet weak var bottomLineView: UIView!
    
    
    
    var indexPath: Int = 0
    
    var isDelete = false
    var teams:  Results<Team>?
    var team = Team()
    let teamRealm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        addBottomBorder(to: firstNama)
        addBottomBorder(to: firstRole)
        addBottomBorder(to: secondName)
        addBottomBorder(to: secondRole)
        addBottomBorder(to: thirdName)
        addBottomBorder(to: thirdRole)
        addBottomBorder(to: fourthName)
        addBottomBorder(to: fourthRole)
        addBottomBorder(to: fifthName)
        addBottomBorder(to: fifthRole)
        
        addBottomLine(to: bottomLineView)
        if let teams = teams, indexPath < teams.count {
            team = teams[indexPath]
            print(team.teamColor)
        } else {
            print("Error: teams data is not available or indexPath is out of bounds")
        }
        navigationTitle.title = team.teamName
        setupUI()
    }
    
    private func addBottomBorder(to view: UITextField) {
        view.isUserInteractionEnabled = false
        view.backgroundColor = UIColor.clear
        view.attributedPlaceholder = NSAttributedString(string: view.placeholder!, attributes: [
            .foregroundColor: UIColor.darkGray
        ])
        let color = UIColor.darkGray
        let thickness = 0.5
        let bottomBorder = UITextField()
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
    private func addBottomLine(to view: UIView) {
        let color = UIColor.systemBlue
        let thickness = 0.5
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
    
    func setupUI() {
        teamColor.image = UIImage(named: team.teamColor)
        firstNama.text = team.firstName
        firstRole.text = team.firstRole
        secondName.text = team.secondName
        secondRole.text = team.secondRole
        thirdName.text = team.thirdName
        thirdRole.text = team.thirdRole
        fourthName.text = team.fourthName
        fourthRole.text = team.fourthRole
        fifthName.text = team.fifthName
        fifthRole.text = team.fifthRole
        }
    
    
    func presentDltPlayerViewController(order: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dltPlayerVC = storyboard.instantiateViewController(withIdentifier: "DltPlayerViewController") as? DltPlayerViewController {
            dltPlayerVC.order = order
            dltPlayerVC.delegate = self
            present(dltPlayerVC, animated: true)
        }
    }
    func didPressDelete(order: String) {
        updateTeamProperty {
            switch order {
            case "first":
                team.firstName = ""
                team.firstRole = ""
            case "second":
                team.secondName = ""
                team.secondRole = ""
            case "third":
                team.thirdName = ""
                team.thirdRole = ""
            case "fourth":
                team.fourthName = ""
                team.fourthRole = ""
            case "fifth":
                team.fifthName = ""
                team.fifthRole = ""
            default:
                break
            }
        }
    }
    @IBAction func firstDeletePressed(_ sender: UIButton) {
        presentDltPlayerViewController(order: "first")

        }
        
    @IBAction func secondDelete(_ sender: UIButton) {
        presentDltPlayerViewController(order: "second")

    }
    
    @IBAction func thirdDeletePressed(_ sender: UIButton) {
        presentDltPlayerViewController(order: "third")
    }
    
    @IBAction func fourthDeletePressed(_ sender: UIButton) {
        presentDltPlayerViewController(order: "fourth")

    }
    
    @IBAction func fifthDeletePressed(_ sender: UIButton) {
        presentDltPlayerViewController(order: "fifth")

    }
    
    @IBAction func backBtnPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    func updateTeamProperty(_ updates: () -> Void) {
        do {
            try teamRealm.write {
                updates()
            }
            setupUI()
        } catch {
            print("Error updating team properties: \(error)")
        }
    }
}
