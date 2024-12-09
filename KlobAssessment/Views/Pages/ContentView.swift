//
//  ContentView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isTabShow = PageSection.lowonganKerja
    @State private var lowonganKerjaVm = LowonganKerjaViewModel()
    @State private var lowonganTersimpanVm = LowonganTersimpanViewModel()
    
    var body: some View {
        VStack {
            headerPage
                .padding()
            
            if isTabShow == .lowonganKerja {
                LowonganKerjaView(lowonganKerjaVm: $lowonganKerjaVm, lowonganTersimpanVm: $lowonganTersimpanVm)
            } else if isTabShow == .lowonganTersimpan {
                LowonganTersimpanView(lowonganTersimpanVm: $lowonganTersimpanVm)
            }
            
            footerPage
        }
        .onAppear {
            LowonganKerjaView(lowonganKerjaVm: $lowonganKerjaVm, lowonganTersimpanVm: $lowonganTersimpanVm)
        }
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
                isTabShow = .lowonganKerja
            } label: {
                Text("Lowongan Kerja")
                    .font(.caption)
                    .fontWeight(isTabShow == .lowonganKerja ? .semibold : .light)
            }
            .foregroundStyle(Color(.blue27))
            
            Divider()
                .frame(width: 2, height: 16)
                .background(Color(.blue27))
            
            Button {
                isTabShow = .lowonganTersimpan
            } label: {
                Text("Lowongan Tersimpan")
                    .font(.caption)
                    .fontWeight(isTabShow == .lowonganTersimpan ? .semibold : .light)
            }
            .foregroundStyle(Color(.blue27))
        }
    }
    
    private var footerPage: some View {
        HStack {
            Spacer()
            VStack {
                Image(.klobFooter)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                
                Text("Copyright © 2024 PT DAYA5 REKRUTMEN")
                    .font(.caption2)
                    .foregroundStyle(.white)
                    .padding(.top, 8)
            }
            Spacer()
        }
        .padding(.top, 32)
        .background(Color(.blue27))
    }
    
}

#Preview {
    ContentView()
}
