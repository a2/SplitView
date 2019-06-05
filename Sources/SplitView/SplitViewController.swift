import SwiftUI

struct SplitViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var preferredDisplayMode: UISplitViewController.DisplayMode

    func makeUIViewController(context: UIViewControllerRepresentableContext<SplitViewController>) -> UISplitViewController {
        let splitViewController = UISplitViewController()
        splitViewController.preferredDisplayMode = preferredDisplayMode
        splitViewController.viewControllers = controllers
        return splitViewController
    }

    func updateUIViewController(_ uiViewController: UISplitViewController, context: UIViewControllerRepresentableContext<SplitViewController>) {
        uiViewController.preferredDisplayMode = preferredDisplayMode
        uiViewController.viewControllers = controllers
    }
}
