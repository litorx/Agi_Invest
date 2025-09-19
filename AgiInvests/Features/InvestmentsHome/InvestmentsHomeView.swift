import SwiftUI

struct InvestmentsHomeView: View {
    @State private var showingInvestmentsList = false
    @State private var selectedInvestmentType: InvestmentCategory = .crypto
    
    var body: some View {
        ZStack {
            AppColors.primary.ignoresSafeArea(.container, edges: [.top, .leading, .trailing])
            
            VStack {
                AppColors.white
                    .frame(height: AppSpacing.cardHeight)
                    .clipShape(
                        UnevenRoundedRectangle(
                            topLeadingRadius: 0,
                            bottomLeadingRadius: AppSpacing.xl,
                            bottomTrailingRadius: AppSpacing.xl,
                            topTrailingRadius: 0
                        )
                    )
                    .ignoresSafeArea(.all, edges: .top)
                
                Spacer()
            }
            
                VStack(spacing: AppSpacing.zero) {
                VStack(spacing: AppSpacing.lg) {
                    HStack {
                        Text("Resumos e estatísticas")
                            .font(AppTypography.balance)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.white)
                        Spacer()
                    }
                    .padding(.horizontal, AppSpacing.xl)
                    .padding(.top, AppSpacing.xl)
                    
                    HStack(spacing: AppSpacing.zero) {
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.left")
                                .font(AppTypography.navTitle)
                                .foregroundColor(AppColors.gray)
                                .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                        }
                        
                        StatisticsCard()
                        
                        Button(action: {
                        }) {
                            Image(systemName: "chevron.right")
                                .font(AppTypography.navTitle)
                                .foregroundColor(AppColors.gray)
                                .frame(width: AppSpacing.iconSmall, height: AppSpacing.iconSmall)
                        }
                    }
                    .padding(.horizontal, AppSpacing.xl)
                }
                .padding(.bottom, AppSpacing.xl)
                
                VStack(alignment: .leading, spacing: AppSpacing.xxl) {
                    VStack(alignment: .leading, spacing: AppSpacing.sectionSpacing) {
                        Text("Investimento")
                            .font(AppTypography.title2)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.white)
                            .padding(.horizontal, AppSpacing.xl)
                        
                        HStack(spacing: AppSpacing.sectionSpacing) {
                            Button(action: {
                                selectedInvestmentType = .crypto
                                showingInvestmentsList = true
                            }) {
                                InvestmentCategoryCard(title: "Criptomoedas", iconName: "bitcoinsign.circle.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                selectedInvestmentType = .cdi
                                showingInvestmentsList = true
                            }) {
                                InvestmentCategoryCard(title: "CDI até 110%", iconName: "chart.line.uptrend.xyaxis")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                                selectedInvestmentType = .poupanca
                                showingInvestmentsList = true
                            }) {
                                InvestmentCategoryCard(title: "Poupança", iconName: "banknote.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal, AppSpacing.xl)
                    }
                    
                    VStack(alignment: .leading, spacing: AppSpacing.sectionSpacing) {
                        Text("Controle de gastos")
                            .font(AppTypography.title2)
                            .fontWeight(.bold)
                            .foregroundColor(AppColors.white)
                            .padding(.horizontal, AppSpacing.xl)
                        
                        HStack(spacing: AppSpacing.sectionSpacing) {
                                Button(action: {
                                }) {
                                InvestmentCategoryCard(title: "Mercado", iconName: "cart.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                            }) {
                                InvestmentCategoryCard(title: "Saúde", iconName: "cross.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                            
                            Button(action: {
                            }) {
                                InvestmentCategoryCard(title: "Total", iconName: "dollarsign.circle.fill")
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal, AppSpacing.xl)
                    }
                    
                    Spacer()
                }
                .padding(.top, AppSpacing.xl)
            }
        }
        .fullScreenCover(isPresented: $showingInvestmentsList) {
            InvestmentsListView(investmentType: selectedInvestmentType)
        }
    }
}
