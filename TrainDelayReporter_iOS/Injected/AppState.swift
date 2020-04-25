//
//  AppState.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    
    struct DelayList {
        var trains:[TrainRoute] = []
        var isComplete:Bool = false
    }
    
    @Published public var delayList = DelayList()
    
    public func setFetchStatus(_ status: Bool) {
        self.delayList.isComplete = status
    }
}
