//
//  RegionListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/20.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Combine

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

/// Load regions and create region list
class RegionListInteractor: ObservableObject {
    
    @Published var isComplete:Bool = false
    public var regionStructs:[Region] = []
    
    let regions:[String: Int] = [
        "北海道": 0x02C03C,
        "東日本": 0x37863F,
        "西日本": 0x0072BA,
        "東海": 0xFF7E1C,
        "四国": 0x00ACD1,
        "九州": 0xF62D36,
        "私鉄": 0x98A9D6
    ]
    
    init() {
        setRegions()
    }
    
    /// Yield Region cells for HamburgerMenu
    public func setRegions() {
        dump("a")
        for region in regions {
            self.regionStructs.append(Region(name: region.key, colorCode: region.value))
        }
        // Exec status change in main thred to avoid an error
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
