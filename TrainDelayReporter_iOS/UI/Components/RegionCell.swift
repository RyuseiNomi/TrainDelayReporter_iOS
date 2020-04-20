//
//  RegionCell.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/20.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct Region: Identifiable {
    var id = UUID()
    var name: String
    var colorCode: Int
}

struct RegionCell:View {
    var region: Region
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack() {
                    Circle()
                        .fill(Color(hex: self.region.colorCode))
                        .frame(width: 10, height:10) //TODO Geometryで大きさを計算
                    Text(self.region.name)
                }
            }
        }
    }
}

// [参考](https://qiita.com/masa7351/items/e634f50ade5915f13397)
extension Color {
    init(hex: Int, alpha: Double = 1) {
        let components = (
            R: Double((hex >> 16) & 0xff) / 255,
            G: Double((hex >> 08) & 0xff) / 255,
            B: Double((hex >> 00) & 0xff) / 255
        )
        self.init(
            .sRGB,
            red: components.R,
            green: components.G,
            blue: components.B,
            opacity: alpha
        )
    }
}
