import Foundation

struct Plant: Identifiable {
    let id: UUID
    let name: String
    let drawingName: String
    
    init(name: String, drawingName: String = "leaves") {
        self.id = UUID()
        self.name = name
        self.drawingName = drawingName
    }
}
