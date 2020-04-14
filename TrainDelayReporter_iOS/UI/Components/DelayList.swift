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
    
    // ハンバーガーメニューの表示/非表示を管理するための変数
    @State public var currentOffset = CGFloat.zero
    @State public var closeOffset = CGFloat.zero
    @State public var openOffset = CGFloat.zero
    
    // APIからのレスポンスを管理するためのオブジェクト
    @ObservedObject var delayListFetcher = DelayListInteractor()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
            //Color(red: 255/255, green: 250/255, blue: 240/255).edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                if self.delayListFetcher.isComplete == false {
                    Text("列車の遅延情報を取得中です")
                }
                QGrid(self.delayListFetcher.trains,
                      columns: 1,
                      vSpacing: 20,
                      hSpacing: 20,
                      vPadding: 20,
                      hPadding: 0
                ) { trainRoute in
                    TrainRouteCell(delayList: trainRoute)
                }
            }
            .background(Color(red: 255/255, green: 250/255, blue: 240/255))
            // スライドメニューがでてきたらメインコンテンツをグレイアウト
            Color.gray.opacity(
                Double((self.closeOffset - self.currentOffset)/self.closeOffset) - 0.4
            )
            HamburgerMenu()
                .background(Color.white)
                .frame(width: geometry.size.width * 0.5)
                .onAppear(perform: {
                    // MenuViewの初期位置・出現時のx軸を定める
                    self.currentOffset = geometry.size.width * -1
                    self.closeOffset = self.currentOffset
                    self.openOffset = ((geometry.size.width/2) * -1)+((geometry.size.width*0.5)/2)
                    print(self.openOffset)
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
}
