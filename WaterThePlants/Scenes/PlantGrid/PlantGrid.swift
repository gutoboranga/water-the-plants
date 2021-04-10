import SwiftUI

struct PlantGrid: View {
    
    private let columns = [GridItem(), GridItem()]
    private let backgroundColor = Color(red: 250/255, green: 245/255, blue: 232/255)
    private let shelfColor = Color(red: 201/255, green: 185/255, blue: 139/255)
    private let sideSpacing: CGFloat = 20
    private var shelfWidth: CGFloat {
        return UIScreen.main.bounds.size.width - (2 * sideSpacing)
    }
    
    @ObservedObject var viewModel: ViewModel
    
    @State private var showNewPlantSheet = false
    
    var body: some View {
        ScrollView {
            TopBar(buttonAction: {
                showNewPlantSheet = true
            }).sheet(isPresented: $showNewPlantSheet) { // fullScreenCover
                AddPlant()
            }
            
            LazyVGrid(columns: columns) {
                ForEach(0..<viewModel.plants.count, id: \.self) { index in
                    if firstItemOnRow(index) {
                        Section(footer: shelfColor
                                    .frame(width: shelfWidth, height: 12)
                                    .padding(.top, -8)
                        ) {
                            if let currentPlant = viewModel.plant(at: index) {
                                PlantView(plant: currentPlant)
                                    
                                if let nextPlant = viewModel.plant(at: index + 1) {
                                    PlantView(plant: nextPlant)
                                }
                            }
                        }
                    }
                }
            }.padding([.leading, .trailing], sideSpacing)
             .onAppear {
                viewModel.loadPlants()
            }
            
            Color.black.frame(height: 200, alignment: .center)
        }.background(
            ZStack {
                backgroundColor                
                Image("texture")
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.orange)
                    .opacity(0.2)
            }.ignoresSafeArea()
        ).ignoresSafeArea(edges: .bottom)
    }
    
    private func firstItemOnRow(_ index: Int) -> Bool {
        return (index % 2 == 0)
    }
}

struct PlantGrid_Previews: PreviewProvider {
    static var previews: some View {
        PlantGrid(viewModel: PlantGrid.ViewModel())
            .previewDevice("iPhone 11")
    }
}
