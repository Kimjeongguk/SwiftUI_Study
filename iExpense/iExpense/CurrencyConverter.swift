//
//  CurrencyConverter.swift
//  iExpense
//
//  Created by jeongguk on 1/22/24.
//

import Foundation

struct CurrencyConverter {
    let currencys = ["USD", "KRW", "JPY", "EUR"]
    let exchangeRates: [String: Double] = [
        "USD" : 1.0,
        "KRW" : 1338.01,
        "JPY" : 148.0,
        "EUR" : 0.92
    ]
    
    func convert(amount: Double, fromCurrency: String, toCurrency: String) -> Double? {
        guard let fromRate = exchangeRates[fromCurrency],
              let toRate = exchangeRates[toCurrency] else {
            return nil
        }
        
        let convertedAmount = amount * (toRate / fromRate)
        return convertedAmount
    }
}
