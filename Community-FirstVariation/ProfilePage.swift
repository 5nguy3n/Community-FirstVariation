//
//  ProfilePage.swift
//  Community-FirstVariation
//
//  Created by antigravity on 9/5/2026.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab = "PLANNING"
    @Namespace private var animation
    let products: [Product]
    
    // Mock data for different tabs
    let rentedItems = [
        Product(name: "Graphic T-Shirt", price: "Free", imageName: "tshirt.fill", ownerName: "Sarah"),
        Product(name: "Denim Jacket", price: "Free", imageName: "jacket.fill", ownerName: "Mike")
    ]
    
    let purchasedItems = [
        Product(name: "Slim Fit Jeans", price: "Free", imageName: "shorts.fill", ownerName: "Alex"),
        Product(name: "Leather Boots", price: "Free", imageName: "shoeprints.fill", ownerName: "John")
    ]
    
    let savedItems = [
        Product(name: "Summer Dress", price: "Free", imageName: "dresses.fill", ownerName: "Emma"),
        Product(name: "Red Backpack", price: "Free", imageName: "backpack.fill", ownerName: "Kai"),
        Product(name: "Cotton Hoodie", price: "Free", imageName: "jumper.fill", ownerName: "Fiona")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            // App Header
            ZStack {
                Text("Renturn")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                
                HStack {
                    Spacer()
                    Image(systemName: "bag")
                        .font(.system(size: 20))
                        .padding(8)
                        .background(Color.white)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.2), lineWidth: 1))
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.white)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    
                    // Profile Header Section
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(alignment: .center, spacing: 20) {
                            ZStack {
                                
                                
                                Image(systemName: "person.crop.circle.fill")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .foregroundColor(.gray.opacity(0.2))
                                    .clipShape(Circle())
                                
                             
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Christina_lee")
                                    .font(.system(size: 22, weight: .black))
                                
                                HStack(spacing: 16) {
                                    StatItem(value: "4.6", label: "RATING", hasStar: true)
                                    StatItem(value: "12", label: "LISTINGS")
                                    StatItem(value: "25", label: "FOLLOWERS")
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.top, 20)
                        
                        // Bio
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Hellooo, come and rental for the sustainable soul and put my clothes to good use")
                                .font(.system(size: 14))
                                .foregroundColor(.primary.opacity(0.8))
                                .lineSpacing(2)
                        }
                        .padding(.horizontal)
                        .padding(.top, 25)
                        
                        Spacer().frame(height: 25)
                        
                        // Action Buttons
                        HStack(spacing: 10) {
                            Button(action: {}) {
                                HStack {
                                    Image(systemName: "plus")
                                    Text("List Item")
                                }
                                .font(.system(size: 15, weight: .bold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 14)
                                .background(Color(red: 0.1, green: 0.2, blue: 0.5))
                                .foregroundColor(.white)
                                .cornerRadius(12)
                            }
                            
                            Button(action: {}) {
                                Text("Edit Profile")
                                    .font(.system(size: 15, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 14)
                                    .background(Color.gray.opacity(0.08))
                                    .foregroundColor(.primary)
                                    .cornerRadius(12)
                            }
                            
                            Button(action: {}) {
                                Image(systemName: "square.and.arrow.up")
                                    .font(.system(size: 15))
                                    .padding(14)
                                    .background(Color.gray.opacity(0.08))
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                        
                        Spacer().frame(height: 30)
                    }
                    .background(Color.white)
                    
                    // Animated Tab Bar
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            ForEach(["PLANNING", "RENTALS", "PURCHASE", "SAVED"], id: \.self) { tab in
                                Button(action: {
                                    withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) {
                                        selectedTab = tab
                                    }
                                }) {
                                    VStack(spacing: 12) {
                                        Text(tab)
                                            .font(.system(size: 10, weight: .bold))
                                            .foregroundColor(selectedTab == tab ? Color(red: 0.1, green: 0.2, blue: 0.5) : .gray.opacity(0.6))
                                            .frame(maxWidth: .infinity)
                                        
                                        ZStack {
                                            if selectedTab == tab {
                                                Rectangle()
                                                    .fill(Color(red: 0.1, green: 0.2, blue: 0.5))
                                                    .frame(height: 2)
                                                    .matchedGeometryEffect(id: "underline", in: animation)
                                            } else {
                                                Rectangle()
                                                    .fill(Color.clear)
                                                    .frame(height: 2)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .background(Color.white)
                        Divider()
                    }
                    
                    // Tab Content Area with Beige Background extending down
                    ZStack {
                        // Background color that fills the rest of the ScrollView
                        Color(red: 0.96, green: 0.95, blue: 0.93)
                            .edgesIgnoringSafeArea(.bottom)
                        
                        VStack(spacing: 0) {
                            if selectedTab == "PLANNING" {
                                PlanningTabView()
                                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .trailing)), removal: .opacity))
                            } else if selectedTab == "RENTALS" {
                                ProfileGridView(products: rentedItems)
                                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .trailing)), removal: .opacity))
                            } else if selectedTab == "PURCHASE" {
                                ProfileGridView(products: purchasedItems)
                                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .trailing)), removal: .opacity))
                            } else if selectedTab == "SAVED" {
                                ProfileGridView(products: savedItems)
                                    .transition(.asymmetric(insertion: .opacity.combined(with: .move(edge: .trailing)), removal: .opacity))
                            }
                            
                            // Extra space to ensure the background stays beige even if content is short
                            Spacer(minLength: 500)
                        }
                    }
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ProfileGridView: View {
    let products: [Product]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\(products.count) Items")
                .font(.system(size: 14, weight: .bold))
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.top, 20)
            
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: 16) {
                ForEach(products) { product in
                    NavigationLink(destination: ItemDetailView(product: product, isBuying: false)) {
                        VStack(alignment: .leading, spacing: 10) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.white) // Brighter background for items
                                    .aspectRatio(1, contentMode: .fit)
                                    .shadow(color: Color.black.opacity(0.03), radius: 8, x: 0, y: 4)
                                
                                Image(systemName: product.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 60, height: 60)
                                    .foregroundColor(.gray.opacity(0.6))
                            }
                            
                            VStack(alignment: .leading, spacing: 2) {
                                Text(product.name)
                                    .font(.system(size: 14, weight: .bold))
                                    .foregroundColor(.primary)
                                
                                Text(product.price)
                                    .font(.system(size: 12))
                                    .foregroundColor(.secondary)
                            }
                            .padding(.horizontal, 4)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct StatItem: View {
    let value: String
    let label: String
    var hasStar: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) {
            HStack(spacing: 2) {
                Text(value)
                    .font(.system(size: 18, weight: .bold))
                if hasStar {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundColor(.orange)
                }
            }
            Text(label)
                .font(.system(size: 10, weight: .bold))
                .foregroundColor(.gray)
        }
    }
}

