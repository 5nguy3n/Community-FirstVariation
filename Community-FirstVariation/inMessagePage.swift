//
//  ChatDetailView.swift
//  Community-FirstVariation
//
//  Created by antigravity on 9/5/2026.
//

import SwiftUI

struct ChatDetailView: View {
    let thread: MessageThread
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    // Receiver message
                    HStack {
                        Text(thread.lastMessage)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                        Spacer()
                    }
                    
                    // Sender message (You)
                    HStack {
                        Spacer()
                        Text("Hey, Can I rent this for the weekend. Can you do quick pick up?")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    HStack {
                        Text("Yeah just come over i'll hand it to you, when do you want to come over?")
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                        Spacer()
                    }
                }
                .padding()
            }
            
            Divider()
            
            HStack {
                TextField("Message \(thread.sender)...", text: $messageText)
                    .padding(12)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(20)
                
                Button(action: {}) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.blue)
                        .padding(10)
                }
            }
            .padding()
        }
        .navigationTitle(thread.sender)
        .navigationBarTitleDisplayMode(.inline)
    }
}


