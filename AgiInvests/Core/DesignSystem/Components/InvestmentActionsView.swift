import SwiftUI

struct InvestmentActionsView: View {
    let onInvestTapped: () -> Void
    let onWithdrawTapped: () -> Void
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            Button(action: onInvestTapped) {
                HStack(spacing: AppSpacing.sm) {
                    Image(systemName: "arrow.up")
                        .font(AppTypography.button)
                    Text("Investir")
                        .font(AppTypography.body)
                        .fontWeight(.semibold)
                }
                .foregroundColor(AppColors.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.md)
                .background(AppColors.white)
                .cornerRadius(AppRadius.xl)
            }
            
            Button(action: onWithdrawTapped) {
                HStack(spacing: AppSpacing.sm) {
                    Image(systemName: "hand.raised.fill")
                        .font(AppTypography.button)
                    Text("Saque")
                        .font(AppTypography.body)
                        .fontWeight(.semibold)
                }
                .foregroundColor(AppColors.primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.md)
                .background(AppColors.white)
                .cornerRadius(AppRadius.xl)
            }
        }
        .padding(.horizontal, AppSpacing.lg)
    }
}

#Preview {
    InvestmentActionsView(
        onInvestTapped: {},
        onWithdrawTapped: {}
    )
    .background(AppColors.primary)
}
