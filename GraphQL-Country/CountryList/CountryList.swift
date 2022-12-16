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
                    ForEach(filteredCountries, id: \.code) { country in
                        NavigationLink {
                            CountryDetails(modelData: viewModel, country: country)
                        } label: {
                            CountryListRow(country: country)
                        }
                    }
                }
            }
            .navigationTitle("Countries")
        }
        .onAppear{
            viewModel.fetchCountries()
        }
        .environmentObject(viewModel)
    }

}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
    }
}
