import SwiftUI

struct Language: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let flag: String
    let color: Color
    
    static let allLanguages: [Language] = [
        Language(name: "French", flag: "🇫🇷", color: .blue),
        Language(name: "English", flag: "🇬🇧", color: .red),
        Language(name: "Spanish", flag: "🇪🇸", color: .yellow),
        Language(name: "German", flag: "🇩🇪", color: .orange),
        Language(name: "Italian", flag: "🇮🇹", color: .green),
        Language(name: "Portuguese", flag: "🇵🇹", color: .purple),
        Language(name: "Dutch", flag: "🇳🇱", color: .orange),
        Language(name: "Polish", flag: "🇵🇱", color: .red),
        Language(name: "Russian", flag: "🇷🇺", color: .blue),
        Language(name: "Chinese", flag: "🇨🇳", color: .red),
        Language(name: "Japanese", flag: "🇯🇵", color: .pink),
        Language(name: "Korean", flag: "🇰🇷", color: .blue)
    ]
} 
