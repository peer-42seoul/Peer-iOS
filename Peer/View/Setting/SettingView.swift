//
//  SettingView.swift
//  Peer
//
//  Created by Hosung Lim on 3/29/24.
//

import SwiftUI

struct SettingHeaderView: View {
    var body: some View {
        HStack {
            Text("설정페이지")
                .font(.pretendardBold24)
            
            Spacer()
        }
    }
}

struct Profile: View {
    var body: some View {
        VStack {
            Text("View 1")
        }
    }
}

struct View2: View {
    var body: some View {
        VStack {
            Text("View 2")
        }
    }
}

struct View3: View {
    var body: some View {
        VStack {
            Text("View 3")
        }
    }
}

struct View4: View {
    var body: some View {
        VStack {
            Text("View 4")
        }
    }
}

struct View5: View {
    var body: some View {
        VStack {
            Text("View 5")
        }
    }
}

struct SettingView: View {
    @State var currentTab: Int = 0
    
    var body: some View {
        ZStack {
            Color("PrimaryBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                SettingHeaderView()
                    .padding(20)
                
                TabBarView(currentTab: self.$currentTab)
                    .frame(height: 80)
                
                ZStack {
                    Color.tertiaryBackground
                    
                    TabView(selection: self.$currentTab) {
                        Profile().tag(0)
                        View2().tag(1)
                        View3().tag(2)
                        View4().tag(3)
                        View5().tag(4)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.all)
                    
                }
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                
                Spacer()
            }
        }
        
    }
}

struct TabBarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    
    var tabBar: [(String, String)] = [
            ("내 정보", "person.fill"),
            ("내 관심", "heart.fill"),
            ("쪽지", "bubble.left.fill"),
            ("개인정보", "lock.fill"),
            ("설정", "gearshape.fill")
        ]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .center, spacing: 10) {
                ForEach(
                    Array(zip(self.tabBar.indices,
                              self.tabBar)),
                    id: \.0,
                    content: {
                        index, item in
                        TabBarItem(
                            currentTab: self.$currentTab,
                            namespace: namespace.self,
                            tabBarItemName: item.0,
                            tabBarItemIcon: item.1,
                            tab: index)
                        .frame(width: (geometry.size.width - 70) / CGFloat(tabBar.count))
                    })
            }
            .padding(.horizontal)
        }
    }
}

struct TabBarItem: View {
    @Binding var currentTab: Int
    let namespace: Namespace.ID
    
    var tabBarItemName: String
    var tabBarItemIcon: String
    var tab: Int
    
    var body: some View {
        ZStack {
            if currentTab == tab {
                Color.strongPurple
            } else {
                Color.secondaryBackground
            }
            
            Button {
                self.currentTab = tab
            } label: {
                VStack {
                    if currentTab == tab {
                        VStack {
                            Image(systemName: tabBarItemIcon)
                                .padding(3)
                            Text(tabBarItemName)
                        }
                        .fontWeight(.bold)
                        
                    } else {
                        VStack {
                            Image(systemName: tabBarItemIcon)
                                .foregroundColor(Color.gray)
                                .padding(3)
                            Text(tabBarItemName)
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                .animation(.spring(), value: self.currentTab)
            }
            .buttonStyle(.plain)
            
        }
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
    }
}

#Preview {
    SettingView()
}
