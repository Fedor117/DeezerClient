//
//  FlowRoutingService.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import UIKit

final class FlowRoutingService {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
}

// MARK: - FlowRouting

extension FlowRoutingService: FlowRouting {
    var rootViewController: UIViewController? {
        navigationController.viewControllers.first
    }

    var visibleViewController: UIViewController? {
        navigationController.visibleViewController ?? navigationController.viewControllers.last
    }

    func showPushed(_ controller: UIViewController) {
        if let visibleViewController = navigationController.visibleViewController {
            visibleViewController.navigationController?.pushViewController(controller, animated: true)
        } else {
            navigationController.pushViewController(controller, animated: false)
        }
    }

    func clearStackInBetween(left: UIViewController, right: UIViewController) {
        let navigationController =
            self.navigationController.visibleViewController?.navigationController ?? self.navigationController
        let currentStack = navigationController.viewControllers
        guard let leftIndex = currentStack.firstIndex(of: left),
              let rightIndex = currentStack.firstIndex(of: right),
              leftIndex < rightIndex
        else {
            return
        }

        let newStack = Array(currentStack.prefix(leftIndex + 1)) + [right]
        if let visibleViewController = navigationController.visibleViewController {
            visibleViewController.navigationController?.setViewControllers(newStack, animated: true)
        } else {
            self.navigationController.setViewControllers(newStack, animated: false)
        }
    }

    func jumpBack(to controller: UIViewController?) {
        if let controller = controller {
            if let topNavigationController = visibleViewController?.navigationController,
               topNavigationController.viewControllers.contains(controller) {
                topNavigationController.popToViewController(controller, animated: true)
            } else {
                navigationController.popToViewController(controller, animated: true)
            }
        } else {
            visibleViewController?.navigationController?.popViewController(animated: true)
        }
    }

    func returnToRoot() {
        let navigationController = visibleViewController?.navigationController ?? self.navigationController
        navigationController.popToRootViewController(animated: true)
    }

    func replace(viewController: UIViewController, with controller: UIViewController) {
        guard
            let navigationController = visibleViewController?.navigationController,
            let index = navigationController.viewControllers.firstIndex(of: viewController)
        else {
            return
        }

        navigationController.viewControllers[index] = controller
    }
}
