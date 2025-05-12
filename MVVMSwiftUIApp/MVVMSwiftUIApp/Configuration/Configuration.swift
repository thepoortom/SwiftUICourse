//
//  Configuration.swift
//  MVVMSwiftUIApp
//
//  Created by Lev Iakimov on 21.04.2025.
//

struct Configuration {
    static let current: Configuration = Configuration()
    
    let baseURL: String = "https://www.cheapshark.com/api"
    let apiVersion: String = "/1.0"
}
