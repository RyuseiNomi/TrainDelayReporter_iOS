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
//                .font(.system(size: 30))
//                .foregroundColor(.black)
//                .fontWeight(.bold)
//            Divider()
//            if self.isComplete == false {
//                Text("地域情報を取得中")
//            }
//            QGrid(self.regionStructs,
//                  columns: 1,
//                  vSpacing: 20,
//                  hSpacing: 20,
//                  vPadding: 20,
//                  hPadding: 0
//            ) { region in
//                RegionCell(region: region)
//            }
        }
//        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
//        .onAppear(perform: {
//            self.setRegions()
//        })
    }
}
