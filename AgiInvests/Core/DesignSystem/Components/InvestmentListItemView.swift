import SwiftUI

struct InvestmentListItemView: View {
    let item: InvestmentItem
    
    var body: some View {
        HStack(spacing: AppSpacing.md) {
            ZStack {
                Circle()
                    .fill(getIconBackgroundColor(for: item.icon))
                    .frame(width: AppSpacing.xl * 2, height: AppSpacing.xl * 2)
                
                if item.icon.hasPrefix("http") {
                    AsyncImage(url: URL(string: item.icon)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                    } placeholder: {
                        ProgressView()
                            .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                    }
                } else if item.icon.hasPrefix("https") {
                    AsyncImage(url: URL(string: item.icon)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                    } placeholder: {
                        ProgressView()
                            .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                    }
                } else {
                    getCryptoIcon(for: item.icon)
                }
            }
            
            VStack(alignment: .leading, spacing: AppSpacing.xs) {
                Text(item.name)
                    .font(AppTypography.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(item.symbol)
                    .font(AppTypography.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: AppSpacing.xs) {
                Text(item.value)
                    .font(AppTypography.headline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(item.change)
                    .font(AppTypography.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(item.change.hasPrefix("+") ? AppColors.green : AppColors.red)
            }
        }
        .padding(.horizontal, AppSpacing.md)
        .padding(.vertical, AppSpacing.md)
        .background(
            RoundedRectangle(cornerRadius: AppRadius.md)
                .fill(AppColors.white)
                .shadow(color: AppColors.shadowLight, radius: AppSpacing.xs, x: AppSpacing.zero, y: AppSpacing.xs)
        )
    }
    
    @ViewBuilder
    private func getCryptoIcon(for iconId: String) -> some View {
        switch iconId {
        case "diamond.fill":
            Image(systemName: "diamond.fill")
                .font(AppTypography.iconLarge)
                .foregroundColor(AppColors.purple)
        case "bitcoinsign.circle.fill":
            ZStack {
                Circle()
                    .fill(AppColors.orange)
                    .frame(width: AppSpacing.iconMedium, height: AppSpacing.iconMedium)
                Text("B")
                    .font(AppTypography.iconLarge)
                    .foregroundColor(AppColors.white)
                    .fontWeight(.bold)
            }
        case "circle.fill":
            ZStack {
                Circle()
                    .fill(AppColors.green)
                    .frame(width: AppSpacing.iconMedium, height: AppSpacing.iconMedium)
                Text("T")
                    .font(AppTypography.iconLarge)
                    .foregroundColor(AppColors.white)
                    .fontWeight(.bold)
            }
        case "cube.fill":
            Image(systemName: "cube.fill")
                .font(AppTypography.iconLarge)
                .foregroundColor(AppColors.yellow)
        case "dollarsign.circle.fill":
            ZStack {
                Circle()
                    .fill(AppColors.blue)
                    .frame(width: AppSpacing.iconMedium, height: AppSpacing.iconMedium)
                Text("$")
                    .font(AppTypography.iconLarge)
                    .foregroundColor(AppColors.white)
                    .fontWeight(.bold)
            }
        case "shield.fill":
            Image(systemName: "shield.fill")
                .font(AppTypography.iconLarge)
                .foregroundColor(AppColors.yellow)
        default:
            Image(systemName: "bitcoinsign.circle")
                .font(AppTypography.iconLarge)
                .foregroundColor(AppColors.gray)
        }
    }
    
    private func getIconBackgroundColor(for iconId: String) -> Color {
        if iconId.hasPrefix("http") {
            return AppColors.gray.opacity(0.1)
        }
        
        switch iconId {
        case "diamond.fill": return AppColors.purple.opacity(0.2)
        case "bitcoinsign.circle.fill": return AppColors.orange.opacity(0.2)
        case "circle.fill": return AppColors.green.opacity(0.2)
        case "cube.fill": return AppColors.yellow.opacity(0.2)
        case "dollarsign.circle.fill": return AppColors.blue.opacity(0.2)
        case "shield.fill": return AppColors.black.opacity(0.1)
        default: return AppColors.gray.opacity(0.1)
        }
    }
}
