//
//  ContentView.swift
//  ActivityIndicator SwiftUI
//
//  Created by Abdul R. Arraisi on 23/01/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var startAnimating = true
    
    var body: some View {
        VStack(spacing: 100) {
            ZStack {
                ActivityIndicator(startAnimating: $startAnimating)
                
                if !startAnimating {
                    Text("Hello, world!")
                }
            }
            
            Button(action: {
                startAnimating.toggle()
            }, label: {
                Text("Start / Stop")
                    .padding()
            })
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(15)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ActivityIndicator: UIViewRepresentable {
    
    @Binding var startAnimating: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if startAnimating {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
}
