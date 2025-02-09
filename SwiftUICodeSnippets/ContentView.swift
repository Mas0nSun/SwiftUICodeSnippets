//
//  ContentView.swift
//  SwiftUICodeSnippets
//
//  Created by Mason Sun on 2024/12/22.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var list
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(AllComponents.allCases, id: \.self) { component in
                    NavigationLink {
                        component.makeView()
                            .navigationBarBackButtonHidden()
                            .navigationTransition(.zoom(sourceID: component, in: list))
                    } label: {
                        Text(component.rawValue)
                    }
                    .matchedTransitionSource(
                        id: component,
                        in: list
                    )
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

enum AllComponents: String, CaseIterable {
    case rainbowText = "RainbowText"
    case scaledButton = "ScaledButton"
    case buttonRotateAnimation = "ButtonRotateAnimation"
    case segmentedControl = "SegmentedControl"
    case symbolImageAnimation = "SymbolImageAnimation"
    case popoverTip = "PopoverTip"
    case polishAnimation = "PolishAnimation"
    case navigationTransition = "NavigationTransition"
    case imageTransition = "ImageTransition"
    case stickyHeader = "StickyHeader"
    case rainbowButton = "RainbowButton"
    case animatedBorder = "AnimatedBorder"
    case funnyToggle = "FunnyToggle"
    case todoCell = "TodoCell"
    case scrollTransition = "ScrollTransition"
    case meshGradient = "MeshGradient"
    case loginPage = "LoginPage"
    case subscribePage = "SubscribePage"
    case numericAnimation = "NumericAnimation"
    case waveShader = "WaveShader"
    case snowShader = "SnowShader"
    case daysPostponement = "DaysPostponement"
    case calendarCard = "CalendarCard"
    case purchaseCard = "PurchaseCad"
    case backgroundColor = "BackgroundColor"
    case horizontalPicker = "HorizontalPicker"
    case starsBackgroundView = "StarsBackgroundView"
    
    @ViewBuilder
    func makeView() -> some View {
        switch self {
        case .rainbowText:
            RainbowTextNumericView()
        case .scaledButton:
            ScaledButtonView()
        case .buttonRotateAnimation:
            ButtonRotateAnimation()
        case .segmentedControl:
            CustomSegmentedControl()
        case .symbolImageAnimation:
            SymbolImageAnimation()
        case .popoverTip:
            PopoverTipView()
        case .polishAnimation:
            PolishView()
        case .navigationTransition:
            NavigationTransitionAnimationView()
        case .imageTransition:
            ImageTransitionAnimationView()
        case .stickyHeader:
            StickyHeaderView()
        case .rainbowButton:
            RainbowButton()
        case .animatedBorder:
            AnimatedBorderView()
        case .funnyToggle:
            FunnyToggleView()
        case .todoCell:
            TodoCellsView()
        case .scrollTransition:
            ScrollViewTransition()
        case .meshGradient:
            MeshGradientView()
        case .loginPage:
            LoginPage()
        case .subscribePage:
            SubscribePage()
        case .numericAnimation:
            NumericAnimationView()
        case .waveShader:
            WaveShaderView()
        case .snowShader:
            SnowShaderView()
        case .daysPostponement:
            DaysPostponementView()
        case .calendarCard:
            CalendarCardView()
        case .purchaseCard:
            PurchaseCardView()
        case .backgroundColor:
            BackgroundColorAnimationView()
        case .horizontalPicker:
            HorizontalPickerView()
        case .starsBackgroundView:
            GoProSectionView()
        }
    }
}
