//
//  CountryList.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import SwiftUI

struct CountryList: View {
    @Environment(\.isSearching) var isSearching
    
    @Binding var countries: [Country]
    @Binding var searchText: String

    @State private var showFavourtiesOnly: Bool = false
    
    private var filteredCountries: [Binding<Country>] {
        return $countries.filter {
            if isSearching {
                return $0.wrappedValue.name.contains(searchText)
            } else {
                return !showFavourtiesOnly || $0.wrappedValue.isFavourite
            }
        }
    }
    var body: some View {
        VStack {
            List {
                if !isSearching {
                    Toggle(isOn: $showFavourtiesOnly) {
                        Text("Favourties only")
                    }
                }
                ForEach(filteredCountries) { $country in
                    NavigationLink(destination: CountryDetails(country: $country)) {
                        CountryListRow(country: country)
                    }
                }
            }
        }
        .navigationTitle("Countries (\(filteredCountries.count))")
        .onAppear {
            print("List appeared!")
        }
        .onDisappear {
            print("List disappeared!")
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList(countries: .constant(mockCountries), searchText: .constant(""))
    }
}
