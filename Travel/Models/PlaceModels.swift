//
//  PlaceModels.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/19/24.
//
import Foundation
import SwiftUI

import Firebase
import FirebaseStorage

func fetchCountriesData() {
    let storage = Storage.storage()
    // Reference to the JSON file directly
    let storageRef = storage.reference().child("countries.json")

    storageRef.getData(maxSize: 20 * 1024 * 1024) { data, error in
        if let error = error {
            print("Error fetching JSON file: \(error)")
            return
        }

        guard let data = data else {
            print("No data available")
            return
        }

        do {
            let decoder = JSONDecoder()
            let countries = try decoder.decode([Countries].self, from: data)
            for country in countries {
                if country.name == "United States"{
                    print("\(country.name ?? "_")")
                    for state in country.states {
                        print(state?.name ?? "")
                    }
                }
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}




// MARK: - Country Model
struct Countries: Codable, Equatable {
    let id: Int?
    let name: String?
    let iso3: String?
    let iso2: String?
    let numeric_code: String?
    let phone_code: String?
    let capital: String?
    let currency: String?
    let currency_name: String?
    let currency_symbol: String?
    let tld: String?
    let native: String?
    let region: String?
    let region_id: Int?
    let subregion: String?
    let subregion_id: Int?
    let nationality: String?
    let timezones: [Timezone]?
    let latitude: String?
    let longitude: String?
    let states: [States?]
}

struct Timezone: Codable, Equatable {
    let zoneName: String?
    let gmtOffset: Int?
    let gmtOffsetName: String?
    let abbreviation: String?
    let tzName: String?
}

struct States: Codable, Equatable {
    let id: Int?
    let name: String?
    let state_code: String?
    let latitude: String?
    let longitude: String?
    let cities: [Cities?]
}

struct Cities: Codable, Equatable {
    let id: Int?
    let name: String?
    let latitude: String?
    let longitude: String?
}

