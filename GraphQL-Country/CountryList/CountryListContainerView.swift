//
//  CountryListContainerView.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 21/12/2022.
//

import SwiftUI

struct CountryListContainerView: View {
    @StateObject private var viewModel = CountryListViewModel()

    var body: some View {
        NavigationView {
            CountryList(countries: $viewModel.countries)
        }
        .onAppear {
            print("ContainerView appeared!")
            viewModel.fetchCountries()
        }
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


