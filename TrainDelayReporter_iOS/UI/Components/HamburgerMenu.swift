//
//  HamburgerMenu.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/13.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct HamburgerMenu: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Text("地域を選択")
                    .font(.system(size: 24))
                Divider()
                ScrollView(.vertical, showsIndicators: true) {
                    Text("北海道")
                        .font(.system(size: 18))
                    Text("東日本")
                        .font(.system(size: 18))
                    Text("西日本")
                        .font(.system(size: 18))
                    Text("東海")
                        .font(.system(size: 18))
                    Text("四国")
                        .font(.system(size: 18))
                    Text("九州")
                        .font(.system(size: 18))
                }
            }
            .padding(.horizontal, 20)
        }
    }
}
