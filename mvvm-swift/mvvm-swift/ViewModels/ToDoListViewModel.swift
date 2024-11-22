import Foundation

class ToDoListViewModel: ObservableObject {
    @Published var toDo = [ToDoItemModel]()
    
    func addToDo(title: String) {
        let newItem = ToDoItemModel(id: UUID(), title: title, isCompleted: false)
        toDo.append(newItem)
    }
    
    func toggleCompletion(for item: ToDoItemModel) {
        if let index = toDo.firstIndex(where: {$0.id == item.id}) {
            toDo[index].isCompleted.toggle()
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        toDo.remove(atOffsets: offsets)
    }
}
