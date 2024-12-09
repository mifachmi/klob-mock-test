//
//  LowonganKerjaView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct LowonganKerjaView: View {
    @Binding var lowonganKerjaVm: LowonganKerjaViewModel
    @Binding var lowonganTersimpanVm: LowonganTersimpanViewModel
    
    var body: some View {
        VStack {
            listJobSection
        }
        .onAppear {
            Task {
                await lowonganKerjaVm.fetchData()
            }
        }
    }
}

extension LowonganKerjaView {
    private var listJobSection: some View {
        Group {
            if lowonganKerjaVm.isLoading {
                loadingState
            } else {
                if lowonganKerjaVm.data.isEmpty {
                    emptyState
                } else {
                    VStack(alignment: .leading) {
                        Text("Lowongan Pekerjaan")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.blue27))
                            .padding()
                        
                        List {
                            ForEach(lowonganKerjaVm.data, id: \.self) { dataJob in
                                JobCardView(viewModel: $lowonganTersimpanVm, dataJob: dataJob, pageSection: .lowonganKerja)
                            }
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
        }
    }
}

#Preview {
    @Previewable @State var lowonganKerjaVm = LowonganKerjaViewModel()
    @Previewable @State var lowonganTersimpanVm = LowonganTersimpanViewModel()
    LowonganKerjaView(lowonganKerjaVm: $lowonganKerjaVm, lowonganTersimpanVm: $lowonganTersimpanVm)
}
