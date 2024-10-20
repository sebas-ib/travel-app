//
//  PlaceModels.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import Foundation

// MARK: - Country Model
struct Country: Codable, Identifiable {
    let id: Int
    let name: String
    let capital: String
    let regions: [Region]
}

// MARK: - Region Model (formerly State)
struct Region: Codable, Identifiable {
    let id: Int
    let name: String
    let cities: [City]
}

// MARK: - City Model
struct City: Codable, Identifiable {
    let id: Int
    let name: String
}

func loadCountries() -> [Country] {
    guard let url = Bundle.main.url(forResource: "countries+states+cities", withExtension: "json") else {
        print("Could not find the JSON file.")
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode([Country].self, from: data)
    } catch {
        print("Error loading JSON: \(error)")
        return []
    }
}
