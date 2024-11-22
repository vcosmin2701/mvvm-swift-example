import SwiftUI

struct AddToDoView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ToDoListViewModel
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("To-Do Title", text: $title)
                Button("Add") {
                    viewModel.addToDo(title: title)
                    dismiss()
                }
                .disabled(title.isEmpty)
            }
            .navigationTitle("Add To-Do")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
