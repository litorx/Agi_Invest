import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Início")
                .tabItem {
                    Image(systemName: "house")
                    Text("Início")
                }
                .tag(0)
            
            InvestmentsHomeView()
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    Text("Investimento")
                }
                .tag(1)
            
            Text("Conta")
                .tabItem {
                    Image(systemName: "dollarsign.circle")
                    Text("Conta")
                }
                .tag(2)
            
            Text("Cartões")
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Cartões")
                }
                .tag(3)
            
            Text("Perfil")
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }
                .tag(4)
        }
        .accentColor(AppColors.primary)
        .background(AppColors.white)
    }
}