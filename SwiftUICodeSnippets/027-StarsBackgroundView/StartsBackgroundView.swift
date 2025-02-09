//
//  StartsBackgroundView.swift
//  SwiftUICodeSnippets
//
//  Created by Mason Sun on 2025/2/9.
//

import SwiftUI

struct StartsBackgroundView: View {
    // 创建随机星星位置
    private let stars: [CGPoint] = (0..<50).map { _ in
        CGPoint(
            x: CGFloat.random(in: 0...1),
            y: CGFloat.random(in: 0...1)
        )
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 深色渐变背景
                LinearGradient(
                    colors: [
                        Color(red: 0.1, green: 0.1, blue: 0.2),
                        Color(red: 0.2, green: 0.2, blue: 0.3)
                    ],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                // 星星层
                ForEach(0..<stars.count, id: \.self) { index in
                    Circle()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: randomStarSize(), height: randomStarSize())
                        .position(
                            x: stars[index].x * geometry.size.width,
                            y: stars[index].y * geometry.size.height
                        )
                        .modifier(StarPulseModifier())
                }
            }
        }
    }
    
    // 随机星星大小
    private func randomStarSize() -> CGFloat {
        CGFloat.random(in: 1...3)
    }
}

// 星星闪烁动画修饰器
private struct StarPulseModifier: ViewModifier {
    @State private var isAnimating = false
    
    func body(content: Content) -> some View {
        content
            .opacity(isAnimating ? 0.5 : 1.0)
            .onAppear {
                withAnimation(
                    .easeInOut(duration: Double.random(in: 1.5...3.0))
                    .repeatForever(autoreverses: true)
                ) {
                    isAnimating.toggle()
                }
            }
    }
}

struct GoProSectionView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("Upgrade to Pro and unlock all features")
                .foregroundStyle(.white)
                .font(.title3)
                .fontWeight(.medium)
            Text("Learn More")
                .font(.headline)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.black)
                .clipShape(Capsule())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(20)
        .background {
            StartsBackgroundView()
        }
    }
}

#Preview {
    GoProSectionView()
}
