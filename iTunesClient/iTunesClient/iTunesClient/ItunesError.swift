//
//  ItunesError.swift
//  iTunesClient
//
//  Created by Ievgeniia Bondini on 4/10/19.
//  Copyright © 2019 Treehouse Island. All rights reserved.
//

import Foundation


enum ItunesError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case jsonParsingFailure(message: String)
}
