//
//  FlowRouting.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import Foundation
import UIKit

protocol FlowRouting {
    var rootViewController: UIViewController? { get }
    var visibleViewController: UIViewController? { get }

    func showPushed(_ controller: UIViewController)
    func clearStackInBetween(left: UIViewController, right: UIViewController)
    func jumpBack(to controller: UIViewController?)
    func returnToRoot()
    func replace(viewController: UIViewController, with controller: UIViewController)
}
