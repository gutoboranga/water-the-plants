import SwiftUI

struct PlantView: View {
    
    var plant: Plant
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack {
                PlantInfo(plant: plant)
                    .offset(y: 20)
                    .frame(maxWidth: 200)
                    .frame(alignment: .center)
                
                PlantDrawing(plantImage: Image(plant.drawingName))
                    .frame(width: 150, height: 200, alignment: .center)
                    .zIndex(1)
                    .padding(.top, 30)
            }
            
            Spacer()
        }
    }
}

struct PlantView_Previews: PreviewProvider {
    static var previews: some View {
        PlantView(plant: Plant(name: "Lorem Ipsum"))
            .previewLayout(.fixed(width: 200, height: 400))
    }
}
