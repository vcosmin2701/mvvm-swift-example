import Foundation

struct ToDoItemModel: Identifiable {
    var id: UUID
    let title: String
    var isCompleted: Bool
}

