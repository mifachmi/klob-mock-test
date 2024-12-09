//
//  ContentView.swift
//  KlobAssessment
//
//  Created by Fachmi Dimas Ardhana on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var jobListViewModel = JobListViewModel()
    
    var body: some View {
        VStack {
            headerPage
                .padding()
            listJobSection
            
        }
        .onAppear {
            Task {
                await jobListViewModel.fetchData()
                //print(jobListViewModel.data)
            }
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
        Group {
            if jobListViewModel.isLoading {
                loadingState
            } else {
                if jobListViewModel.data.isEmpty {
                    emptyState
                } else {
                    VStack(alignment: .leading) {
                        Text("Lowongan Pekerjaan")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.blue27))
                            .padding()
                        
                        List {
                            ForEach(jobListViewModel.data, id: \.self) { dataJob in
                                JobCardView(dataJob: dataJob)
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
    
    private var emptyState: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("No Data")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundStyle(Color(.blue27))
        }
    }
    
    private var loadingState: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5, anchor: .center)
    }
}

#Preview {
    ContentView()
}
