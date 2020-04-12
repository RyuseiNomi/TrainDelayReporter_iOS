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
    
    @ObservedObject var delayListFetcher = DelayListInteractor()
    
    var body: some View {
        ZStack {
            Color(red: 255/255, green: 250/255, blue: 240/255).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                if delayListFetcher.isComplete == false {
                    Text("列車の遅延情報を取得中です")
                }
                QGrid(delayListFetcher.trains,
                      columns: 1,
                      vSpacing: 20,
                      hSpacing: 20,
                      vPadding: 20,
                      hPadding: 0
                ) { trainRoute in
                    TrainRouteCell(delayList: trainRoute)
                }
            }
        }
    }
}
