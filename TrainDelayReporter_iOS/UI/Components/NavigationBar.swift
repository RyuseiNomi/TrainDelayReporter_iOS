//
//  NavigationBar.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/12.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    
    @Binding public var currentOffset: CGFloat
    @Binding public var openOffset: CGFloat
    @Binding public var closeOffset: CGFloat
    @EnvironmentObject public var appState: AppState
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 107/255, green: 142/255, blue: 35/255).edgesIgnoringSafeArea(.all)
                HStack {
                    Button(action: {
                        self.toggleHamburgerMenu()
                    }) {
                        Image("Hamburger")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50.0, height: 50.0, alignment: .leading)
                    }
                    Spacer()
                    Text("全国")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                        .frame(alignment: .center)
                    Spacer()
                    Button(action: {
                        //TODO EnvironmentObjectをDIしてInteractorのメソッドを発火
                        let delayListFetcher = DelayListInteractor(appState: self.appState)
                        delayListFetcher.fetchDelayList()
                    }) {
                        Image("Reload")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 50.0, height: 50.0, alignment: .trailing)
                    }
                }.padding()
            }
        }
    }
    
    public func toggleHamburgerMenu() {
        if (self.currentOffset == self.openOffset) {
            self.currentOffset = self.closeOffset
        } else {
            self.currentOffset = self.openOffset
        }
    }
}
