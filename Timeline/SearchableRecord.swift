//
//  SearchableRecord.swift
//  Timeline
//
//  Created by Joe Lucero on 8/8/17.
//  Copyright © 2017 Joe Lucero. All rights reserved.
//

import Foundation

protocol SearchableRecord {
    func matches(searchTerm: String) -> Bool
}

/*
 Update the Comment class to conform to the SearchableRecord protocol. Return true if text contains the search term, otherwise return false.
 Update the Post class to conform to the SearchableRecord protocol. Return true if any of the Post comments match, otherwise return false.
 */
