import Foundation
import UIKit

struct Details1: Codable{
    var matchDate: String = ""
    var round: String = ""
    var firstTeamName: String = ""
    var firstTeamImageName: String = "back"
    var secondTeamName: String = ""
    var secondTeamImageName: String = "back"
    var stadiumName: String = ""
    var firstCoeffitcient: Float = 0.0
    var secondCoeffitcient: Float = 0.0
    var winOrLose: String = ""
    var coeffitient: Float = 0.0
    var sum: Float = 0.0
    var note: String = ""
    var firstTeamGoals: Int = 0
    var secondTeamGoals: Int = 0
    var firstYellowCards: Int = 0
    var secondYellowCards: Int = 0
    var firstRedCards: Int = 0
    var secondRedCards: Int = 0
    var firstBallControl: Float = 0.0
    var secondBallControl: Float = 0.0
    var firstExpectedGoals: Int = 0
    var secondExpectedGoals: Int = 0
    var firstCorners: Int = 0
    var secondCorners: Int = 0


}
