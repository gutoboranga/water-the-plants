import SwiftUI

struct PlantInfo: View {
    
    var plant: Plant
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(plant.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(2)                    
                    .padding(.top)
                
                Divider()
                
                Text("Regar em 3 horas")
                    .font(.body)
                
                Text("200ml de água")
                    .font(.body)
                    .padding(.top, 2)
                    .padding(.bottom, 10)
                
                Spacer()
                
            }.padding(.leading)
            
            Spacer()
        }.background(Color.white).cornerRadius(4.0)
         .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 2)
    }
}

struct PlantInfo_Previews: PreviewProvider {
    static var previews: some View {
        PlantInfo(plant: Plant(name: "Lorem Ipsum"))
            .previewLayout(.fixed(width: 150, height: 150))
    }
}

private extension Font {
    static let title: Font = .custom("Georgia", size: 16.0)
    static let body: Font = .custom("AvenirNext-Regular", size: 14.0)
}
