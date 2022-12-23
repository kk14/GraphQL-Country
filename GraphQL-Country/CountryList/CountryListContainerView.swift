//
//  CountryListContainerView.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 21/12/2022.
//

import SwiftUI

struct CountryListContainerView: View {
    @StateObject private var viewModel = CountryListViewModel()
    //@StateObject private var searchState = SearchState()

    @State private var savedSearches: [SavedSearch] = []
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            CountryList(countries: $viewModel.countries, searchText: $searchText)
        }
        .searchable(if: true, text: $searchText, prompt: "Search by country name", suggestions: {
            ForEach(savedSearches, id: \.id) { savedSearch in
                Text("\(savedSearch.text)").searchCompletion(savedSearch.text)
            }
        })
        .onSubmit(of: .search) {
            savedSearches.append(SavedSearch(text: searchText))
        }
        .onAppear {
            print("ContainerView appeared!")
            viewModel.fetchCountries()
        }
        //.environmentObject(searchState)
        .onDisappear {
            print("ContainerView disappeared!")
        }
    }
}

struct CountryListContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListContainerView()
    }
}


