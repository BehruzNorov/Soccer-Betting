import UIKit
import RealmSwift

class Team: Object {
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var teamName: String = ""
    @objc dynamic var teamColor:String = "blue"
    @objc dynamic var leagueName: String = ""
    @objc dynamic var gender: String = "Male"
    @objc dynamic var firstName: String = ""
    @objc dynamic var firstRole: String = ""
    @objc dynamic var secondName: String = ""
    @objc dynamic var secondRole: String = ""
    @objc dynamic var thirdName: String = ""
    @objc dynamic var thirdRole: String = ""
    @objc dynamic var fourthName: String = ""
    @objc dynamic var fourthRole: String = ""
    @objc dynamic var fifthName: String = ""
    @objc dynamic var fifthRole: String = ""
    override static func primaryKey() -> String? {
            return "id"
        }
}
