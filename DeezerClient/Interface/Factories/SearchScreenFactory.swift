//
//  SearchScreenFactory.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import UIKit

struct SearchScreenFactory {}

extension SearchScreenFactory: SearchFlowScreenMaking {
    func makeSearchScreen(flow: SearchFlowing) -> UIViewController {
        let viewController = SearchViewController()
        return viewController
    }
}
