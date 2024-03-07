import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Créer une vue SwiftUI que vous souhaitez utiliser comme vue principale.
        let contentView = GetStartedView()

        // Utiliser un UIHostingController comme fenêtre pour une vue SwiftUI.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)  // Définir la vue racine ici
            self.window = window
            window.makeKeyAndVisible()
        }
    }

}
