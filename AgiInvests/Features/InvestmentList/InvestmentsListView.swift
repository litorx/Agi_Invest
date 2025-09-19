import SwiftUI

struct InvestmentsListView: View {
    let investmentType: InvestmentCategory
    @StateObject private var viewModel = InvestmentListViewModel()
    @Environment(\.dismiss) private var dismiss
    
    private var hasBalanceSection: Bool {
        investmentType == .crypto || investmentType == .cdi || investmentType == .poupanca
    }
    
    private var blueSectionHeight: CGFloat {
        hasBalanceSection ? 280 : 120
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: AppSpacing.zero) {
                ZStack {
                    AppColors.primary
                        .ignoresSafeArea(.container, edges: [.top, .leading, .trailing])
                    
                    VStack(spacing: AppSpacing.zero) {
                        InvestmentHeaderView(
                            investmentType: investmentType,
                            onBackTapped: { dismiss() }
                        )
                        
                        if hasBalanceSection {
                            InvestmentBalanceView(
                                totalValue: "R$24.712,13",
                                changePercentage: "+5.2%"
                            )
                            
                            InvestmentActionsView(
                                onInvestTapped: { },
                                onWithdrawTapped: { }
                            )
                            
                            InvestmentSectionTitleView(title: investmentType.rawValue)
                        }
                    }
                }
                .frame(height: blueSectionHeight)
                
                InvestmentListContentView(investments: viewModel.getInvestmentItems())
            }
            .background(AppColors.white)
        }
        .onAppear {
            let category = investmentType
            viewModel.loadData(for: category)
        }
    }
}

#Preview {
    InvestmentsListView(investmentType: .crypto)
}