//
//  Config.swift
//  Recipes
//
//  Created by Michal Kluszewski on 10/17/24.
//
import Foundation

#if DEBUG
let bundleDefaults: NSDictionary = [
    "DATA_URL": "https://example.com/recipes.json",
    "MOCK_DATA": """
        {
            "recipes": [
                {
                    "cuisine": "Malaysian",
                    "name": "Apam Balik",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
                    "source_url": "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
                    "uuid": "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
                    "youtube_url": "https://www.youtube.com/watch?v=6R8ffRRJcrg"
                },
                {
                    "cuisine": "British",
                    "name": "Apple & Blackberry Crumble",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                    "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                    "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
                    "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
                },
                {
                    "cuisine": "British",
                    "name": "Apple Frangipan Tart",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/7276e9f9-02a2-47a0-8d70-d91bdb149e9e/small.jpg",
                    "uuid": "74f6d4eb-da50-4901-94d1-deae2d8af1d1",
                    "youtube_url": "https://www.youtube.com/watch?v=rp8Slv4INLk"
                },
                {
                    "cuisine": "British",
                    "name": "Bakewell Tart",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/dd936646-8100-4a1c-b5ce-5f97adf30a42/small.jpg",
                    "uuid": "eed6005f-f8c8-451f-98d0-4088e2b40eb6",
                    "youtube_url": "https://www.youtube.com/watch?v=1ahpSTf_Pvk"
                },
                {
                    "cuisine": "American",
                    "name": "Banana Pancakes",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b6efe075-6982-4579-b8cf-013d2d1a461b/small.jpg",
                    "source_url": "https://www.bbcgoodfood.com/recipes/banana-pancakes",
                    "uuid": "f8b20884-1e54-4e72-a417-dabbc8d91f12",
                    "youtube_url": "https://www.youtube.com/watch?v=kSKtb2Sv-_U"
                },
                {
                    "cuisine": "British",
                    "name": "Battenberg Cake",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ec1b84b1-2729-4547-99db-5e0b625c0356/small.jpg",
                    "source_url": "https://www.bbcgoodfood.com/recipes/1120657/battenberg-cake",
                    "uuid": "891a474e-91cd-4996-865e-02ac5facafe3",
                    "youtube_url": "https://www.youtube.com/watch?v=aB41Q7kDZQ0"
                },
                {
                    "cuisine": "Canadian",
                    "name": "BeaverTails",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/3b33a385-3e55-4ea5-9d98-13e78f840299/small.jpg",
                    "source_url": "https://www.tastemade.com/videos/beavertails",
                    "uuid": "b5db2c09-411e-4bdf-9a75-a194dcde311b",
                    "youtube_url": "https://www.youtube.com/watch?v=2G07UOqU2e8"
                },
                {
                    "cuisine": "British",
                    "name": "Blackberry Fool",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/ff52841a-df5b-498c-b2ae-1d2e09ea658d/small.jpg",
                    "source_url": "https://www.bbc.co.uk/food/recipes/blackberry_fool_with_11859",
                    "uuid": "8938f16a-954c-4d65-953f-fa069f3f1b0d",
                    "youtube_url": "https://www.youtube.com/watch?v=kniRGjDLFrQ"
                },
                {
                    "cuisine": "British",
                    "name": "Bread and Butter Pudding",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/10818213-3c03-47ae-a7b1-230baa981226/small.jpg",
                    "source_url": "https://cooking.nytimes.com/recipes/1018529-coq-au-vin",
                    "uuid": "02a80f95-09d6-430c-a9da-332584229d6f",
                    "youtube_url": "https://www.youtube.com/watch?v=Vz5W1-BmOE4"
                },
                {
                    "cuisine": "Italian",
                    "name": "Budino Di Ricotta",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/2cac06b3-002e-4df7-bb08-e15bbc7e552d/small.jpg",
                    "source_url": "https://thehappyfoodie.co.uk/recipes/ricotta-cake-budino-di-ricotta",
                    "uuid": "563dbb27-5323-443c-b30c-c221ae598568",
                    "youtube_url": "https://www.youtube.com/watch?v=6dzd6Ra6sb4"
                },
                {
                    "cuisine": "Canadian",
                    "name": "Canadian Butter Tarts",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/f18384e7-3da7-4714-8f09-bbfa0d2c8913/small.jpg",
                    "source_url": "https://www.bbcgoodfood.com/recipes/1837/canadian-butter-tarts",
                    "uuid": "39ad8233-c470-4394-b65f-2a6c3218b935",
                    "youtube_url": "https://www.youtube.com/watch?v=WUpaOGghOdo"
                },
                {
                    "cuisine": "British",
                    "name": "Carrot Cake",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/32afc698-d927-4a90-990f-ec25e9520c08/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/32afc698-d927-4a90-990f-ec25e9520c08/small.jpg",
                    "source_url": "https://www.bbc.co.uk/food/recipes/classic_carrot_cake_08513",
                    "uuid": "7e529e52-f56d-49a2-938f-81aac853cc65",
                    "youtube_url": "https://www.youtube.com/watch?v=asjZ7iTrGKA"
                },
                {
                    "cuisine": "Tunisian",
                    "name": "Cashew Ghoriba Biscuits",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/9c7fa988-1bbe-4bed-9f1a-c9d4d8b311da/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/9c7fa988-1bbe-4bed-9f1a-c9d4d8b311da/small.jpg",
                    "source_url": "http://allrecipes.co.uk/recipe/40152/cashew-ghoriba-biscuits.aspx",
                    "uuid": "7eeb0865-b41c-4a3b-80dd-a69d32dccc7d",
                    "youtube_url": "https://www.youtube.com/watch?v=IqXEZUk4hWI"
                },
                {
                    "cuisine": "British",
                    "name": "Chelsea Buns",
                    "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/4aecd46e-e419-49ec-8888-246b3cc0cc94/large.jpg",
                    "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/4aecd46e-e419-49ec-8888-246b3cc0cc94/small.jpg",
                    "source_url": "https://www.bbc.co.uk/food/recipes/chelsea_buns_95015",
                    "uuid": "7fc217a9-5566-4bf1-b1ce-13bc9e3f2b1a",
                    "youtube_url": "https://www.youtube.com/watch?v=i_zemP3yBKw"
                }
            ]
        }
        """
]
#endif


enum Config {
    enum Error: Swift.Error {
        case missingKey, invalidValue
    }
    
    static var isPreview: Bool {
#if DEBUG
        return ProcessInfo().environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
#else
        return false
#endif
    }

    static func value<T>(for key: String) throws -> T where T: LosslessStringConvertible {
#if DEBUG
        let tmp = ProcessInfo().environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" ? bundleDefaults.object(forKey: key) : Bundle.main.object(forInfoDictionaryKey: key);
        guard let object = tmp else {
            throw Error.missingKey
        }
#else
        guard let object = b.object(forInfoDictionaryKey:key) else {
            throw Error.missingKey
        }
#endif

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw Error.invalidValue
        }
    }
    
    static var responseData: Data? {
#if DEBUG
        return (bundleDefaults.object(forKey: "MOCK_DATA") as! String).data(using: .utf8)
#else
        return nil;
#endif
    }
}
