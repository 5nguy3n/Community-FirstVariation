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
}

struct MessageThread: Identifiable {
    let id = UUID()
    let sender: String
    let lastMessage: String
    let timestamp: String
    let isUnread: Bool
}

let mockThreads = [
    MessageThread(sender: "Sarah", lastMessage: "Is the jacket still available?", timestamp: "10:30 AM", isUnread: true),
    MessageThread(sender: "Mike", lastMessage: "Thanks for the rental!", timestamp: "Yesterday", isUnread: false),
    MessageThread(sender: "Alex", lastMessage: "Can we meet at 5pm?", timestamp: "Wednesday", isUnread: true),
    MessageThread(sender: "Emma", lastMessage: "The dress fits perfectly!", timestamp: "Monday", isUnread: false),
    MessageThread(sender: "John", lastMessage: "Sent you the location.", timestamp: "Last Week", isUnread: false),
]

let mockProducts = [
    Product(name: "Graphic T-Shirt", price: "Free", imageName: "tshirt.fill"),
    Product(name: "Denim Jacket", price: "Free", imageName: "tshirt.fill"),
    Product(name: "Slim Fit Jeans", price: "Free", imageName: "tshirt.fill"),
    Product(name: "Summer Dress", price: "Free", imageName: "tshirt.fill"),
    Product(name: "Leather Boots", price: "Free", imageName: "shoeprints.fill"),
    Product(name: "Canvas Backpack", price: "Free", imageName: "backpack.fill"),
    Product(name: "Cotton Hoodie", price: "Free", imageName: "tshirt.fill"),
    Product(name: "Woolen Cap", price: "Free", imageName: "sparkles"),
]

struct ContentView: View {
    @State private var searchText = ""
    @State private var isBuyingEnabled = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
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
                            // Buying Toggle
                            Button(action: { isBuyingEnabled.toggle() }) {
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
                        .padding(.vertical, 8)
                    }
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(mockProducts) { product in
                                NavigationLink {
                                    ItemDetailView(product: product)
                                } label: {
                                    VStack(alignment: .leading, spacing: 8) {
                                        ZStack {
                                            RoundedRectangle(cornerRadius: 20)
                                                .fill(Color.gray.opacity(0.1))
                                                .aspectRatio(1, contentMode: .fit)
                                            
                                            Image(systemName: product.imageName)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(product.name)
                                                .font(.headline)
                                                .foregroundColor(.primary)
                                            
                                            Text(product.price)
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
                            .font(.system(size: 40, weight: .bold))
                            .offset(y: 20)
                    }
                }
            }
            .tabItem {
                Label("Explore", systemImage: "safari")
            }
            
            InboxView()
            .tabItem {
                Label("Inbox", systemImage: "bubble.left.and.bubble.right.fill")
            }
            
            NavigationStack {
                Text("Profile")
                    .font(.largeTitle)
                    .navigationTitle("Profile")
            }
            .tabItem {
                Label("Profile", systemImage: "person.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}


struct InboxView: View {
    var body: some View {
        NavigationStack {
            List(mockThreads) { thread in
                HStack(spacing: 15) {
                    ZStack {
                        Circle()
                            .fill(Color.blue.opacity(0.1))
                            .frame(width: 55, height: 55)
                        
                        Text(String(thread.sender.prefix(1)))
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(thread.sender)
                                .font(.headline)
                            Spacer()
                            Text(thread.timestamp)
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Text(thread.lastMessage)
                                .font(.subheadline)
                                .foregroundColor(thread.isUnread ? .primary : .secondary)
                                .lineLimit(2)
                            
                            Spacer()
                            
                            if thread.isUnread {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 10, height: 10)
                            }
                        }
                    }
                }
                .padding(.vertical, 8)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Messages")
        }
    }
}

struct FilterMenu: View {
    let title: String
    let options: [String]
    
    var body: some View {
        Menu {
            ForEach(options, id: \.self) { option in
                Button(option) { }
            }
        } label: {
            HStack {
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
