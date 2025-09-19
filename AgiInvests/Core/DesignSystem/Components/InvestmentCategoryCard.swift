import SwiftUI

struct InvestmentCategoryCard: View {
    let title: String
    let iconName: String
    
    private var iconColor: Color {
        return AppColors.primary
    }
    
    var body: some View {
        VStack(spacing: AppSpacing.xs) {
            Image(systemName: iconName)
                .font(AppTypography.iconLarge)
                .foregroundColor(iconColor)
            
            Text(title)
                .font(AppTypography.caption)
                .fontWeight(.medium)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity)
        .frame(height: AppSpacing.buttonHeight)
        .padding(.vertical, AppSpacing.sm)
        .background(
            RoundedRectangle(cornerRadius: AppRadius.md)
                .fill(AppColors.white)
                .shadow(color: AppColors.shadowMedium, radius: AppSpacing.xs, x: AppSpacing.zero, y: AppSpacing.sm)
        )
    }
}