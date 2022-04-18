//
//  FlowRunner.swift
//  DeezerClient
//
//  Created by Fedar Valiauka on 18/04/2022.
//

import Foundation

struct FlowRunner {}

extension FlowRunner: FlowRunning {
    func runSearchFlow(router: FlowRouting) {
        SearchFlow(router: router, screenFactory: SearchScreenFactory(), flowRunner: FlowRunner())
            .runFlow()
    }
}
