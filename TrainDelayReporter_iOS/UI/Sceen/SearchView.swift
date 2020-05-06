//
//  SearchView.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/05/03.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import UIKit

struct SearchView: View {
    
    @EnvironmentObject public var appState: AppState
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                RouteSearchBar(text: self.$searchText)
                List {
                    ForEach(self.appState.delayList.fetchedTrains.filter {
                        self.searchText.isEmpty ? true : $0.Name.contains(self.searchText)
                    }, id:\.self) { train in
                        NavigationLink(destination: DelayListView(grain: "routeName", condition: train.Name)) {
                            Text(train.Name)
                        }
                    }
                }
            }.navigationBarTitle("路線名から検索", displayMode: .inline)
        }
    }
}

struct RouteSearchBar: UIViewRepresentable {
    
    /// String text which binding with View session
    @Binding var text: String
    
    /// Create a view object and init state which text is inputed
    func makeUIView(context: UIViewRepresentableContext<RouteSearchBar>) -> UISearchBar {
        let routeSearchBar = UISearchBar(frame: .zero)
        routeSearchBar.delegate = context.coordinator
        return routeSearchBar
    }
    
    /// Update a state in this struct
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<RouteSearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> RouteSearchBar.RouteCoordinator {
        return RouteCoordinator(text: self.$text)
    }
    
    /// The class which communicate between UIView and UISearchBar
    class RouteCoordinator:NSObject, UISearchBarDelegate {
        
        /// String text which receive from UISearchBar
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            /// Set the text into Binding object
            text = searchText
            searchBar.showsCancelButton = true
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
        }
    }
}
