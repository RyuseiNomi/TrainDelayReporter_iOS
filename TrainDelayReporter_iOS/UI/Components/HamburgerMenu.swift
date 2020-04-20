//
//  HamburgerMenu.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/13.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid
import Combine

struct HamburgerMenu: View {
    
    @ObservedObject var regionListInteractor = RegionListInteractor()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("地域を選択")
                    .font(.system(size: 24))
                Divider()
                if self.regionListInteractor.isComplete == false {
                    Text("地域情報を取得中")
                }
                QGrid(self.regionListInteractor.regionStructs,
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
            .onAppear(perform: {
                self.regionListInteractor.setRegions()
            })
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
