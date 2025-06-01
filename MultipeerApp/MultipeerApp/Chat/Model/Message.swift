//
//  Message.swift
//  MultipeerApp
//
//  Created by Lev Iakimov on 01.06.2025.
//

import Foundation

struct Message: Identifiable {
    let id = UUID()
    let author: String
    let text: String
}
