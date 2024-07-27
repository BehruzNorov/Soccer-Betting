import UIKit
import IQKeyboardManagerSwift
import RealmSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            IQKeyboardManager.shared.enable = true
            IQKeyboardManager.shared.resignOnTouchOutside = true

            window = UIWindow(frame: UIScreen.main.bounds)
            let tabBarController = TabBarController()

            let config = Realm.Configuration(
                schemaVersion: 4,
                migrationBlock: { migration, oldSchemaVersion in
                    if oldSchemaVersion < 4 {
                        migration.enumerateObjects(ofType: Details.className()) { oldObject, newObject in
                            newObject!["id"] = UUID().uuidString
                            if oldSchemaVersion < 2 {
                                newObject!["note"] = "Impressions were not given:("
                            }
                        }
                    }
                })

            Realm.Configuration.defaultConfiguration = config

        
        let teamRealmConfig = Realm.Configuration(
            fileURL: Realm.Configuration.defaultConfiguration.fileURL!.deletingLastPathComponent().appendingPathComponent("teamRealm.realm"),
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if oldSchemaVersion < 1 {
                }
            })
        
            do {
                let realm = try Realm(configuration: config)
                    print("Default Realm file path: \(realm.configuration.fileURL!)")
                    
                    let teamRealm = try Realm(configuration: teamRealmConfig)
                    print("teamRealm file path: \(teamRealm.configuration.fileURL!)")
            } catch {
                print("Error during loading Realm: \(error)")
            }

            window?.rootViewController = tabBarController
            window?.makeKeyAndVisible()
            return true
        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
