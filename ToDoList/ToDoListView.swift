import SwiftUI

struct TodoItem: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct TodoListView: View {
    @State private var todos: [TodoItem] = [
        TodoItem(title: "Belajar SwiftUI dasar"),
        TodoItem(title: "Membuat aplikasi To-Do List", isCompleted: true),
        TodoItem(title: "Olahraga sore")
    ]
    
    @State private var newTodoTitle: String = ""
    @State private var searchText: String = ""
    
    var filteredTodos: [TodoItem] {
        if searchText.isEmpty {
            return todos
        } else {
            return todos.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    TextField("Tambah tugas baru...", text: $newTodoTitle)
                        .textFieldStyle(.plain)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                    
                    Button(action: addTodo) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.blue)
                    }
                    .disabled(newTodoTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                }
                .padding()
                
                if filteredTodos.isEmpty {
                    ContentUnavailableView(
                        "Tidak Ada Tugas",
                        systemImage: "checkmark.circle",
                        description: Text("Semua tugas selesai atau belum ada data.")
                    )
                } else {
                    List {
                        ForEach(filteredTodos) { todo in
                            HStack {
                                Button(action: { toggleComplete(for: todo) }) {
                                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                        .foregroundColor(todo.isCompleted ? .green : .gray)
                                        .font(.title3)
                                }
                                .buttonStyle(.plain)
                                
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted, color: .gray)
                                    .foregroundColor(todo.isCompleted ? .gray : .primary)
                                
                                Spacer()
                            }
                            .padding(.vertical, 4)
                        }
                        .onDelete(perform: deleteTodo)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("To-Do List")
            .searchable(text: $searchText, prompt: "Cari tugas...")
        }
    }
    
    private func addTodo() {
        let trimmed = newTodoTitle.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else { return }
        
        let newItem = TodoItem(title: trimmed)
        todos.insert(newItem, at: 0)
        newTodoTitle = ""
    }
    
    private func toggleComplete(for item: TodoItem) {
        if let index = todos.firstIndex(where: { $0.id == item.id }) {
            todos[index].isCompleted.toggle()
        }
    }
    
    private func deleteTodo(at offsets: IndexSet) {
        let itemsToDelete = offsets.map { filteredTodos[$0] }
        todos.removeAll { item in
            itemsToDelete.contains(where: { $0.id == item.id })
        }
    }
}
