//
//  CountryListViewModel.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import CountriesAPI
import Foundation

protocol CountryListViewModelling: ObservableObject {
    var countries: [Country] { get set }
    func fetchCountries()
}

class CountryListViewModel: CountryListViewModelling {
    @Published var countries: [Country] = []

    func fetchCountries() {
        Network.shared.apollo.fetch(query: GetAllCountryQuery()) { result in
            switch result {
            case let .success(graphQLResult):
                if let countries = graphQLResult.data?.countries {
                    DispatchQueue.main.async {
                        self.countries = countries.map {
                            Country(code: $0.code, name: $0.name, emoji: $0.emoji, isFavourite: false)
                        }
                    }
                }
            case .failure:
                print("Failure")
            }
        }
    }
}
