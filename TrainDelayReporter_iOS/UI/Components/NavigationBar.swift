//
//  NavigationBar.swift
//  TrainDelayReporter_iOS
//
//  Created by 能美龍星 on 2020/04/12.
//  Copyright © 2020 Ryusei Nomi. All rights reserved.
//

import SwiftUI
import UIKit

struct NavigationBar: View {
    
    @EnvironmentObject public var appState: AppState
    @State private var isSearch = false
    @State private var searchText : String = ""
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 107/255, green: 142/255, blue: 35/255).edgesIgnoringSafeArea(.all)
                VStack {
                    HStack {
                        Button(action: {
                            self.appState.toggleHamburgerMenu()
                        }) {
                            Image("Hamburger")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50.0, height: 50.0, alignment: .leading)
                        }
                        Spacer()
                        if self.isSearch == false {
                            Text(self.appState.menuOffset.region)
                            .foregroundColor(.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                            .frame(alignment: .center)
                        } else if self.isSearch == true {
                            RouteSearchBar(text: self.$searchText)
                        }
                        Spacer()
                        if self.isSearch == false {
                            Button(action: {
                                self.isSearch = true
                            }) {
                                Image("Search")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50.0, height: 50.0, alignment: .trailing)
                            }
                        } else if self.isSearch == true {
                            Button(action: {
                                self.isSearch = false
                            }) {
                                Image("Close")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 50.0, height: 50.0, alignment: .trailing)
                            }
                        }
                        
                    }.padding()
                }
            }
        }
    }
}

struct RouteSearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    /// Create a view object and init state
    func makeUIView(context: UIViewRepresentableContext<RouteSearchBar>) -> UISearchBar {
        let routeSearchBar = UISearchBar(frame: .zero)
        routeSearchBar.delegate = context.coordinator
        routeSearchBar.searchBarStyle = .minimal
        return routeSearchBar
    }
    
    // Update a state
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<RouteSearchBar>) {
        //Do Something
        uiView.text = text
    }
    
    /// The instance which tell the changes to View
    func makeCoordinator() -> RouteSearchBar.Coordinator {
        return Coordinator(text: self.$text)
    }
    
    /// The class which communicate UISearchBar and UIViewControllerRepresentable
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            // Communicate the text between this class and ContentView
            text = searchText
        }
    }
}
