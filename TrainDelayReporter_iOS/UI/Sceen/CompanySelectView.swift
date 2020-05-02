//
//  CompanySelectView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/02.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CompanySelectView: View {
    
    public var region:String = ""
    
    var body: some View {
        VStack {
            CompanyList(region: self.region)
        }
    }
}
