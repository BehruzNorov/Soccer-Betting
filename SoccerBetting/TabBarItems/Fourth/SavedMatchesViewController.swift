import UIKit
import RealmSwift

class SavedMatchesViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    var matches: Results<Details>?
    var information: Details1?
    let match = Details()
    var isDeleteEnabled: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        backButton.image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideThreeDotView))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        matches = realm.objects(Details.self)
        
        if let data = information {
            match.matchDate = data.matchDate
            match.round = data.round
            match.firstTeamName = data.firstTeamName
            match.firstTeamImageName = data.firstTeamImageName
            match.firstBallControl = data.firstBallControl
            match.firstCoeffitcient = data.firstCoeffitcient
            match.firstRedCards = data.firstRedCards
            match.firstYellowCards = data.firstYellowCards
            match.firstCorners = data.firstCorners
            match.firstExpectedGoals = data.firstExpectedGoals
            match.coeffitient = data.coeffitient
            match.winOrLose = data.winOrLose
            match.sum = data.sum
            match.stadiumName = data.stadiumName
            match.firstTeamGoals = data.firstTeamGoals
            match.secondTeamName = data.secondTeamName
            match.secondTeamImageName = data.secondTeamImageName
            match.secondBallControl = data.secondBallControl
            match.secondCoeffitcient = data.secondCoeffitcient
            match.secondRedCards = data.secondRedCards
            match.secondYellowCards = data.secondYellowCards
            match.secondCorners = data.secondCorners
            match.secondExpectedGoals = data.secondExpectedGoals
            match.secondTeamGoals = data.secondTeamGoals
            
            saveMatch(match: match)
        } else {
            print("Error")
        }
        tableView.register(UINib(nibName: "SavedMatchesCell", bundle: nil), forCellReuseIdentifier: "matchesCell")
        
        loadMatch()
    }
    
    @objc func hideThreeDotView() {
        for cell in tableView.visibleCells {
            if let savedMatchCell = cell as? SavedMatchesCell {
                savedMatchCell.threeDotView.alpha = 0
            }
        }
    }
    
    @IBAction func backButtonGetsPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goBack", sender: self)
    }
    
    func loadMatch() {
        matches = realm.objects(Details.self)
        print("Jobs loaded: \(matches?.count ?? 0)")
    }
    
    func saveMatch(match: Details) {
        do {
            try realm.write {
                realm.add(match)
            }
        } catch {
            print(error)
        }
        tableView.reloadData()
        print("Job saved and table view reloaded")
    }
    
    @IBAction func unwindToMatchAddingVC(_ segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? DeleteMatchViewController {
            isDeleteEnabled = sourceVC.isDeleteEnabled
        }
        
        if isDeleteEnabled {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let matchDetails = matches?[indexPath.row] else { return }
            
            let realm = try! Realm()
            try! realm.write {
                realm.delete(matchDetails)
            }
            
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func didPressDeleteButton(cell: SavedMatchesCell) {
        if let indexPath = tableView.indexPath(for: cell) {
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            performSegue(withIdentifier: "deleteMatchSegue", sender: self)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMatchDetails" {
            if let destinationVC = segue.destination as? WatchMatchViewController, let indexPath = tableView.indexPathForSelectedRow, let data = matches?[indexPath.row] {
                destinationVC.indexPath = indexPath.row
                destinationVC.games = matches
            }
        }
    }
}

extension SavedMatchesViewController: UITableViewDataSource, UITableViewDelegate, SavedMatchesCellDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        matches?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "matchesCell", for: indexPath) as! SavedMatchesCell
        
        if let item = matches?[indexPath.row] {
            cell.date.text = item.matchDate
            cell.firstTeamGoals.text = "\(item.firstTeamGoals)"
            cell.secondTeanGoals.text = "\(item.secondTeamGoals)"
            cell.firstTeamImage.image = UIImage(named: item.firstTeamImageName)
            cell.secondTeamImage.image = UIImage(named: item.secondTeamImageName)
            cell.firstTeamName.text = item.firstTeamName
            cell.secondTeamName.text = item.secondTeamName
            cell.location.text = item.stadiumName
            cell.delegate = self
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        print("Success \(indexPath.row)")
        performSegue(withIdentifier: "showMatchDetails", sender: self)
    }
}
