import SwiftUI

struct StoryView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Section Histoire")
                    .font(.title)
                    .padding()
                
                // Contenu de l'histoire à venir
                
                Spacer()
            }
            .navigationTitle("Histoire")
        }
    }
}

#Preview {
    StoryView()
} 