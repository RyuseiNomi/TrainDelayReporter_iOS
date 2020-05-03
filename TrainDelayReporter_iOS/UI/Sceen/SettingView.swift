//
//  SettingView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/03.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import UIKit

struct SettingView: View {
    
    let icon8Url = URL(string: "https://icons8.com")!
    var body: some View {
        VStack {
            Text("All of Icons by ")
            Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                Text("Icon8")
            }
        }
    }
}
