//
//  DelayList.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import UIKit
import SwiftUI
import QGrid
import Combine

struct DelayList: View {
    
    // HamburgerMenuのx軸情報をDelayListとNavigationBarで共有
    @Binding public var currentOffset: CGFloat
    @Binding public var openOffset: CGFloat
    @Binding public var closeOffset: CGFloat
    
    // APIからのレスポンスを管理するためのオブジェクト
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment: .center) {
                    if self.appState.delayList.isComplete == false {
                        Text("列車の遅延情報を取得中です")
                    }
                    if self.appState.delayList.isComplete && self.appState.delayList.trains == [] {
                        Text("遅れている路線はありません")
                    }
                    QGrid(self.appState.delayList.trains,
                          columns: 1,
                          vSpacing: 20,
                          hSpacing: 20,
                          vPadding: 20,
                          hPadding: 0
                    ) { trainRoute in
                        TrainRouteCell(delayList: trainRoute)
                    }
                }
                .onAppear(perform: {
                    let delayListFetcher = DelayListInteractor(appState: self.appState)
                    delayListFetcher.fetchDelayList(region: "全国")
                })
                .background(Color(red: 255/255, green: 250/255, blue: 240/255))
            }
        }
    }
}
