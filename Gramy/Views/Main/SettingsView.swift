import SwiftUI

struct SettingsView: View {
    @AppStorage("username") private var username: String = ""
    @AppStorage("notifications") private var notificationsEnabled: Bool = true
    @AppStorage("selectedLanguages") private var selectedLanguagesData: Data = try! JSONEncoder().encode(Set<String>([Language.allLanguages[0].name])) // Par défaut, première langue
    
    private var selectedLanguages: Binding<Set<String>> {
        Binding(
            get: {
                if let decoded = try? JSONDecoder().decode(Set<String>.self, from: selectedLanguagesData) {
                    return decoded
                }
                return []
            },
            set: { newValue in
                if let encoded = try? JSONEncoder().encode(newValue) {
                    selectedLanguagesData = encoded
                }
            }
        )
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Profile")) {
                    TextField("Username", text: $username)
                }
                
                Section(header: Text("Notifications")) {
                    Toggle("Enable Notifications", isOn: $notificationsEnabled)
                }
                
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                            .foregroundColor(.gray)
                    }
                    
                    Link("Privacy Policy", destination: URL(string: "https://votre-site.com/privacy")!)
                    Link("Terms of Service", destination: URL(string: "https://votre-site.com/terms")!)
                }
                
                Section(header: Text("Languages")) {
                    ForEach(Language.allLanguages) { language in
                        HStack {
                            Text(language.flag)
                            Text(language.name)
                            Spacer()
                            if selectedLanguages.wrappedValue.contains(language.name) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            var currentSelection = selectedLanguages.wrappedValue
                            if currentSelection.contains(language.name) {
                                if currentSelection.count > 1 { // Empêcher de désélectionner la dernière langue
                                    currentSelection.remove(language.name)
                                }
                            } else {
                                currentSelection.insert(language.name)
                            }
                            selectedLanguages.wrappedValue = currentSelection
                        }
                    }
                }
                
                if !selectedLanguages.wrappedValue.isEmpty {
                    Section(header: Text("Selected Languages")) {
                        Text("\(selectedLanguages.wrappedValue.count) languages selected")
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    SettingsView()
} 