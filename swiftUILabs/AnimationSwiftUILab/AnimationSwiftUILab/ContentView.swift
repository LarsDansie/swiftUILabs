//
//  ContentView.swift
//  AnimationSwiftUILab
//
//  Created by Lars Dansie on 1/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        AnimationView()
    }
}

struct AnimationView: View {
    @State private var showGo = false
    @State private var animateNumber = false
    @State private var startGame =  false
    @State private var scale: CGFloat = 5.0
    
    @State var animateFirst = false
    @State var animateSecond = false
    @State var animateThird = false
    @State var animateGo = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Text("3")
                            .foregroundStyle(.white)
                            .font(.system(size: 80))
                            .scaleEffect(animateThird ? 0 : 4)
                            .opacity(animateThird ? 1 : 0)
                        Text("2")
                            .foregroundStyle(.white)
                            .font(.system(size: 80))
                            .scaleEffect(animateSecond ? 0 : 4)
                            .opacity(animateSecond ? 1 : 0)
                        Text("1")
                            .foregroundStyle(.white)
                            .font(.system(size: 80))
                            .scaleEffect(animateFirst ? 0 : 4)
                            .opacity(animateFirst ? 1 : 0)
                        Text("Go!")
                            .foregroundStyle(.white)
                            .font(.system(size: 80))
                            .scaleEffect(animateGo ? 1 : 4)
                            .opacity(animateGo ? 1 : 0)
                    }
                    
                    Spacer()
                    Button(action: {
                        startGame.toggle()
                        if startGame {
                            withAnimation(.easeInOut(duration: 0.5).speed(0.5)) {
                                animateThird.toggle()
                            } completion: {
                                withAnimation(.easeInOut(duration: 0.5).speed(0.5)) {
                                } completion: {
                                    withAnimation(.easeInOut(duration: 0.5).speed(0.5)) {
                                        animateSecond.toggle()
                                    } completion: {
                                        withAnimation(.easeInOut(duration: 0.5).speed(0.5)) {
                                            animateFirst.toggle()
                                        } completion: {
                                            withAnimation(.easeIn(duration: 0.5)) {
                                                animateGo.toggle()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }, label: {
                        Text("Start Game")
                            .padding()
                    })
            }
        }
    }
}

#Preview {
    ContentView()
}




