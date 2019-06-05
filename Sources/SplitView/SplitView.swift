import SwiftUI

public struct SplitView<Master: View, Detail: View>: View {
    public var master: Master
    public var detail: Detail
    @State public var preferredDisplayMode = UISplitViewController.DisplayMode.automatic

    public init(master: Master, detail: Detail) {
        self.init(master: master, detail: detail, preferredDisplayMode: .automatic)
    }

    init(master: Master, detail: Detail, preferredDisplayMode: UISplitViewController.DisplayMode) {
        self.master = master
        self.detail = detail
        self.preferredDisplayMode = preferredDisplayMode
    }

    public var body: some View {
        let controllers = [UIHostingController(rootView: master), UIHostingController(rootView: detail)]
        return SplitViewController(controllers: controllers, preferredDisplayMode: $preferredDisplayMode)
    }
}

public extension SplitView {
    func preferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) -> Self {
        return SplitView(master: master, detail: detail, preferredDisplayMode: preferredDisplayMode)
    }
}
