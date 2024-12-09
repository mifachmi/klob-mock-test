//
//  ContentView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            headerPage
                .padding()
            listJobSection
            
        }
        //.padding()
    }
}

extension ContentView {
    private var headerPage: some View {
        HStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("Lowongan Kerja")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .foregroundStyle(Color(.blue27))
            
            
            
            Divider()
                .frame(width: 2, height: 16)
                .background(Color(.blue27))
            
            Button {
                
            } label: {
                Text("Lowongan Tersimpan")
                    .font(.caption)
                    .fontWeight(.light)
            }
            .foregroundStyle(Color(.blue27))
            
        }
    }
    
    private var listJobSection: some View {
        VStack(alignment: .leading) {
            Text("Lowongan Pekerjaan")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color(.blue27))
                .padding()
            
            List {
                JobCardView()
            }
            .listRowInsets(.none)
            .listStyle(PlainListStyle())
            .listRowBackground(Color(.blueD9))
            .padding()
            .padding(.top, -24)
        }
        .background(Color(.blueF5))
    }
}

#Preview {
    ContentView()
}
