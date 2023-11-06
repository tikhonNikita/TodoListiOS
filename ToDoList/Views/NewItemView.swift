//
//  NewItemView.swift
//  ToDoList
//
//  Created by Nikita Tikhonov on 24.10.2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var vm = ViewModel()
    @Binding var showNewItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 70)
            Form {
                TextField("Title", text: $vm.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .padding()
                DatePicker("Due Date", selection: $vm.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                TLButton(title: "Save", background: .pink) {
                    if vm.canSave {
                        vm.save()
                        showNewItemPresented = false
                    } else {
                        vm.showAlert = true
                    }
                   
                }
            }
        }.alert(isPresented: $vm.showAlert) {
            Alert(title: Text("Error"), message: Text("Please fill in all fields and due date that is today or newer"))
                  
        }
    }
}

struct MyNewItemPreview: View {
    @State var isPresenting = true
    var body: some View {
        NewItemView(showNewItemPresented: $isPresenting)
    }
}

#Preview {
    MyNewItemPreview()
}
