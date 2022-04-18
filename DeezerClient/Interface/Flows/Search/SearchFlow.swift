//
//  SearchFlow.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import Foundation

final class SearchFlow {
    private let router: FlowRouting
    private let screenFactory: SearchFlowScreenMaking
    private let flowRunner: FlowRunning

    init(router: FlowRouting, screenFactory: SearchFlowScreenMaking, flowRunner: FlowRunning) {
        self.router = router
        self.screenFactory = screenFactory
        self.flowRunner = flowRunner
    }
}

extension SearchFlow: SearchFlowing {
    func runFlow() {
        showSearchScreen()
    }

    private func showSearchScreen() {
        router.showPushed(screenFactory.makeSearchScreen(flow: self))
    }
}
