//
//  HamburgerMenu.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/13.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import QGrid
import Combine

struct Menu: Identifiable {
    var id = UUID()
    var IconName: String
    var MenuTitle: String
}

struct MenuCell: View {
    var menu: Menu
    
    var body: some View {
        HStack() {
            Image(menu.IconName)
                .resizable()
                .scaledToFit()
                .padding([.horizontal, .top], 7)
            Text(menu.MenuTitle)
        }
    }
}

struct HamburgerMenu: View {
    
    @State var isComplete:Bool = false
    @State var menuCells:[Menu] = []
    
    var body: some View {
        VStack(alignment: .center) {
            Text("メニュー")
            Divider()
            if self.isComplete == false {
                Text("メニューを設定中")
            }
            QGrid(self.menuCells,
                  columns: 1,
                  vSpacing: 20,
                  hSpacing: 20,
                  vPadding: 20,
                  hPadding: 0
            ) { menu in
                MenuCell(menu: menu)
            }
            
        }
        .background(Color(red: 255/255, green: 255/255, blue: 255/255))
        .onAppear(perform:{ self.setMenuList() })
    }
    
    public func setMenuList() {
        self.isComplete = false
        self.menuCells = []
        self.menuCells.append(Menu(IconName: "Search-gray", MenuTitle: "駅名から検索"))
        self.menuCells.append(Menu(IconName: "Region-gray", MenuTitle: "地域から検索"))
        DispatchQueue.main.async {
            self.isComplete = true
        }
    }
}
