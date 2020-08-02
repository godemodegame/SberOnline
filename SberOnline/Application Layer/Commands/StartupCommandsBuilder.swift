import UIKit

final class StartupCommandsBuilder {
    private var window: UIWindow?

    func setWindow(_ window: UIWindow?) -> StartupCommandsBuilder {
        self.window = window
        return self
    }

    func buildApp() -> [Command] {
        [InitialViewControllerCommand(window: window)]
    }
}
