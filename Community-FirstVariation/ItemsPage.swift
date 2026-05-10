//
//  test.swift
//  Community-FirstVariation
//
//  Created by Sarah Nguyen on 8/5/2026.
//

import SwiftUI

struct ItemDetailView: View {
    let product: Product
    let isBuying: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Product Image
                ZStack {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.gray.opacity(0.05))
                        .frame(height: 400)
                    
                    Image(systemName: product.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                        .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text(product.name)
                            .font(.system(size: 28, weight: .bold))
                        Spacer()
                        Text(isBuying ? "" : product.price)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(.secondary)
                    }
                    
                    Text("Premium Material • Sustainable Fashion")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(5)
                    
                    Text("Description")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    Text("This is a high-quality product designed for comfort and style. Perfect for everyday wear or special occasions. Made with sustainable materials that feel great on your skin.")
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                    
                    // Size Info
                    HStack {
                        Text("Size:")
                            .font(.headline)
                        Text("One Size")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.top, 10)
                }
                .padding(.horizontal)
                
                // Action Buttons
                VStack(spacing: 12) {
                    Button(action: {}) {
                        Text("Save this Item")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color.black)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink {
                        ChatView(product: product, isBuying: isBuying)
                    } label: {
                        Text(isBuying ? "Buy for free" : "Rent this item")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 18)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    HStack(spacing: 4) {
                        Image(systemName: "chevron.left")
                            .fontWeight(.bold)
                        Text("Explore")
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.primary)
                }
            }
        }
    }
}



struct ChatView: View {
    let product: Product
    let isBuying: Bool
    @State private var messageText = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 15) {
                    HStack {
                        Spacer()
                        Text(isBuying ? "Hellooo, Can I have your \(product.name)? It's really nice!" : "Wait this is nice, can I take your \(product.name) for the weekend?")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    HStack {
                        Text("Yeah for sure, It's yours. When do you want it?")
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
                TextField("Message \(product.ownerName)...", text: $messageText)
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
        .navigationTitle("Chat with \(product.ownerName)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetailView(product: Product(name: "Item", price: "Free", imageName: "tshirt.fill", ownerName: "Gale"), isBuying: false)
    }
}
