//
//  WatchMatchViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 22/07/24.
//

import UIKit
import RealmSwift

class WatchMatchViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var matchDate: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    @IBOutlet weak var team1ImageName: UIImageView!
    @IBOutlet weak var team2ImageName: UIImageView!
    @IBOutlet weak var team1goals: UILabel!
    @IBOutlet weak var team2Goals: UILabel!
    @IBOutlet weak var round: UILabel!
    @IBOutlet weak var team1Goals1: UILabel!
    @IBOutlet weak var team2Goals2: UILabel!
    @IBOutlet weak var yellow1: UILabel!
    @IBOutlet weak var yellow2: UILabel!
    @IBOutlet weak var red1: UILabel!
    @IBOutlet weak var red2: UILabel!
    @IBOutlet weak var ballControl1: UILabel!
    @IBOutlet weak var ballControl2: UILabel!
    @IBOutlet weak var expected1: UILabel!
    @IBOutlet weak var expected2: UILabel!
    @IBOutlet weak var corner1: UILabel!
    @IBOutlet weak var corner2: UILabel!
    @IBOutlet weak var note: UILabel!
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var match = Details()
    var games: Results<Details>?
    let realm = try! Realm()
    var indexPath: Int = 0
    
   override func viewDidLoad() {
       super.viewDidLoad()
       addBlueBorder(to: bigView, img: imageView)
       backButton.image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)

       
       if let games = games, indexPath < games.count{
           match = games[indexPath]
           matchDate.text = match.matchDate
           location.text = match.stadiumName
           team1Name.text = match.firstTeamName
           team2Name.text = match.secondTeamName
           team1ImageName.image = UIImage(named: match.firstTeamImageName)
           team2ImageName.image = UIImage(named: match.secondTeamImageName)
           team1goals.text = "\(match.firstTeamGoals)"
           team2Goals.text = "\(match.secondTeamGoals)"
           round.text = match.round
           team1Goals1.text = "\(match.firstTeamGoals)"
           team2Goals2.text = "\(match.secondTeamGoals)"
           yellow1.text = "\(match.firstYellowCards)"
           yellow2.text = "\(match.secondYellowCards)"
           red1.text = "\(match.firstRedCards)"
           red2.text = "\(match.secondRedCards)"
           ballControl1.text = "\(match.firstBallControl)%"
           ballControl2.text = "\(match.secondBallControl)%"
           expected1.text = "\(match.firstExpectedGoals / 100)"
           expected2.text = "\(match.secondExpectedGoals / 100)"
           corner1.text = "\(match.firstCorners)"
           corner2.text = "\(match.secondCorners)"
           note.text = match.note
       }else{
           print("error while fetching data to show game's details")
       }
   }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true)

    }
    
    
}
