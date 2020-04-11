//
//  DelayList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import UIKit
import SwiftUI
import QGrid

struct DelayList: View {
    private var delayListInteractor = DelayListInteractor()
    var body: some View {
        QGrid(self.delayListInteractor.fetchDelayList(),
              columns: 1,
              vSpacing: 20,
              hSpacing: 20,
              vPadding: 20,
              hPadding: 0
        ) { trainRoute in
            TrainRouteCell(delayList: trainRoute)
        }
    }
}
