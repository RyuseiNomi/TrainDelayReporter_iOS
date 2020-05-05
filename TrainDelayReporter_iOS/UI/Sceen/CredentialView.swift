//
//  CredentialView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/05.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI

struct CredentialView: View {
    
    private let icon8Url = URL(string: "https://icons8.com")!
    private let starIconUrl = URL(string: "https://icons8.com/icons/set/star")!
    private let settingIconUrl = URL(string: "https://icons8.com/icons/set/settings")!
    private let searchIconUrl = URL(string: "https://icons8.com/icons/set/search")!
    private let iPhoneIconUrl = URL(string: "https://icons8.com/icons/set/iPhone")!
    private let crescentMoonIconUrl = URL(string: "https://icons8.com/icons/set/crescent-moon")!
    private let japanMapIconUrl = URL(string: "https://icons8.com/icons/set/japan-map")!
    private let bellIconUrl = URL(string: "https://icons8.com/icons/set/bell")!
    var body: some View {
        VStack(alignment: .leading) {
            Text("アプリのバージョン")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
            Text("1.0")
            Divider()
            Text("Credentials")
                .foregroundColor(Color(red: 105/255, green: 105/255, blue: 105/255))
                .font(Font.custom("Helvetica-Light", size: 24))
            Text("All of Icons by ")
            Button(action : { UIApplication.shared.open(self.icon8Url) }) {
                Text("Icon8")
            }
            Button(action : { UIApplication.shared.open(self.starIconUrl) }) {
                Text("Star icon icon by Icons8")
            }
            Button(action : { UIApplication.shared.open(self.settingIconUrl) }) {
                Text("Settings icon icon by Icons8")
            }
            Button(action : { UIApplication.shared.open(self.searchIconUrl) }) {
                Text("Search icon icon by Icons8")
            }
            Button(action : { UIApplication.shared.open(self.iPhoneIconUrl) }) {
                Text("iPhone icon icon by Icons8")
            }
            //TODO write all of icons credential
        }
    }
}
