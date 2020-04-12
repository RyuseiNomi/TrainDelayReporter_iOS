//
//  NavigationBar.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/12.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 107/255, green: 142/255, blue: 35/255).edgesIgnoringSafeArea(.all)
                HStack {
                    Image("Hamburger")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                    Spacer()
                    Image("Reload")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                }.padding()
            }
        }
    }
}
