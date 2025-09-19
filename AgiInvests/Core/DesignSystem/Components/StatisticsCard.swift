import SwiftUI

struct StatisticsCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: AppSpacing.medium) {
            VStack(alignment: .leading, spacing: AppSpacing.small) {
                Text("Gráficos e estatísticas")
                    .font(AppTypography.headline)
                    .fontWeight(.bold)
                    .foregroundColor(AppColors.white)
                    .multilineTextAlignment(.leading)
                
                Text("Acompanhe de perto o andamento de seus investimentos")
                    .font(AppTypography.caption)
                    .foregroundColor(AppColors.overlayLight)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.leading)
            }
            
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width
                    let height = geometry.size.height
                    
                    let points = [
                        CGPoint(x: 0, y: height * 0.8),
                        CGPoint(x: width * 0.1, y: height * 0.75),
                        CGPoint(x: width * 0.2, y: height * 0.65),
                        CGPoint(x: width * 0.3, y: height * 0.55),
                        CGPoint(x: width * 0.4, y: height * 0.45),
                        CGPoint(x: width * 0.5, y: height * 0.35),
                        CGPoint(x: width * 0.6, y: height * 0.25),
                        CGPoint(x: width * 0.7, y: height * 0.18),
                        CGPoint(x: width * 0.8, y: height * 0.12),
                        CGPoint(x: width * 0.9, y: height * 0.08),
                        CGPoint(x: width, y: height * 0.05)
                    ]
                    
                    path.move(to: points[0])
                    for i in 1..<points.count {
                        let currentPoint = points[i]
                        let previousPoint = points[i-1]
                        
                        let controlPoint1 = CGPoint(
                            x: previousPoint.x + (currentPoint.x - previousPoint.x) * 0.5,
                            y: previousPoint.y
                        )
                        let controlPoint2 = CGPoint(
                            x: previousPoint.x + (currentPoint.x - previousPoint.x) * 0.5,
                            y: currentPoint.y
                        )
                        
                        path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
                    }
                    
                    path.addLine(to: CGPoint(x: width, y: height))
                    path.addLine(to: CGPoint(x: 0, y: height))
                    path.closeSubpath()
                }
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            AppColors.chartGreen.opacity(0.8),
                            AppColors.chartGreen.opacity(0.2)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .overlay(
                    Path { path in
                        let width = geometry.size.width
                        let height = geometry.size.height
                        
                        let points = [
                            CGPoint(x: 0, y: height * 0.8),
                            CGPoint(x: width * 0.1, y: height * 0.75),
                            CGPoint(x: width * 0.2, y: height * 0.65),
                            CGPoint(x: width * 0.3, y: height * 0.55),
                            CGPoint(x: width * 0.4, y: height * 0.45),
                            CGPoint(x: width * 0.5, y: height * 0.35),
                            CGPoint(x: width * 0.6, y: height * 0.25),
                            CGPoint(x: width * 0.7, y: height * 0.18),
                            CGPoint(x: width * 0.8, y: height * 0.12),
                            CGPoint(x: width * 0.9, y: height * 0.08),
                            CGPoint(x: width, y: height * 0.05)
                        ]
                        
                        path.move(to: points[0])
                        for i in 1..<points.count {
                            let currentPoint = points[i]
                            let previousPoint = points[i-1]
                            
                            let controlPoint1 = CGPoint(
                                x: previousPoint.x + (currentPoint.x - previousPoint.x) * 0.5,
                                y: previousPoint.y
                            )
                            let controlPoint2 = CGPoint(
                                x: previousPoint.x + (currentPoint.x - previousPoint.x) * 0.5,
                                y: currentPoint.y
                            )
                            
                            path.addCurve(to: currentPoint, control1: controlPoint1, control2: controlPoint2)
                        }
                    }
                    .stroke(AppColors.chartGreen, lineWidth: 2)
                )
            }
            .frame(height: AppSpacing.graphHeight)
            
            HStack {
                VStack(alignment: .leading, spacing: AppSpacing.xs) {
                    Text("+ 5.20%")
                        .font(AppTypography.headline)
                        .fontWeight(.bold)
                        .foregroundColor(AppColors.white)
                    
                    Text("Último mês")
                        .font(AppTypography.caption)
                        .foregroundColor(AppColors.overlayMedium)
                }
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("Ver")
                        .font(AppTypography.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(AppColors.white)
                        .frame(height: AppSpacing.buttonHeight / 3)
                        .padding(.horizontal, AppSpacing.lg)
                        .padding(.vertical, AppSpacing.xs)
                        .background(
                            RoundedRectangle(cornerRadius: AppSpacing.pillRadius)
                                .fill(AppColors.green)
                        )
                }
            }
        }
        .padding(AppSpacing.md)
        .background(
            LinearGradient(
                gradient: Gradient(colors: [
                    AppColors.chartLightBlue,
                    AppColors.primary
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(AppSpacing.chartRadius)
        .shadow(radius: AppRadius.vm)
    }
}
