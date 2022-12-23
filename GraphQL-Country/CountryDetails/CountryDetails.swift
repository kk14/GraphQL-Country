//
//  CountryDetails.swift
//  GraphQL-Country
//
//  Created by Kanishk Kumar on 15/12/2022.
//

import SwiftUI

//class SearchState: ObservableObject {
//    @Published var shouldShowSearch: Bool = true
//}

struct CountryDetails: View {
    //@EnvironmentObject var searchState : SearchState
    @Binding var country: Country

    @State var contentSize: CGSize = CGSizeZero

    var body: some View {
        VStack {
            Text(country.emoji)
                .font(.system(size: 100))
                .measureSize({ size in
                    contentSize = size
                })
                .circeOverlay(withSize: CGSizeMake(contentSize.width + 16.0, contentSize.height + 16.0))

            VStack(alignment: .leading) {
                HStack {
                    Text(country.name)
                        .font(.largeTitle)
                    FavouriteButton(isSet: $country.isFavourite)
                    Spacer()
                }
                Text(country.code)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(EdgeInsets(top: -32, leading: 16, bottom: 0, trailing: 0))

            Divider()
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            //searchState.shouldShowSearch = false
            print("DetailView appeared!")
        }
        .onDisappear {
            //searchState.shouldShowSearch = true
            print("DetailView disappeared!")
        }
    }
}

struct CountryDetails_Previews: PreviewProvider {
    static let modelData = CountryListViewModel()
    static var previews: some View {
        CountryDetails(country: .constant(mockCountries[0]))
    }
}
