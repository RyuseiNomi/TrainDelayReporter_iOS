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
    
    public var grain: String = ""
    public var condition:String = ""
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        VStack(alignment: .center) {
            if self.appState.delayList.isComplete == false {
                Text("列車の遅延情報を取得中です")
            }
            if self.appState.delayList.domainError != "" {
                Text(self.appState.delayList.domainError)
            }
            if self.appState.delayList.isComplete && self.appState.delayList.filteredTrains == [] {
                Text("遅れている路線はありません")
            }
            QGrid(self.appState.delayList.filteredTrains,
                  columns: 1,
                  vSpacing: 20,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 20
            ) { trainRoute in
                TrainRouteCell(delayList: trainRoute)
            }
        }
        .onAppear(perform: {
            let delayListFetcher = DelayListInteractor(appState: self.appState)
            delayListFetcher.filter(grain: self.grain, condition: self.condition)
        })
        .background(Color(red: 248/255, green: 248/255, blue: 255/255)) //ghostwhite
        .navigationBarTitle("遅延リスト", displayMode: .inline)
    }
}
