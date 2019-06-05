import SwiftUI

public struct SplitView<Master: View, Detail: View>: View {
    public var master: UIHostingController<Master>
    public var detail: UIHostingController<Detail>
    @State public var preferredDisplayMode = UISplitViewController.DisplayMode.automatic

    public init(master: Master, detail: Detail) {
        self.master = UIHostingController(rootView: master)
        self.detail = UIHostingController(rootView: detail)
    }

    public var body: some View {
        SplitViewController(controllers: [master, detail], preferredDisplayMode: $preferredDisplayMode)
    }
}

public extension SplitView {
    func preferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) -> Self {
        self.preferredDisplayMode = preferredDisplayMode
        return self
    }
}
