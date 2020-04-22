//
//  DelayListInteractor.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/11.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import Combine

class DelayListInteractor: ObservableObject {
    
    @Published var isComplete:Bool = false
    public var trains:[TrainRoute] = []
    
    init() {
        isComplete = false
    }
    
    // Fetch train-delay-list from API-Server and give to View Object
    public func fetchDelayList() {
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
                self.trains.append(TrainRoute(companyName: trainRoute["company"] as! String, routeName: trainRoute["name"] as! String))
            }
            // Exec status change in main thred to avoid an error
            DispatchQueue.main.async {
                self.isComplete = true
            }
        }
        task.resume()
    }
}
