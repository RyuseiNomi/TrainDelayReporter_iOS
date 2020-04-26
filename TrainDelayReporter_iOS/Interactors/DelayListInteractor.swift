//
//  DelayListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Combine

class DelayListInteractor {
    
    public var appState:AppState
    
    init(appState: AppState) {
        // ViewコンポーネントよりEnvieonmentObjectから読み込んだAppStateインスタンスを取得
        self.appState = appState
    }
    
    // Fetch train-delay-list from API-Server and give to View Object
    public func fetchDelayList(region: String) {
        self.appState.setFetchStatus(false)
        self.appState.delayList.trains = []
        let url = URL(string: "https://8wbb81dkpd.execute-api.ap-northeast-1.amazonaws.com/beta/delayList?region=all")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let clientError = error {
                print("クライアント側でエラーが発生: \(clientError.localizedDescription) \n")
                return
            }
            guard let delayListData = data, let response = response as? HTTPURLResponse else {
                print("データもしくはレスポンスがありません")
                return
            }
            if response.statusCode != 200 {
                print("現在データを取得できません: \(response.statusCode)\n")
                return
            }
            // Convert Data Object to JSON Object
            let jsonObject = try? JSONSerialization.jsonObject(with: delayListData, options: []) as? [String:Any]
            let delayListArray = jsonObject?["delay_list"] as? [[String: Any]]
            for trainRoute in delayListArray! {
                if (trainRoute["company"] as! String == region || region == "") {
                    self.appState.delayList.trains.append(TrainRoute(companyName: trainRoute["company"] as! String, routeName: trainRoute["name"] as! String))
                }
            }
            dump(self.appState.delayList.trains)
            // Exec status change in main thred to avoid an error
            DispatchQueue.main.async {
                self.appState.setFetchStatus(true)
            }
        }
        task.resume()
    }
}
