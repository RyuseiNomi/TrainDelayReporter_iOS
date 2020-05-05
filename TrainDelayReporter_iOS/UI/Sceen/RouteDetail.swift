//
//  RouteDetail.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/05.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct RouteDetail: View {
    
    private(set) var routeName:String = ""
    private(set) var status:String = ""
    var body: some View {
        VStack() {
            Text(self.routeName)
        }
    }
}
