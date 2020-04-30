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
    
    @State var isComplete:Bool = false
    @State var regionStructs:[Region] = []
    
    var body: some View {
        VStack {
            Text("地域を選択")
                .font(.system(size: 30))
                .foregroundColor(.black)
                .fontWeight(.bold)
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
        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        .onAppear(perform: {
            self.setRegions()
        })
    }
    
    /// Yield Region cells for HamburgerMenu
    public func setRegions() {
        
        // FIXME: 地方名とカラーコードのイテレート処理の実装
        // 地方名とカラーコードを格納した辞書型配列をforでイテレートしたかったが
        // 順番が保証されないため手動でappendしているが。
        self.regionStructs.append(Region(name: "全国", colorCode: 0x02C03C))
        self.regionStructs.append(Region(name: "北海道", colorCode: 0x02C03C))
        self.regionStructs.append(Region(name: "東北", colorCode: 0x37863F))
        self.regionStructs.append(Region(name: "関東", colorCode: 0x0072BA))
        self.regionStructs.append(Region(name: "中部", colorCode: 0xFF7E1C))
        self.regionStructs.append(Region(name: "近畿", colorCode: 0x00ACD1))
        self.regionStructs.append(Region(name: "中国地方", colorCode: 0xF62D36))
        self.regionStructs.append(Region(name: "四国", colorCode: 0x98A9D6))
        self.regionStructs.append(Region(name: "九州", colorCode: 0x98A9D6))
        // Exec status change in main thred to avoid an error
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
