//
//  CountryList.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import SwiftUI

struct CountryList: View {
    @StateObject private var viewModel = CountryListViewModel()
    @State private var showFavourtiesOnly: Bool = false
    @State private var searchText = ""

    var filteredCountries: [Country] {
        viewModel.countries.filter {
            (!showFavourtiesOnly || $0.isFavourite)
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Toggle(isOn: $showFavourtiesOnly) {
                        Text("Favourties only")
                    }
                    ForEach(searchResults, id: \.code) { country in
                        NavigationLink {
                            CountryDetails(modelData: viewModel, country: country)
                        } label: {
                            CountryListRow(country: country)
                        }
                    }
                }
            }
            .navigationTitle("Countries (\(filteredCountries.count))")
        }
        .searchable(text: $searchText, prompt: "Search country names") {
            ForEach(searchResults, id: \.code) { country in
                Text("\(country.name)").searchCompletion(country.name)
            }
        }
        .onAppear{
            viewModel.fetchCountries()
        }
        .environmentObject(viewModel)
    }

    var searchResults: [Country] {
        guard !searchText.isEmpty else {
            return filteredCountries
        }
        return filteredCountries.filter { country in
            country.name.contains(searchText)
        }
    }

}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
