import Foundation

extension PlantGrid {
    class ViewModel: ObservableObject {
        @Published private(set) var plants: [Plant] = []
        
        func loadPlants() {
            self.plants = [
                Plant(name: "Costela de Adão"),
                Plant(name: "Cactus"),
                Plant(name: "Manjericão"),
                Plant(name: "Costela de Adão"),
                Plant(name: "Cactus")
            ]
        }
        
        func plant(at index: Int) -> Plant? {
            guard index < plants.count, index >= 0 else {
                return nil
            }
            return plants[index]
        }
    }
}
