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
        var fetchedTrains:[TrainRoute] = []
        var filteredTrains:[TrainRoute] = []
        var isComplete:Bool = false
    }
    
    struct MenuOffset {
        var currentOffset = CGFloat.zero
        var openOffset = CGFloat.zero
        var closeOffset = CGFloat.zero
        var region:String = "全国"
    }
    
    @Published public var delayList = DelayList()
    @Published public var menuOffset = MenuOffset()
    
    public func setFetchStatus(_ status: Bool) {
        self.delayList.isComplete = status
    }
    
    public func toggleHamburgerMenu() {
        if (self.menuOffset.currentOffset == self.menuOffset.openOffset) {
            self.menuOffset.currentOffset = self.menuOffset.closeOffset
        } else {
            self.menuOffset.currentOffset = self.menuOffset.openOffset
        }
    }
    
    public func setInitPosition(viewWidth: CGFloat) {
        self.menuOffset.currentOffset = viewWidth * -1
        self.menuOffset.closeOffset = self.menuOffset.currentOffset
        self.menuOffset.openOffset = ((viewWidth / 2) * -1)+((viewWidth * 0.5) / 2)
    }
}
