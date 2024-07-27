//
//  DetailsViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 20/07/24.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var firstGoalNumbersOutlet: UITextField!
    @IBOutlet weak var secondGoalNumberOutlet: UITextField!
    
    @IBOutlet weak var firstYellowOutlet: UITextField!
    @IBOutlet weak var secondYellowOutlet: UITextField!
    @IBOutlet weak var firstRedOutlet: UITextField!
    @IBOutlet weak var secondRedOutlet: UITextField!
    @IBOutlet weak var firstControlOutlet: UITextField!
    @IBOutlet weak var secondControlOutlet: UITextField!
    @IBOutlet weak var firstExpectesGoalsOutlet: UITextField!
    @IBOutlet weak var secondExpectedGoalsOutlet: UITextField!
    @IBOutlet weak var firstCornerOutlet: UITextField!
    @IBOutlet weak var secondCornerOutlet: UITextField!
    @IBOutlet weak var saveButtonPressed: UIButton!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var bigImg: UIImageView!
    
    var data: DetailsFirstHalf?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        if let details = data {
            print("Match Date: \(details.matchDate)")
            print("Round: \(details.round)")
            print("First Team: \(details.firstTameName)")
            print("Second Team: \(details.secondTeamName)")
            print("Location: \(details.location)")
            print("First Coefficient: \(details.firstCoeffitcient)")
            print("Second Coefficient: \(details.secondCoeffitcient)")
            print("Note: \(details.note)")
            print("Win or Loss: \(details.winOrLoss)")
            print("Coefficient: \(details.coeffff)")
            print("Sum: \(details.sum)")
        }else{
            print("Error")
        }
        backButton.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        addBottomBorder(to: firstRedOutlet)
        addBottomBorder(to: firstCornerOutlet)
        addBottomBorder(to: firstYellowOutlet)
        addBottomBorder(to: firstControlOutlet)
        addBottomBorder(to: firstGoalNumbersOutlet)
        addBottomBorder(to: firstExpectesGoalsOutlet)
        addBottomBorder(to: secondRedOutlet)
        addBottomBorder(to: secondCornerOutlet)
        addBottomBorder(to: secondYellowOutlet)
        addBottomBorder(to: secondControlOutlet)
        addBottomBorder(to: secondGoalNumberOutlet)
        addBottomBorder(to: secondExpectedGoalsOutlet)
    }
    private func addBottomBorder(to view: UITextField) {
        let color = UIColor.darkGray
        let thickness = 0.5
        view.backgroundColor = UIColor.clear
        view.attributedPlaceholder = NSAttributedString(string: view.placeholder!, attributes: [
            .foregroundColor: UIColor.darkGray
        ])
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
    private func buttonChange(){        
        if firstRedOutlet.text?.isEmpty != true && firstCornerOutlet.text?.isEmpty != true && firstYellowOutlet.text?.isEmpty != true && firstControlOutlet.text?.isEmpty != true && firstGoalNumbersOutlet.text?.isEmpty != true && firstExpectesGoalsOutlet.text?.isEmpty != true && secondRedOutlet.text?.isEmpty != true && secondCornerOutlet.text?.isEmpty != true && secondYellowOutlet.text?.isEmpty != true && secondControlOutlet.text?.isEmpty != true && secondGoalNumberOutlet.text?.isEmpty != true && secondExpectedGoalsOutlet.text?.isEmpty != true{
                
            
                saveButtonPressed.isUserInteractionEnabled = true
                saveButtonPressed.backgroundColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1)
                saveButtonPressed.tintColor = UIColor.white
           
            
        }else{
            saveButtonPressed.isUserInteractionEnabled = false
            saveButtonPressed.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            saveButtonPressed.tintColor = UIColor.darkGray
        }
        
    }
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func firstGoalNumbersAction(_ sender: UITextField) {
        buttonChange()
    }

    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let firstGoals = Int(firstGoalNumbersOutlet.text ?? "") ?? 0
        let secondGoals = Int(secondGoalNumberOutlet.text ?? "") ?? 0
        let firstYellow = Int(firstYellowOutlet.text ?? "") ?? 0
        let secondYellow = Int(secondYellowOutlet.text ?? "") ?? 0
        let firstRed = Int(firstRedOutlet.text ?? "") ?? 0
        let secondRed = Int(secondRedOutlet.text ?? "") ?? 0
        let firstControl = Float(firstControlOutlet.text ?? "") ?? 0.0
        let secondControl = Float(secondControlOutlet.text ?? "") ?? 0.0
        let firstExpectedGoals = Int(firstExpectesGoalsOutlet.text ?? "") ?? 0
        let secondExpectedGoals = Int(secondExpectedGoalsOutlet.text ?? "") ?? 0
        let firstCorner = Int(firstCornerOutlet.text ?? "") ?? 0
        let secondCorner = Int(secondCornerOutlet.text ?? "") ?? 0
        let details = Details1(matchDate: data!.matchDate, round: data!.round, firstTeamName: data!.firstTameName,firstTeamImageName: data!.firstTeamImage, secondTeamName: data!.secondTeamName, secondTeamImageName: data!.secondTeamImageName, stadiumName: data!.location, firstCoeffitcient: data!.firstCoeffitcient, secondCoeffitcient: data!.secondCoeffitcient, winOrLose: data!.winOrLoss, coeffitient: data!.coeffff, sum: data!.sum, note: data!.note, firstTeamGoals: firstGoals, secondTeamGoals: secondGoals, firstYellowCards: firstYellow, secondYellowCards: secondYellow, firstRedCards: firstRed, secondRedCards: secondRed, firstBallControl: firstControl, secondBallControl: secondControl, firstExpectedGoals: firstExpectedGoals, secondExpectedGoals: secondExpectedGoals, firstCorners: firstCorner, secondCorners: secondCorner)
        
        performSegue(withIdentifier: "goToSavedMatches", sender: details)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToSavedMatches" {
                if let detailsVC = segue.destination as? SavedMatchesViewController, let data = sender as? Details1 {
                    detailsVC.information = data
                }
            }
        }
    
    


}
