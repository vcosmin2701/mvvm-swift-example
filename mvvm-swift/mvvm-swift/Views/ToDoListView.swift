import SwiftUI

struct ToDoListView: View {
    @StateObject private var viewModel = ToDoListViewModel()
    @State private var showAddView = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.toDo) { item in
                    HStack {
                        Text(item.title)
                            .strikethrough(item.isCompleted, color: .gray)
                        Spacer()
                        Button(action: {
                            viewModel.toggleCompletion(for: item)
                        }) {
                            Image(systemName: item.isCompleted ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(item.isCompleted ? .green : .gray)
                        }
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showAddView = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddView) {
                AddToDoView(viewModel: viewModel)
            }
        }
    }
}

#Preview {
    ToDoListView()
}
