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

struct HamburgerMenu: View {
    var regionStructs:[Region] = []
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
        //TODO ハンバーガーメニューが出現するたびに要素の順番が変わってしまうのを修正する
        for (name, color) in regions {
            regionStructs.append(Region(name: name as! String, colorCode: color as! Int))
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
