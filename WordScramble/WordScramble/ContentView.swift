//
//  ContentView.swift
//  WordScramble
//
//  Created by jeongguk on 1/9/24.
//

import SwiftUI

struct ContentView: View {
    let people = ["Fim", "Leia", "Luck", "Rey"]
    
    var body: some View {
        List(people, id: \.self) {
            Text("Dynamic Row \($0)")
        }
    }
    
    func testBundles() {
        if let fileURL = Bundle.main.url(forResource: "somefile", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                
            }
        }
    }
    
    func testStrings() {
        let input = """
        a
        b
        c
        """
        let letters = input.components(separatedBy: "\n")
        let letter = letters.randomElement()
        let trimmed = letter?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelledRange.location == NSNotFound
    }
        
}

#Preview {
    ContentView()
}
