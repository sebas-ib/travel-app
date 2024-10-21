//
//  TextFieldObserver.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import SwiftUI
import Combine

class TextFieldObserver: ObservableObject {
    @Published var debouncedText = ""
    @Published var searchText = ""
    
    private var cancellable: AnyCancellable?
    
    init(delay: DispatchQueue.SchedulerTimeType.Stride = .milliseconds(500)) {
        // Debounce logic: wait for `delay` interval after typing stops
        cancellable = $searchText
            .debounce(for: delay, scheduler: DispatchQueue.main)
            .sink { [weak self] in
                self?.debouncedText = $0
            }
    }
    
    deinit {
        cancellable?.cancel()
    }
}

