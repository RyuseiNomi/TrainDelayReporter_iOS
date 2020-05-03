//
//  DelayListView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/02.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid

struct DelayListView: View {
    
    public var companyName:String = ""
    var body: some View {
        DelayList(companyName: self.companyName)
    }
}
