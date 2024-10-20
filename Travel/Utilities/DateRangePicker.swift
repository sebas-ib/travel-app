//
//  DateRangePicker.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import SwiftUI

struct DateRangePicker: View {
    @Binding var startDate: Date
    @Binding var endDate: Date

    var body: some View {
        VStack {
            DatePicker("Arrival", selection: $startDate, in: Date()..., displayedComponents: .date)
            
            DatePicker("Departure", selection: $endDate, in: startDate..., displayedComponents: .date)
        }
    }
}

