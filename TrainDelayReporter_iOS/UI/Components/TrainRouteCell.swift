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
    let status: String = "△"
}

// The cell which has train route info
struct TrainRouteCell: View {
    var delayList: TrainRoute
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(self.delayList.companyName)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Text(self.delayList.routeName)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.title)
            }
            Spacer()
            VStack {
                Text(self.delayList.status)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 48))
                Text(self.delayList.status == "○" ? "正常運転" : "遅れあり")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .font(.system(size: 18))
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        .background(Color(red: 215/255, green: 61/255, blue: 0/255))
        .cornerRadius(10)
    }
}
