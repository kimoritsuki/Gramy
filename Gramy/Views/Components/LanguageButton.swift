import SwiftUI

struct LanguageButton: View {
    let title: String
    let isSelected: Bool
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 30))
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? 
                              color.opacity(0.15) : 
                              Color.gray.opacity(0.05))
                        .shadow(
                            color: isSelected ? 
                                color.opacity(0.3) : 
                                Color.clear,
                            radius: 6,
                            y: 2
                        )
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(
                            isSelected ? 
                                color.opacity(0.5) : 
                                Color.gray.opacity(0.2),
                            lineWidth: isSelected ? 2 : 1
                        )
                )
                .scaleEffect(isSelected ? 1.05 : 1.0)
                .animation(
                    .spring(
                        response: 0.3,
                        dampingFraction: 0.7,
                        blendDuration: 0
                    ),
                    value: isSelected
                )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// Prévisualisation mise à jour
#Preview {
    VStack(spacing: 20) {
        HStack(spacing: 15) {
            LanguageButton(title: "🇫🇷", isSelected: true, color: .blue) {}
            LanguageButton(title: "🇬🇧", isSelected: false, color: .red) {}
            LanguageButton(title: "🇪🇸", isSelected: false, color: .yellow) {}
            LanguageButton(title: "🇩🇪", isSelected: false, color: .orange) {}
        }
        .padding()
        .background(Color.white)
    }
} 
