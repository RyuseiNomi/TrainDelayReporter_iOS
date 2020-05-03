//
//  ContentView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    TabView {
                        RegionSelectView()
                            .tabItem {
                                Image("Japan")
                                    .resizable()
                                    .scaledToFit()
                                Text("地域より選択")
                            }
                        SearchView()
                            .tabItem {
                                Image("Search")
                                    .resizable()
                                    .scaledToFit()
                                Text("駅名から検索")
                            }
                        SettingView()
                            .tabItem {
                                Image("Setting")
                                    .resizable()
                                    .scaledToFit()
                                Text("設定")
                            }
                    }
                }
                HamburgerMenu()
                    .background(Color.white)
                    .frame(width: geometry.size.width * 0.5)
                    .onAppear(perform: {
                        self.appState.setInitPosition(viewWidth: geometry.size.width)
                    })
                    .offset(x: self.appState.menuOffset.currentOffset)
                    .animation(.default)
            }
            .onAppear(perform: {
                let delayListFetcher = DelayListInteractor(appState: self.appState)
                delayListFetcher.fetchAllDelayListFromAPI()
            })
            .gesture(DragGesture(minimumDistance: 30)
                .onChanged{ value in
                    // MenuViewのx軸を予め定めた最大出現位置と同等になるまでx軸の位置をずらす
                    if (self.appState.menuOffset.currentOffset != self.appState.menuOffset.openOffset) {
                        self.appState.menuOffset.currentOffset = self.appState.menuOffset.closeOffset + value.translation.width
                    }
                }
                .onEnded { value in
                    if (value.location.x > value.startLocation.x) {
                        self.appState.menuOffset.currentOffset = self.appState.menuOffset.openOffset
                    } else {
                        self.appState.menuOffset.currentOffset = self.appState.menuOffset.closeOffset
                    }
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
