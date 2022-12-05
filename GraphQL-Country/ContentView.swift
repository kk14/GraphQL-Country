//
//  ContentView.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 05/12/2022.
//

import SwiftUI
import CountriesAPI


struct ContentView: View {
    
    @State private var countries: [GetAllCountryQuery.Data.Country] = []
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(countries, id: \.code) { country in
                    HStack {
                        Text(country.name)
                        Text(country.emoji)
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Countries")
        }
        .onAppear{
            Network.shared.apollo.fetch(query: GetAllCountryQuery()) { result in
                switch result {
                case .success(let graphQLResult):
                    if let countries = graphQLResult.data?.countries {
                        DispatchQueue.main.async {
                            self.countries = countries
                        }
                    }
                case .failure(_):
                    print("Failure")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
