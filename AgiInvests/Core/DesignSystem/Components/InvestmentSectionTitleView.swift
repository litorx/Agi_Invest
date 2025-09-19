import SwiftUI

struct InvestmentSectionTitleView: View {
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(AppTypography.title2)
                .fontWeight(.bold)
                .foregroundColor(AppColors.white)
            
            Spacer()
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.top, AppSpacing.titleSpacing)
        .padding(.bottom, AppSpacing.md)
    }
}

#Preview {
    InvestmentSectionTitleView(title: "Criptomoedas")
        .background(AppColors.primary)
}
