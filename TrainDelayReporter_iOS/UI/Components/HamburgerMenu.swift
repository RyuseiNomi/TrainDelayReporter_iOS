//
//  HamburgerMenu.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/13.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct Region: Identifiable {
    var id = UUID()
    var name: String
}

struct RegionCell:View {
    var region: Region
    var body: some View {
        ZStack {
            HStack {
                Text(self.region.name)
            }
        }
    }
}

struct HamburgerMenu: View {
    var regionStructs:[Region] = []
    let regions:[String] = ["北海道", "東日本", "西日本", "東海", "四国", "九州", "私鉄"]
    init() {
        for region in regions {
            regionStructs.append(Region(name: region as! String))
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("地域を選択")
                    .font(.system(size: 24))
                Divider()
                QGrid(self.regionStructs,
                      columns: 1,
                      vSpacing: 20,
                      hSpacing: 20,
                      vPadding: 20,
                      hPadding: 0
                ) { region in
                    RegionCell(region: region)
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
