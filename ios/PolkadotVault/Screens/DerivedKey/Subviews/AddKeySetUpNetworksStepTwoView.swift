//
//  AddKeySetUpNetworksStepTwoView.swift
//  PolkadotVault
//
//  Created by Krzysztof Rodak on 28/04/2023.
//

import Combine
import SwiftUI

struct AddKeySetUpNetworksStepTwoView: View {
    @StateObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading, spacing: 0) {
                NavigationBarView(
                    viewModel: .init(
                        leftButtons: [.init(
                            type: .arrow,
                            action: { presentationMode.wrappedValue.dismiss() }
                        )],
                        rightButtons: [.init(
                            type: .action(
                                Localizable.Onboarding.SetUpNetworks.Step2.Action.done.key
                            ),
                            action: viewModel.onDoneButtonTap
                        )]
                    )
                )
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        // Header
                        Localizable.Onboarding.SetUpNetworks.Step2.Label.step.text
                            .font(PrimaryFont.captionM.font)
                            .foregroundColor(.textAndIconsSecondary)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal, Spacing.large)
                            .padding(.top, Spacing.medium)
                            .padding(.bottom, Spacing.extraExtraSmall)
                        Localizable.Onboarding.SetUpNetworks.Step2.Label.title.text
                            .font(PrimaryFont.titleL.font)
                            .foregroundColor(.textAndIconsPrimary)
                            .padding(.horizontal, Spacing.large)
                            .padding(.bottom, Spacing.large)
                        // Tutorial
                        VStack(alignment: .leading, spacing: Spacing.extraExtraSmall) {
                            sectionOne()
                            sectionTwo()
                            sectionThree()
                        }
                        Spacer()
                    }
                }
            }
            .frame(
                minWidth: geo.size.width,
                minHeight: geo.size.height
            )
            .background(.backgroundSystem)
            .fullScreenModal(
                isPresented: $viewModel.isShowingQRScanner,
                onDismiss: viewModel.onQRScannerDismiss
            ) {
                CameraView(
                    viewModel: .init(
                        isPresented: $viewModel.isShowingQRScanner
                    )
                )
            }
        }
    }

    @ViewBuilder
    func pointCircle(_ number: String) -> some View {
        ZStack(alignment: .center) {
            Circle()
                .foregroundColor(.backgroundPrimary)
                .frame(width: Sizes.pointCircle)
            Text(number)
                .font(PrimaryFont.bodyL.font)
                .foregroundColor(.textAndIconsPrimary)
        }
    }

    @ViewBuilder
    func sectionOne() -> some View {
        HStack(alignment: .top, spacing: Spacing.small) {
            pointCircle("1")
            VStack(alignment: .leading, spacing: Spacing.extraSmall) {
                Localizable.Onboarding.SetUpNetworks.Step2.Label.Step1.one.text
                    .font(PrimaryFont.bodyL.font)
                    .foregroundColor(.textAndIconsPrimary)
                Text(Localizable.setUpNetworkStepTwoStepPartTwo())
                    .foregroundColor(.textAndIconsSecondary)
                    .font(PrimaryFont.bodyM.font)
                Text(Localizable.setUpNetworkStepTwoStepPartThree())
                    .foregroundColor(.textAndIconsSecondary)
                    .font(PrimaryFont.bodyM.font)
            }
            Spacer()
        }
        .padding(Spacing.medium)
        .containerBackground(state: .textContainer)
        .padding(.horizontal, Spacing.medium)
    }

    @ViewBuilder
    func sectionTwo() -> some View {
        HStack(alignment: .center, spacing: Spacing.small) {
            pointCircle("2")
            Localizable.Onboarding.SetUpNetworks.Step2.Label.step2.text
                .font(PrimaryFont.bodyL.font)
                .foregroundColor(.textAndIconsPrimary)
            Spacer()
        }
        .padding(Spacing.medium)
        .containerBackground(state: .textContainer)
        .padding(.horizontal, Spacing.medium)
    }

    @ViewBuilder
    func sectionThree() -> some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            HStack(alignment: .top, spacing: Spacing.small) {
                pointCircle("3")
                Localizable.Onboarding.SetUpNetworks.Step2.Label.step3.text
                    .font(PrimaryFont.bodyL.font)
            }
            ActionButton(
                action: viewModel.onScanTap,
                text: Localizable.Onboarding.SetUpNetworks.Step2.Label.Step3.action.key,
                style: .secondary()
            )
            Spacer()
        }
        .padding(Spacing.medium)
        .containerBackground(state: .textContainer)
        .padding(.horizontal, Spacing.medium)
    }
}

extension AddKeySetUpNetworksStepTwoView {
    final class ViewModel: ObservableObject {
        private let onDoneTap: () -> Void

        @Published var isShowingQRScanner: Bool = false

        init(
            onDoneTap: @escaping () -> Void
        ) {
            self.onDoneTap = onDoneTap
        }

        func onDoneButtonTap() {
            onDoneTap()
        }

        func onScanTap() {
            isShowingQRScanner = true
        }

        func onQRScannerDismiss() {
            onDoneTap()
        }
    }
}

#if DEBUG
    struct AddKeySetUpNetworksStepTwoView_Previews: PreviewProvider {
        static var previews: some View {
            AddKeySetUpNetworksStepTwoView(
                viewModel: .init(onDoneTap: {})
            )
            .preferredColorScheme(.dark)
        }
    }
#endif
