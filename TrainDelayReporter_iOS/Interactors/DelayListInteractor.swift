//
//  DelayListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct DelayListInteractor {
    public func fetchDelayList() -> Array<TrainRoute> {
        //TODO: Get delay list from API
        let trains = [
            TrainRoute(companyName: "JR東日本", routeName: "常磐線"),
            TrainRoute(companyName: "JR東日本", routeName: "水郡線"),
            TrainRoute(companyName: "JR東日本", routeName: "八高線"),
            TrainRoute(companyName: "JR西日本", routeName: "奈良線"),
        ]
        return trains
    }
}
