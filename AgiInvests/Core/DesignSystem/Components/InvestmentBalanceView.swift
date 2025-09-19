import SwiftUI

struct InvestmentBalanceView: View {
    let totalValue: String
    let changePercentage: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.lg) {
            HStack {
                Text("Meus investimentos")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.overlayLight)
                    .padding(.horizontal, AppSpacing.md)
                    .padding(.vertical, AppSpacing.sm)
                    .background(AppColors.backgroundOverlay)
                    .cornerRadius(AppRadius.lg)
                
                Spacer()
            }
            
            HStack(alignment: .center) {
                Text(totalValue)
                    .font(AppTypography.balance)
                    .foregroundColor(AppColors.white)
                
                HStack(spacing: AppSpacing.sm) {
                    Text(changePercentage)
                        .font(AppTypography.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.white)
                        .padding(.horizontal, AppSpacing.sm)
                        .padding(.vertical, AppSpacing.xs)
                        .background(AppColors.green)
                        .cornerRadius(AppRadius.sm)
                    
                    Image(systemName: "chevron.right")
                        .font(AppTypography.pill)
                        .foregroundColor(AppColors.white)
                }
                
                Spacer()
            }
        }
        .padding(.horizontal, AppSpacing.lg)
        .padding(.bottom, AppSpacing.lg)
    }
}

#Preview {
    InvestmentBalanceView(
        totalValue: "R$24.712,13",
        changePercentage: "+5.2%"
    )
    .background(AppColors.primary)
}
