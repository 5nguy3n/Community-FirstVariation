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
            // App Header
            HStack {
                Text("Renturn")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.45))
                Spacer()
                Image(systemName: "bag")
                    .font(.system(size: 20))
                    .padding(8)
                    .background(Color.white)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray.opacity(0.2), lineWidth: 1))
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            .background(Color.white)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Profile Header Section
                    HStack(alignment: .top) {
                        // Profile Pic with Circular Badge
                        ZStack {
                            // Simulated circular text/border
                            Circle()
                                .strokeBorder(Color.green.opacity(0.2), lineWidth: 10)
                                .frame(width: 100, height: 100)
                                .overlay(
                                    Text("SUSTAINABLE STORE • CO2 SAVED")
                                        .font(.system(size: 6, weight: .bold))
                                        .foregroundColor(.green.opacity(0.6))
                                        // In a real app we'd use a custom view for curved text
                                )
                            
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .foregroundColor(.gray.opacity(0.2))
                                .clipShape(Circle())
                            
                            // Verified Badge
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                                .background(Color.white.clipShape(Circle()))
                                .offset(x: 30, y: 30)
                        }
                        
                        Spacer()
                        
                        // Settings Gear
                        Button(action: {}) {
                            Image(systemName: "gearshape")
                                .font(.system(size: 20))
                                .foregroundColor(.gray)
                                .padding(10)
                                .background(Color.gray.opacity(0.05))
                                .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    
                    // Username & Bio
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 8) {
                            Text("vogue_vintage")
                                .font(.system(size: 28, weight: .bold))
                            
                            
                        }
                        
                        Text("Vogue Vintage Boutique")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                        
                        // Stats Row
                        HStack(spacing: 30) {
                            StatItem(value: "4.9", label: "RATING", hasStar: true)
                            StatItem(value: "28", label: "LISTINGS")
                            StatItem(value: "1.2k", label: "FOLLOWERS")
                        }
                    
                    }
                    .padding(.horizontal)
                    
                    // Action Buttons
                    HStack(spacing: 12) {
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "plus")
                                Text("List Item")
                            }
                            .font(.system(size: 16, weight: .bold))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(Color(red: 0.1, green: 0.2, blue: 0.5))
                            .foregroundColor(.white)
                            .cornerRadius(16)
                        }
                        
                        Button(action: {}) {
                            Text("Edit Profile")
                                .font(.system(size: 16, weight: .semibold))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 16)
                                .background(Color.gray.opacity(0.08))
                                .foregroundColor(.primary)
                                .cornerRadius(16)
                        }
                        
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                                .padding(16)
                                .background(Color.gray.opacity(0.08))
                                .cornerRadius(16)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Custom Tab Bar
                    VStack(spacing: 0) {
                        HStack {
                            TabButton(title: "PLANNING", isSelected: selectedTab == "PLANNING") { selectedTab = "PLANNING" }
                            TabButton(title: "RENTALS", isSelected: selectedTab == "RENTALS") { selectedTab = "RENTALS" }
                            TabButton(title: "SAVED", isSelected: selectedTab == "SAVED") { selectedTab = "SAVED" }
                        }
                        .padding(.top, 10)
                        Divider()
                    }
                    
                    // Tab Content
                    if selectedTab == "PLANNING" {
                        PlanningTabView()
                    } else {
                        // Placeholder for other tabs
                        VStack {
                            Spacer()
                            Text("\(selectedTab) Content")
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
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
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

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 12) {
                Text(title)
                    .font(.system(size: 12, weight: .bold))
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
        VStack(alignment: .leading, spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Rental Planner")
                    .font(.system(size: 28, weight: .bold))
                Text("MANAGE YOUR CLOSET SCHEDULE")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            // Planner Stats Cards
            HStack(spacing: 12) {
                PlannerCard(value: "3", label: "TOTAL BOOKINGS", color: .blue)
                PlannerCard(value: "1", label: "ACTIVE NOW", color: .green)
                PlannerCard(value: "2", label: "PENDING", color: .orange)
            }
            .padding(.horizontal)
            
            // Calendar View Placeholder
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.blue)
                        .padding(8)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                    
                    Text("February 2026")
                        .font(.headline)
                    
                    Spacer()
                    
                    HStack(spacing: 15) {
                        Image(systemName: "chevron.left")
                        Image(systemName: "chevron.right")
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                }
                .padding(.horizontal)
                
                // Days of week
                HStack {
                    ForEach(["S", "M", "T", "W", "T", "F", "S"], id: \.self) { day in
                        Text(day)
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.gray.opacity(0.4))
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal)
                
                // Simplified Dates Grid
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 15) {
                    ForEach(1...28, id: \.self) { day in
                        Text("\(day)")
                            .font(.system(size: 14, weight: .medium))
                            .foregroundColor(day == 14 ? .white : .primary)
                            .frame(width: 30, height: 30)
                            .background(day == 14 ? Color.blue : Color.clear)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding(.vertical)
            .background(Color.white)
            .cornerRadius(24)
            .padding(.horizontal)
            
            Spacer(minLength: 100)
        }
        .frame(maxWidth: .infinity)
        .background(Color(red: 0.96, green: 0.95, blue: 0.93)) // Light beige background
    }
}

struct PlannerCard: View {
    let value: String
    let label: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(color)
            
            Text(label)
                .font(.system(size: 8, weight: .bold))
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
        .background(Color.white)
        .cornerRadius(16)
    }
}

#Preview {
    ProfileView(products: [])
}
