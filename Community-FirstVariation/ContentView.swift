//
//  ContentView.swift
//  Community-FirstVariation
//
//  Created by Sarah Nguyen on 4/5/2026.
//

import SwiftUI

struct Product: Identifiable {
    let id = UUID()
    let name: String
    let price: String
    let imageName: String
    let ownerName: String
}

struct MessageThread: Identifiable {
    let id = UUID()
    let sender: String
    let lastMessage: String
    let timestamp: String
    let isUnread: Bool
}

let mockThreads = [
    MessageThread(sender: "Kai", lastMessage: "Can I grab that jacket??", timestamp: "10:30 AM", isUnread: true),
    MessageThread(sender: "Bob", lastMessage: "Thanks for the loan!!", timestamp: "Yesterday", isUnread: false),
    MessageThread(sender: "Fiona", lastMessage: "Can I come over at 5 to pick up?", timestamp: "Wed", isUnread: false),
    MessageThread(sender: "Sophie", lastMessage: "The dress looks so good!", timestamp: "Mon", isUnread: true),
    MessageThread(sender: "Aaron", lastMessage: "Sent you the address.", timestamp: "Last Week", isUnread: false),
]

// Renting Mode Products
let mockRentProducts = [
    Product(name: "Graphic T-Shirt", price: "Free", imageName: "tshirt.fill", ownerName: "Sarah"),
    Product(name: "Denim Jacket", price: "Free", imageName: "jacket.fill", ownerName: "Mike"),
    Product(name: "Slim Fit Jeans", price: "Free", imageName: "shorts.fill", ownerName: "Alex"),
    Product(name: "Summer Dress", price: "Free", imageName: "dresses.fill", ownerName: "Emma"),
    Product(name: "Leather Boots", price: "Free", imageName: "shoeprints.fill", ownerName: "John"),
    Product(name: "Red Backpack", price: "Free", imageName: "backpack.fill", ownerName: "Kai"),
    Product(name: "Cotton Hoodie", price: "Free", imageName: "jumper.fill", ownerName: "Fiona"),
    Product(name: "Woolen Cap", price: "Free", imageName: "sparkles", ownerName: "Bob"),
]

// Buying Mode Products (Different set for variety)
let mockBuyProducts = [
    Product(name: "Vintage Crewneck", price: "Free", imageName: "figure.walk", ownerName: "Chloe"),
    Product(name: "Puffer Vest", price: "Free", imageName: "shield.fill", ownerName: "Liam"),
    Product(name: "Cargo Pants", price: "Free", imageName: "square.grid.2x2.fill", ownerName: "Noah"),
    Product(name: "Silk Scarf", price: "Free", imageName: "leaf.fill", ownerName: "Olivia"),
    Product(name: "Canvas Sneakers", price: "Free", imageName: "pawprint.fill", ownerName: "Lucas"),
    Product(name: "Knitted Sweater", price: "Free", imageName: "house.fill", ownerName: "Mia"),
    Product(name: "Beanie Hat", price: "Free", imageName: "sun.max.fill", ownerName: "Zoe"),
    Product(name: "Leather Belt", price: "Free", imageName: "link", ownerName: "James"),
]

// Legacy reference for other components
let mockProducts = mockRentProducts

struct ContentView: View {
    @State private var searchText = ""
    @State private var isBuyingEnabled = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    // Select products based on mode
    var currentProducts: [Product] {
        isBuyingEnabled ? mockBuyProducts : mockRentProducts
    }
    
    var body: some View {
        TabView {
            NavigationStack {
                VStack(spacing: 0) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.secondary)
                        TextField("Search anything...", text: $searchText)
                    }
                    .padding(12)
                    .background(Color.white)
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    .padding(.horizontal)
                    .padding(.bottom, 10)
                    
                    // Filter Bar
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            Button(action: { 
                                withAnimation(.easeInOut) {
                                    isBuyingEnabled.toggle()
                                }
                            }) {
                                HStack(spacing: 6) {
                                    Text("Buying")
                                        .font(.subheadline)
                                    if isBuyingEnabled {
                                        Image(systemName: "checkmark")
                                            .font(.caption2)
                                    }
                                }
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(isBuyingEnabled ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                                .cornerRadius(20)
                                .foregroundColor(isBuyingEnabled ? .blue : .primary)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke(isBuyingEnabled ? Color.blue : Color.clear, lineWidth: 1)
                                )
                            }
                            
                            FilterMenu(title: "Category", options: ["Tops", "Bottoms", "Accessories", "Shoes"])
                            FilterMenu(title: "Size", options: ["XS", "S", "M", "L", "XL"])
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 15)
                    
                    // Explore Grid
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(currentProducts) { product in
                                NavigationLink(destination: ItemDetailView(product: product, isBuying: isBuyingEnabled)) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 25)
                                                .fill(Color.gray.opacity(0.05))
                                                .frame(height: 180)
                                            
                                            Image(systemName: product.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 80, height: 80)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(product.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                            
                                            Text(isBuyingEnabled ? "Buying for Free" : product.price)
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                        .padding(.horizontal, 4)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                }
                .background(Color.white)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Renturn")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                    }
                }
            }
            .tabItem {
                Label("EXPLORE", systemImage: "safari")
            }
            
            InboxView()
            .tabItem {
                Label("INBOX", systemImage: "bubble.left")
            }
            
            ProfileView(products: mockRentProducts)
            .tabItem {
                Label("PROFILE", systemImage: "person")
            }
        }
    }
}

struct FilterMenu: View {
    let title: String
    let options: [String]
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) {}
            }
        } label: {
            HStack(spacing: 4) {
                Text(title)
                    .font(.subheadline)
                Image(systemName: "chevron.down")
                    .font(.caption2)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.1))
            .cornerRadius(20)
            .foregroundColor(.primary)
        }
    }
}

struct InboxView: View {
    var body: some View {
        NavigationStack {
            List(mockThreads) { thread in
                NavigationLink(destination: ChatDetailView(thread: thread)) {
                    HStack(spacing: 15) {
                        ZStack {
                            Circle()
                                .fill(Color.blue.opacity(0.1))
                                .frame(width: 55, height: 55)
                            Text(String(thread.sender.prefix(1)))
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text(thread.sender)
                                    .fontWeight(.bold)
                                Spacer()
                                Text(thread.timestamp)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            
                            Text(thread.lastMessage)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }
                    .padding(.vertical, 5)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("INBOX")
        }
    }
}

#Preview {
    ContentView()
}
