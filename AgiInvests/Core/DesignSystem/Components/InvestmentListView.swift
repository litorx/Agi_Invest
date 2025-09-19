import SwiftUI

struct InvestmentListContentView: View {
    let investments: [InvestmentItem]
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.md) {
            ScrollView {
                LazyVStack(spacing: AppSpacing.md) {
                    ForEach(investments, id: \.name) { item in
                        InvestmentListItemView(item: item)
                    }
                }
                .padding(.horizontal, AppSpacing.lg)
                .padding(.top, AppSpacing.lg)
            }
        }
        .background(AppColors.white)
        .clipShape(
            UnevenRoundedRectangle(
                topLeadingRadius: AppRadius.lg,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 0,
                topTrailingRadius: AppRadius.lg
            )
        )
    }
}

