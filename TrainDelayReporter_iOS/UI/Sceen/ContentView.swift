//
//  ContentView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    // ハンバーガーメニューの表示/非表示を管理するための変数
    @State public var currentOffset = CGFloat.zero
    @State public var openOffset = CGFloat.zero
    @State public var closeOffset = CGFloat.zero
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                NavigationBar(currentOffset: self.$currentOffset, openOffset: self.$openOffset, closeOffset: self.$closeOffset)
                    .frame(width: geometry.size.width, height: geometry.size.height/10)
                DelayList(currentOffset: self.$currentOffset, openOffset: self.$openOffset, closeOffset: self.$closeOffset)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
