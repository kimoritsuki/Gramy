import SwiftUI

struct GrammarView: View {
    @StateObject private var viewModel = GrammarViewModel()
    @AppStorage("selectedLanguages") private var selectedLanguagesData: Data = try! JSONEncoder().encode(Set<String>([Language.allLanguages[0].name]))
    
    private var selectedLanguages: [Language] {
        if let decoded = try? JSONDecoder().decode(Set<String>.self, from: selectedLanguagesData) {
            return Language.allLanguages.filter { decoded.contains($0.name) }
        }
        return [Language.allLanguages[0]]
    }
    
    private var columns: [GridItem] {
        let numberOfLanguages = selectedLanguages.count
        let columnsNeeded = min(numberOfLanguages, 5)
        
        if numberOfLanguages <= 3 {
            return Array(repeating: GridItem(.fixed(70), spacing: 20), count: columnsNeeded)
        }
        
        return Array(repeating: GridItem(.flexible(), spacing: 8), count: columnsNeeded)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("Check the grammar of your sentence")
                        .padding()
                        .multilineTextAlignment(.center)
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(selectedLanguages) { language in
                            LanguageButton(
                                title: language.flag,
                                isSelected: viewModel.selectedLanguage == language.name,
                                color: language.color
                            ) {
                                viewModel.selectedLanguage = language.name
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    TextField("Enter your text here...", text: $viewModel.inputText)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                        .frame(maxWidth: geometry.size.width * 0.8)
                    
                    Button(action: viewModel.checkGrammar) {
                        Text("Check")
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                }
                .frame(
                    width: geometry.size.width,
                    height: geometry.size.height,
                    alignment: .center
                )
            }
        }
    }
}

#Preview {
    GrammarView()
}
