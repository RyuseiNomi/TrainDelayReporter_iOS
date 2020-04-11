//
//  TrainRouteCell.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

// Struct which has info about each train route
struct TrainRoute: Identifiable {
    var id = UUID()
    let companyName: String
    let routeName: String
}

// The cell which has train route info
struct TrainRouteCell: View {
    var delayList: TrainRoute
    var body: some View {
        VStack(alignment: .leading) {
            Text(delayList.companyName)
                .foregroundColor(.white)
                .fontWeight(.bold)
            Text(delayList.routeName)
                .foregroundColor(.white)
                .fontWeight(.heavy)
                .font(.title)
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(Color.green)
        .cornerRadius(10)
    }
}
