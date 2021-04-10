import SwiftUI

struct PlantDrawing: View {
    
    let plantImage: Image
    let vaseImage: Image = Image("vase")
    
    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            
            plantImage.resizable()
                .frame(width: .infinity, height: .infinity, alignment: .center)
                .aspectRatio(contentMode: .fit)
                .offset(x: 0, y: 10)
            
            vaseImage.resizable()
                .frame(width: 90, height: 80, alignment: .center)
        }
    }
}

struct PlantDrawing_Previews: PreviewProvider {
    static var previews: some View {
        PlantDrawing(plantImage: Image("leaves"))
            .previewLayout(.fixed(width: 150, height: 250))
    }
}
