//
//  Itinerary.swift
//  Travel
//
//  Created by Sebastian Ibarra on 10/15/24.
//

import Foundation
import CoreData


final class Itinerary: NSManagedObject, Identifiable {
    
    @NSManaged var name: String
    @NSManaged var saved: Bool
    @NSManaged var arrivalDate: Date
    @NSManaged var departureDate: Date
    
    // One itinerary can have many cities, countries, and days (NSSet)
    @NSManaged var cities: NSSet
    @NSManaged var countries: NSSet
    @NSManaged var days: NSSet
    
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        saved = false
        arrivalDate = Date.now
        departureDate = Date.now
    }
    
    
    // Add and remove methods (use NSSet for adding/removing relationships)
    func addDay(_ dayPlan: DayPlan) {
        self.mutableSetValue(forKey: "days").add(dayPlan)
        dayPlan.itinerary = self
    }
    
    func removeDay(_ dayPlan: DayPlan) {
        self.mutableSetValue(forKey: "days").remove(dayPlan)
        dayPlan.itinerary = nil

    }
    
    func addCity(_ city: City) {
        self.mutableSetValue(forKey: "cities").add(city)
        city.itinerary = self

    }
    
    func removeCity(_ city: City) {
        self.mutableSetValue(forKey: "cities").remove(city)
        city.itinerary = nil

    }
    
    func addCountry(_ country: Country) {
        self.mutableSetValue(forKey: "countries").add(country)
        country.itinerary = self

    }
    
    func removeCountry(_ country: Country) {
        if let currentCountries = self.countries as? Set<Country>, currentCountries.contains(country) {
            self.mutableSetValue(forKey: "countries").remove(country)
            country.itinerary = nil
        } else {
            print("Country not found in itinerary: \(country.countryName)")
        }
    }
    
    // Computed properties to access cities and countries as Swift arrays
    var daysArray: [DayPlan] {
        return (days.allObjects as? [DayPlan] ?? []).sorted { $0.date < $1.date }
    }
    
    var citiesArray: [City] {
        return cities.allObjects as? [City] ?? []
    }
    
    var countriesArray: [Country] {
        return countries.allObjects as? [Country] ?? []
    }
    
    
    
}

extension Itinerary {
    private static var itinerariesFetchRequest: NSFetchRequest<Itinerary> {
        NSFetchRequest(entityName: "Itinerary")
    }
    
    static func all() -> NSFetchRequest<Itinerary> {
        let request: NSFetchRequest<Itinerary> = itinerariesFetchRequest
        request.sortDescriptors = [
            NSSortDescriptor(keyPath: \Itinerary.arrivalDate, ascending: true)
        ]
        return request
    }
    
    
}




extension Itinerary {
    
    @discardableResult
    static func makePreview(count: Int, in context: NSManagedObjectContext) -> [Itinerary] {
        var itineraries = [Itinerary]()
        
        for _ in 0..<count {
            // Create a new itinerary
            let itinerary = Itinerary(context: context)
            itinerary.name = "France Travel Itinerary"
            itinerary.saved = false
            itinerary.arrivalDate = Date.now
            itinerary.departureDate = Calendar.current.date(byAdding: .day, value: 7, to: itinerary.arrivalDate) ?? Date.now
            
            // Create unique country and city instances for each itinerary
            let country = Country(context: context)
            country.countryName = "France"
            itinerary.addCountry(country) // Using the addCountry method
            
            let city = City(context: context)
            city.cityName = "Paris"
            itinerary.addCity(city) // Using the addCity method
            
            for i in 0..<7 {
                let day = DayPlan(context: context) // Pass the managed object context here

                // Use Calendar to add days to arrivalDate
                if let adjustedDate = Calendar.current.date(byAdding: .day, value: i, to: itinerary.arrivalDate) {
                    day.date = adjustedDate
                    itinerary.addDay(day)
                    
                } else {
                    print("Error calculating date for day \(i)")
                }
            }
            
            // Append to the itineraries array
            itineraries.append(itinerary)
        }
        
        
        return itineraries
    }
    
    static func preview(context: NSManagedObjectContext = ItinerariesProvider.shared.viewContext) -> Itinerary {
        return makePreview(count: 1, in: context)[0]
    }
    
    static func empty(context: NSManagedObjectContext = ItinerariesProvider.shared.viewContext) -> Itinerary {
        return Itinerary(context: context)
    }
}
