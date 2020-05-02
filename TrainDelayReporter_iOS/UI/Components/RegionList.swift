//
//  RegionList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/02.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

/// 地方の情報を持つ構造体
struct Region: Identifiable {
    var id = UUID()
    var Name: String
    var ColorCode: Int
    var DelayCount: Int
}

/// 地方のセルの見た目に関するView
struct RegionCell: View {
    
    var region: Region
    
    var body: some View {
        GeometryReader { geometry in
            NavigationLink(destination: CompanySelectView(region: self.region.Name)) {
                HStack {
                    Text(self.region.Name)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .background(Color(red: 154/255, green: 205/255, blue: 50/255))
                .cornerRadius(10)
            }.navigationBarTitle("ホーム")
        }
    }
}

/// 全ての地域をリストで表示するためのView
struct RegionList: View {
    @State private var isComplete:Bool = false
    @State private var regionList:[Region] = []
    
    var body: some View {
        VStack {
            if self.isComplete == false {
                Text("地域情報を取得中")
            }
            QGrid(self.regionList,
                  columns: 1,
                  vSpacing: 45,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 20
            ) { region in
                RegionCell(region: region)
            }
        }.onAppear(perform: { self.setRegionList() })
    }
    
    public func setRegionList() {
        self.regionList = []
        self.regionList.append(Region(Name: "北海道", ColorCode: 0x02C03C, DelayCount: 0))
        self.regionList.append(Region(Name: "東北", ColorCode: 0x37863F, DelayCount: 0))
        self.regionList.append(Region(Name: "関東", ColorCode: 0x0072BA, DelayCount: 0))
        self.regionList.append(Region(Name: "中部", ColorCode: 0xFF7E1C, DelayCount: 0))
        self.regionList.append(Region(Name: "近畿", ColorCode: 0x00ACD1, DelayCount: 0))
        self.regionList.append(Region(Name: "中国地方", ColorCode: 0xF62D36, DelayCount: 0))
        self.regionList.append(Region(Name: "四国", ColorCode: 0x98A9D6, DelayCount: 0))
        self.regionList.append(Region(Name: "九州", ColorCode: 0x98A9D6, DelayCount: 0))
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
