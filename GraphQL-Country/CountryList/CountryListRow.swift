//
//  CountryListRow.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import SwiftUI
import CountriesAPI

struct CountryListRow: View {
    
    var country: Country
    
    var body: some View {
        HStack{
            Text(country.emoji)
                .shadow(radius: 7)
                .font(.title)
            Text(country.name)
            Spacer()
            if country.isFavourite == true {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct CountryListRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CountryListRow(country: mockCountries[0]) //favourite - true
            CountryListRow(country: mockCountries[1]) //favourite - false
        }
    }
}
