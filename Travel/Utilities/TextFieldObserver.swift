//
//  TextFieldObserver.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import SwiftUI
import Combine
import FirebaseFirestore // Ensure you import Firestore

class TextFieldObserver: ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    @Published var searchResults: [String] = [] // To hold search results
    
    private var cancellable: AnyCancellable?
    private var db = Firestore.firestore() // Firestore reference
    
    @Published var isSearching: Bool = false
    
    init(delay: DispatchQueue.SchedulerTimeType.Stride = .milliseconds(500)) {
        // Debounce logic: wait for `delay` interval after typing stops
        cancellable = $searchText
            .debounce(for: delay, scheduler: DispatchQueue.main)
            .sink { [weak self] in
                self?.debouncedText = $0
                self?.fetchSearchResults(query: $0) // Fetch results when debouncedText changes
            }
    }
    
    private func fetchSearchResults(query: String) {
        guard !query.isEmpty else {
            searchResults = []  // Clear results if the query is empty
            isSearching = false // No need to search if the query is empty
            return
        }
        
        isSearching = true // Start loading

        db.collection("countries-database")
            .whereField("name", isGreaterThanOrEqualTo: query)
            .whereField("name", isLessThanOrEqualTo: query + "\u{f8ff}")
            .getDocuments { [weak self] snapshot, error in
                defer { self?.isSearching = false } // Stop loading after fetching

                if let error = error {
                    print("Error fetching countries: \(error)")
                    self?.searchResults = [] // Clear results on error
                    return
                }
                
                // Map Firestore documents to country names
                self?.searchResults = snapshot?.documents.compactMap { $0.get("name") as? String } ?? []
            }
    }

    
    deinit {
        cancellable?.cancel()
    }
}
