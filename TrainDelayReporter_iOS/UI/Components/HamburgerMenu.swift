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
    
    //@ObservedObject var regionListInteractor = RegionListInteractor()
    @State var isComplete:Bool = false
    @State var regionStructs:[Region] = []
    
    let regions:[String: Int] = [
        "北海道": 0x02C03C,
        "東日本": 0x37863F,
        "西日本": 0x0072BA,
        "東海": 0xFF7E1C,
        "四国": 0x00ACD1,
        "九州": 0xF62D36,
        "私鉄": 0x98A9D6
    ]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("地域を選択")
                    .font(.system(size: 24))
                Divider()
                if self.isComplete == false {
                    Text("地域情報を取得中")
                }
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
            .onAppear(perform: {
                self.setRegions()
            })
        }
    }
    
    /// Yield Region cells for HamburgerMenu
    public func setRegions() {
        for region in regions {
            self.regionStructs.append(Region(name: region.key, colorCode: region.value))
        }
        // Exec status change in main thred to avoid an error
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
