import SwiftUI

struct TopBar: View {
    
    private(set) var buttonAction: (() -> ())
    
    var body: some View {
        HStack {
            Text("Water the plants")
                .font(.header)
                .padding(.leading, 30)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.buttonAction()
                }
            }, label: {
                Image(systemName: "plus.square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .accentColor(.green)
            }).frame(width: 60, height: 60)
            .padding(.trailing, 16)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar(buttonAction: {})
            .previewLayout(.fixed(width: 375, height: 75))
    }
}

private extension Font {
    static let header: Font = .custom("AvenirNext-Medium", size: 20.0)
}
