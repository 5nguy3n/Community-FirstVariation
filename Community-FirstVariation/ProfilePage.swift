//
//  ProfilePage.swift
//  Community-FirstVariation
//
//  Created by antigravity on 9/5/2026.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedTab = "PLANNING"
    let products: [Product]
    
    var body: some View {
        VStack(spacing: 0) {
            // Centered App Header
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
                    
                    // Profile Header: Pic + Info Next to it
                    HStack(alignment: .center, spacing: 20) {
                        // Profile Picture
                        ZStack {
                            
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray.opacity(0.2))
                                .clipShape(Circle())
                            
                           
                        }
                        
                        // Username and Stats Row
                        VStack(alignment: .leading, spacing: 15) {
                            Text("christina_lee")
                                .font(.system(size: 22, weight: .black))
                            
                            HStack(spacing: 25) {
                                StatItem(value: "4.9", label: "RATING", hasStar: true)
                                StatItem(value: "12", label: "LISTINGS")
                                StatItem(value: "54", label: "FOLLOWERS")
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)
                    
                    // Bio
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Hello, explore my rentals for the sustainable soul and put my clothes to good use 🌿 ")
                            .font(.system(size: 14))
                            .foregroundColor(.primary.opacity(0.8))
                            .lineSpacing(2)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Controlled gap
                    Spacer().frame(height: 20)
                    
                    // Action Buttons
                    HStack(spacing: 12) {
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
                    
                    // Custom Tab Bar
                    VStack(spacing: 0) {
                        HStack {
                            TabButton(title: "PLANNING", isSelected: selectedTab == "PLANNING") { selectedTab = "PLANNING" }
                            TabButton(title: "RENTALS", isSelected: selectedTab == "RENTALS") { selectedTab = "RENTALS" }
                            TabButton(title: "PURCHASE", isSelected: selectedTab == "PURCHASE") { selectedTab = "PURCHASE" }
                            TabButton(title: "SAVED", isSelected: selectedTab == "SAVED") { selectedTab = "SAVED" }
                        }
                        Divider()
                    }
                    
                    // Tab Content
                    if selectedTab == "PLANNING" {
                        PlanningTabView()
                    } else {
                        VStack {
                            Spacer(minLength: 100)
                            Text("\(selectedTab) Content Coming Soon")
                                .foregroundColor(.gray)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity, minHeight: 400)
                        .background(Color(red: 0.96, green: 0.95, blue: 0.93))
                    }
                }
            }
        }
        .background(Color.white)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct StatItem: View {
    let value: String
    let label: String
    var hasStar: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 2) {
                Text(value)
                    .font(.system(size: 16, weight: .bold))
                if hasStar {
                    Image(systemName: "star.fill")
                        .font(.system(size: 10))
                        .foregroundColor(.orange)
                }
            }
            Text(label)
                .font(.system(size: 8, weight: .bold))
                .foregroundColor(.gray)
        }
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Text(title)
                    .font(.system(size: 11, weight: .bold))
                    .foregroundColor(isSelected ? Color(red: 0.1, green: 0.2, blue: 0.5) : .gray.opacity(0.6))
                
                Rectangle()
                    .fill(isSelected ? Color(red: 0.1, green: 0.2, blue: 0.5) : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
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
                            .font(.system(size: 15, weight: .bold))
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
            
            Spacer(minLength: 80)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.96, green: 0.95, blue: 0.93))
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
