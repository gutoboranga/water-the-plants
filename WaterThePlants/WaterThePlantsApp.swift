import SwiftUI

@main
struct WaterThePlantsApp: App {
    var body: some Scene {
        WindowGroup {
            PlantGrid(viewModel: PlantGrid.ViewModel())
        }
    }
}
