import SwiftUI

struct InvestmentHeaderView: View {
    let investmentType: InvestmentCategory
    let onBackTapped: () -> Void
    
    var body: some View {
        HStack {
            Button(action: onBackTapped) {
                Image(systemName: "chevron.left")
                    .font(AppTypography.navTitle)
                    .foregroundColor(AppColors.white)
            }
            
            Spacer()
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.top, AppSpacing.lg)
        .padding(.bottom, AppSpacing.lg)
    }
}

#Preview {
    InvestmentHeaderView(
        investmentType: .crypto,
        onBackTapped: {}
    )
    .background(AppColors.primary)
}
