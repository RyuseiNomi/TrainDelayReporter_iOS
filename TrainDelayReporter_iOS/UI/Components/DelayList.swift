//
//  DelayList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct DelayList: View {
    //TODO: Get delay list from API
    let trains = [
        TrainRoute(companyName: "JR東日本", routeName: "常磐線"),
        TrainRoute(companyName: "JR東日本", routeName: "水郡線"),
        TrainRoute(companyName: "JR東日本", routeName: "八高線"),
        TrainRoute(companyName: "JR西日本", routeName: "奈良線"),
    ]
    var body: some View {
        QGrid(trains,
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
