//
// Created by Rene Dohan on 12/2/19.
// Copyright (c) 2019 Renetik Software. All rights reserved.
//

import UIKit
import ChameleonFramework

public class CSAlertDialogController: CSObject, CSHasDialog, CSHasDialogVisible, CSHasSheet {

    private let controller: UIViewController
    private var alert: UIAlertController?

    public init(in controller: UIViewController) {
        self.controller = controller
    }

    public var isVisible: Bool { alert.notNil }

    public func hide(animated: Bool) { alert?.dismiss(animated: animated) }

    public func show(title: String?, message: String?, actions: [CSDialogAction]?, positive: CSDialogAction?,
                     cancel: CSDialogAction?, from: CSDisplayElement) -> CSHasDialogVisible {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions?.forEach { action in alert.add(action: action, style: .default) }
        positive.notNil { action in alert.add(action: action, style: .destructive, preferred: true) }
        cancel.notNil { action in alert.add(action: action, style: .cancel) }
        present(alert.popoverFrom(view: from.view, item: from.item))
        return self
    }

    public func show(title: String?, message: String, positive: CSDialogAction?,
                     negative: CSDialogAction?, cancel: CSDialogAction?) -> CSHasDialogVisible {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        negative.notNil { action in alert.add(action: action, style: .destructive) }
        positive.notNil { action in alert.add(action: action, style: .default, preferred: true) }
        cancel.notNil { action in alert.add(action: action, style: .cancel) }
        present(alert)
        return self
    }

    private func present(_ alert: UIAlertController) {
        hide(animated: false)
        self.alert = alert
        controller.present(alert, animated: true, completion: nil)
    }
}

public extension UIAlertController {
    func add(action: CSDialogAction, style: UIAlertAction.Style, preferred: Bool = false) -> UIAlertAction {
        let title = style == .cancel && action.title.isNil ? CSStrings.dialogCancel : action.title
        return UIAlertAction(title: title, style: style) { _ in action.action() }.also {
            addAction($0)
            if preferred { preferredAction = $0 }
        }
    }
}