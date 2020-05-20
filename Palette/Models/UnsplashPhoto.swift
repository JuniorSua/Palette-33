//
//  UnsplashPhoto.swift
//  Palette
//
//  Created by DevMountain on 4/2/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

struct PhotoSearchDictionary: Decodable {
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    
    let urls: URLGroup
    let description: String?
}

struct URLGroup: Decodable {
    let small: String
    let regular: String
}

