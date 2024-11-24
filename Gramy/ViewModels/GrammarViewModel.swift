import Foundation

class GrammarViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var selectedLanguage: String = "English"
    
    func checkGrammar() {
        // Logique de vérification de la grammaire
    }
} 