struct PlanningTabView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Rental Planner")
                    .font(.system(size: 24, weight: .bold))
                Text("MANAGE YOUR CLOSET SCHEDULE")
                    .font(.system(size: 9, weight: .bold))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            HStack(spacing: 10) {
                PlannerCard(value: "3", label: "TOTAL BOOKINGS", color: .blue)
                PlannerCard(value: "1", label: "ACTIVE NOW", color: .green)
                PlannerCard(value: "2", label: "PENDING", color: .orange)
            }
            .padding(.horizontal)
            
            VStack(spacing: 15) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                        .padding(6)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(6)
                    
                    Text("February 2026")
                        .font(.system(size: 16, weight: .bold))
                    
                    Spacer()
                    
                    HStack(spacing: 12) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                HStack {
                    ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                        Text(day)
                            .font(.system(size: 10, weight: .bold))
                            .foregroundColor(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 12) {
                    ForEach(1...28, id: \.self) { day in
                        Text("\(day)")
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(day == 14 ? .white : .primary)
                            .frame(width: 26, height: 26)
                            .background(day == 14 ? Color.blue : Color.clear)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 15)
            }
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct PlannerCard: View {
    let value: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(value)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(color)
            
            Text(label)
                .font(.system(size: 7, weight: .bold))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(Color.white)
        .cornerRadius(12)
    }
}

#Preview {
    ProfileView(products: [])
}
