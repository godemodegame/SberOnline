import SwiftUI

final class StatsAssembly: Assembly {
    static func assembleModule() -> UIViewController {
        UIHostingController(rootView: StatsView())
    }
}
