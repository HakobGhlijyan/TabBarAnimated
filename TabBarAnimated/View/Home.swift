//
//  Home.swift
//  TabBarAnimated
//
//  Created by Hakob Ghlijyan on 01.10.2024.
//

import SwiftUI

struct Home: View {
    // View Properties
    @State private var activeTab: Tab = .photo
    // All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    // Bounce Property
    @State private var bouncesDown: Bool = false
    @State private var color: Color = Tab.photo.color
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                //Tab View
                //1
                NavigationStack {
                    ZStack {
                        color.opacity(0.1).ignoresSafeArea()
                        
                        VStack {
                            
                        }
                    }
                    .navigationTitle(Tab.photo.title)
                }
                .setUpTab(.photo)
                //2
                NavigationStack {
                    ZStack {
                        color.opacity(0.1).ignoresSafeArea()
                        
                        VStack {
                            
                        }
                    }
                    .navigationTitle(Tab.chat.title)
                }
                .setUpTab(.chat)
                //3
                NavigationStack {
                    ZStack {
                        color.opacity(0.1).ignoresSafeArea()
                        
                        VStack {
                            
                        }
                    }
                    .navigationTitle(Tab.apps.title)
                }
                .setUpTab(.apps)
                //4
                NavigationStack {
                    ZStack {
                        color.opacity(0.1).ignoresSafeArea()
                        
                        VStack {
                            
                        }
                    }
                    .navigationTitle(Tab.notifications.title)
                }
                .setUpTab(.notifications)
                //5
                NavigationStack {
                    ZStack {
                        color.opacity(0.1).ignoresSafeArea()
                        
                        VStack {
                            
                        }
                    }
                    .navigationTitle(Tab.profile.title)
                }
                .setUpTab(.profile)
                
            }
            
            Picker("", selection: $bouncesDown) {
                Text("Bounces Down")
                    .tag(true)
                Text("Bounces Up")
                    .tag(false)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 15)
            .padding(.bottom, 20)
            .background(color.opacity(0.1))
            
            CustomTabBar()
        }
    }
    
    // Custom Tab Bar
    @ViewBuilder func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(bouncesDown ? .bounce.down.byLayer : .bounce.up.byLayer, value: animatedTab.isAnimating)
                    
                    Text(tab.title)
                        .font(.caption2)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.7))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete) {
                        activeTab = tab
                        color = tab.color
                        animatedTab.isAnimating = true
                    } completion: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            animatedTab.isAnimating = nil
                        }
                    }
                }
            }
        }
        .background(color.opacity(0.1))
//        .background(.bar)
    }
    
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight:.infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
