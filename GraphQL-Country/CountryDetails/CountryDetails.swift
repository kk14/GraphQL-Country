//
//  CountryDetails.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import SwiftUI

struct CountryDetails: View {
    @ObservedObject var modelData: CountryListViewModel
    
    var country: Country
    
    var countryIndex: Int? {
        modelData.countries.firstIndex(where: { $0.code == country.code})
    }
    
    
    var body: some View {
        VStack {
            Text(country.name)
            Text(country.emoji)
            Text(country.code)
            if let countryIndex {
                FavouriteButton(isSet: $modelData.countries[countryIndex].isFavourite)
            }
        }
    }
}

struct CountryDetails_Previews: PreviewProvider {
    static let modelData = CountryListViewModel()
    static var previews: some View {
        CountryDetails(modelData: modelData, country: mockCountries[0])
    }
}
