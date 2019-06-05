import SwiftUI

struct SplitView<Master: View, Detail: View>: View {
    var master: UIHostingController<Master>
    var detail: UIHostingController<Detail>
    @State var preferredDisplayMode = UISplitViewController.DisplayMode.automatic

    init(master: Master, detail: Detail) {
        self.master = UIHostingController(rootView: master)
        self.detail = UIHostingController(rootView: detail)
    }

    var body: some View {
        SplitViewController(controllers: [master, detail], preferredDisplayMode: $preferredDisplayMode)
    }
}

extension SplitView {
    func preferredDisplayMode(_ preferredDisplayMode: UISplitViewController.DisplayMode) -> Self {
        self.preferredDisplayMode = preferredDisplayMode
        return self
    }
}
