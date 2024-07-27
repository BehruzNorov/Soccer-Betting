import Foundation
import RealmSwift

class Details: Object, Codable{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var matchDate: String = ""
    @objc dynamic var round: String = ""
    @objc dynamic var firstTeamName: String = ""
    @objc dynamic var firstTeamImageName: String = ""
    @objc dynamic var secondTeamName: String = ""
    @objc dynamic var secondTeamImageName: String = ""
    @objc dynamic var stadiumName: String = ""
    @objc dynamic var firstCoeffitcient: Float = 0.0
    @objc dynamic var secondCoeffitcient: Float = 0.0
    @objc dynamic var winOrLose: String = ""
    @objc dynamic var coeffitient: Float = 0.0
    @objc dynamic var sum: Float = 0.0
    @objc dynamic var note: String = ""
    @objc dynamic var firstTeamGoals: Int = 0
    @objc dynamic var secondTeamGoals: Int = 0
    @objc dynamic var firstYellowCards: Int = 0
    @objc dynamic var secondYellowCards: Int = 0
    @objc dynamic var firstRedCards: Int = 0
    @objc dynamic var secondRedCards: Int = 0
    @objc dynamic var firstBallControl: Float = 0.0
    @objc dynamic var secondBallControl: Float = 0.0
    @objc dynamic var firstExpectedGoals: Int = 0
    @objc dynamic var secondExpectedGoals: Int = 0
    @objc dynamic var firstCorners: Int = 0
    @objc dynamic var secondCorners: Int = 0

    override static func primaryKey() -> String? {
            return "id"
        }
}
