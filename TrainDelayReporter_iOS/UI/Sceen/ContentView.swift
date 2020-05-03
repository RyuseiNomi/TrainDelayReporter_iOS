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
            VStack {
                TabView {
                    RegionSelectView()
                        .tabItem {
                            Image("Japan")
                                .resizable()
                                .scaledToFit()
                            Text("地域より検索")
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
            .onAppear(perform: {
                let delayListFetcher = DelayListInteractor(appState: self.appState)
                delayListFetcher.fetchAllDelayListFromAPI()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
