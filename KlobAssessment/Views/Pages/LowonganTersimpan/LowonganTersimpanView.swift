//
//  LowonganTersimpanView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct LowonganTersimpanView: View {
    @Binding var lowonganTersimpanVm: LowonganTersimpanViewModel
    
    var body: some View {
        Group {
            if lowonganTersimpanVm.savedJobs.isEmpty {
                emptyState
            } else {
                listSavedJob
            }
        }
    }
}

extension LowonganTersimpanView {
    private var listSavedJob: some View {
        VStack(alignment: .leading) {
            Text("Lamaran Terkirim")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundStyle(Color(.blue27))
                .padding()
            
            ScrollView {
                LazyVStack {
                    ForEach(Array(lowonganTersimpanVm.savedJobs), id: \.self) { dataJob in
                        JobCardView(viewModel: $lowonganTersimpanVm, dataJob: dataJob, pageSection: .lowonganTersimpan)
                    }
                }
            }
        }
        .background(Color(.blueF5))
    }
}

#Preview {
    @Previewable @State var lowonganTersimpanVm = LowonganTersimpanViewModel()
    LowonganTersimpanView(lowonganTersimpanVm: $lowonganTersimpanVm)
}
