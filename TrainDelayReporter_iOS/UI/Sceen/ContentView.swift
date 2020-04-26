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
            ZStack {
                VStack {
                    NavigationBar(currentOffset: self.$currentOffset, openOffset: self.$openOffset, closeOffset: self.$closeOffset)
                        .frame(width: geometry.size.width, height: geometry.size.height/10)
                    DelayList(currentOffset: self.$currentOffset, openOffset: self.$openOffset, closeOffset: self.$closeOffset)
                }
                // スライドメニューがでてきたらメインコンテンツをグレイアウト
                //TODO 背景色の変化を指定した場合にリストがスクロール出来なくなる原因の調査
                //Color.gray.opacity(
                //  Double((self.closeOffset - self.currentOffset)/self.closeOffset) - 0.4
                //)
                HamburgerMenu()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.5)
                    .onAppear(perform: {
                        self.setInitPosition(viewWidth: geometry.size.width)
                    })
                    .offset(x: self.currentOffset)
                    .animation(.default)
            }
            .gesture(DragGesture(minimumDistance: 30)
                .onChanged{ value in
                    // MenuViewのx軸を予め定めた最大出現位置と同等になるまでx軸の位置をずらす
                    if (self.currentOffset != self.openOffset) {
                        self.currentOffset = self.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    if (value.location.x > value.startLocation.x) {
                        self.currentOffset = self.openOffset
                    } else {
                        self.currentOffset = self.closeOffset
                    }
                }
            )
        }
    }

    // MenuViewの初期位置・出現時のx軸を定める
    public func setInitPosition(viewWidth: CGFloat) {
        self.currentOffset = viewWidth * -1
        self.closeOffset = self.currentOffset
        self.openOffset = ((viewWidth / 2) * -1)+((viewWidth * 0.5) / 2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
