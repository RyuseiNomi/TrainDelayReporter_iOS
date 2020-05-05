//
//  TrainRouteCell.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

// Struct which has info about each train route
struct TrainRoute: Identifiable, Equatable, Hashable {
    var id = UUID()
    let Name: String
    let Company: String
    let Region: String
    let Status: String
    let Source: String
}

// The cell which has train route info
struct TrainRouteCell: View {
    var delayList: TrainRoute
    var body: some View {
        NavigationLink(destination: RouteDetail()) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.delayList.Company)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    Text(self.delayList.Name)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                }
                Spacer()
                VStack {
                    Text(self.delayList.Status)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 48))
                    Text(self.delayList.Status == "○" ? "正常運転" : "遅れあり")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 18))
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .background(self.getBackgroundColor())
            .cornerRadius(10)
            .shadow(color: .gray, radius: 1, x: 0, y: 5) //lightblue
        }
    }
    
    private func getBackgroundColor() -> Color {
        var color = Color(red: 154/255, green: 205/255, blue: 50/255)
        if self.delayList.Status == "△" {
            color = Color(red: 215/255, green: 61/255, blue: 0/255)
        }
        return color
    }
}
