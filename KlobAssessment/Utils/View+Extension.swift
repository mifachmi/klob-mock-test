//
//  View+Extension.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

enum PageSection {
    case lowonganKerja
    case lowonganTersimpan
}

extension View {
    var emptyState: some View {
        VStack {
            Spacer()
            VStack {
                Image(systemName: "exclamationmark.triangle")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                Text("No Data")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color(.blue27))
            }
            Spacer()
        }
    }
    
    var loadingState: some View {
        VStack {
            Spacer()
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5, anchor: .center)
            Spacer()
        }
    }
}
