// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllCountryQuery: GraphQLQuery {
  public static let operationName: String = "GetAllCountry"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query GetAllCountry {
        countries {
          __typename
          code
          name
          emoji
        }
      }
      """
    ))

  public init() {}

  public struct Data: CountriesAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { CountriesAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("countries", [Country].self),
    ] }

    public var countries: [Country] { __data["countries"] }

    /// Country
    ///
    /// Parent Type: `Country`
    public struct Country: CountriesAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { CountriesAPI.Objects.Country }
      public static var __selections: [Selection] { [
        .field("code", ID.self),
        .field("name", String.self),
        .field("emoji", String.self),
      ] }

      public var code: ID { __data["code"] }
      public var name: String { __data["name"] }
      public var emoji: String { __data["emoji"] }
    }
  }
}
