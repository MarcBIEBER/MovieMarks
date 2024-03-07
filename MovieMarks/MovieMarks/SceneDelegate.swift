import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Utilisez cette méthode pour configurer et attacher la UIWindow `window` à la scène fournie.
        // Si vous utilisez un storyboard, la propriété `window` sera automatiquement initialisée et attachée à la scène.
        // Si vous n'utilisez pas de storyboard, vous devez attacher votre vue à la `window` ici.

        guard let _ = (scene as? UIWindowScene) else { return }
    }

    // Les autres méthodes de delegate viennent ici au besoin, comme sceneDidDisconnect, sceneDidBecomeActive, etc.
}
