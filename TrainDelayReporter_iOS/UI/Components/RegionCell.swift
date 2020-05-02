//
//  RegionCell.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/20.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

//import SwiftUI
//
//struct Region: Identifiable {
//    var id = UUID()
//    var name: String
//    var colorCode: Int
//}
//
//struct RegionCell:View {
//    // APIからのレスポンスを管理するためのオブジェクト
//    @EnvironmentObject public var appState: AppState
//
//    var region: Region
//    var body: some View {
//        Button(action :{
//            let delayListFetcher = DelayListInteractor(appState: self.appState)
//            delayListFetcher.filterRegion(region: self.region.name)
//            self.appState.toggleHamburgerMenu()
//            self.appState.menuOffset.region = self.region.name
//        }) {
//            VStack {
//                HStack {
//                    Circle()
//                    .fill(Color(hex: self.region.colorCode))
//                    .frame(width: 20, height:20) //TODO Geometryで大きさを計算
//                    Text(self.region.name)
//                        .foregroundColor(.black)
//                        .font(.title) //TODO フォントの大きさをデバイスごとに変更する
//                }
//                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
//                Divider()
//            }
//        }
//        .padding(.horizontal, 20)
//    }
//}
//
//// [参考](https://qiita.com/masa7351/items/e634f50ade5915f13397)
//extension Color {
//    init(hex: Int, alpha: Double = 1) {
//        let components = (
//            R: Double((hex >> 16) & 0xff) / 255,
//            G: Double((hex >> 08) & 0xff) / 255,
//            B: Double((hex >> 00) & 0xff) / 255
//        )
//        self.init(
//            .sRGB,
//            red: components.R,
//            green: components.G,
//            blue: components.B,
//            opacity: alpha
//        )
//    }
//}
