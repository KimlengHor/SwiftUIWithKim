//
//  Debounce.swift
//  SwiftUIWithKim
//
//  Created by Kimleng Hor on 5/20/23.
//

/*
 Debouncing in Combine, a framework in SwiftUI, is useful for handling events that occur rapidly and preventing unnecessary processing or UI updates.

 In SwiftUI, user interactions such as button taps or text input can trigger updates to the UI or perform some actions. However, these events may occur in quick succession, leading to excessive updates or computations. Debouncing helps in managing this by introducing a delay between consecutive events.

 The debounce operator in Combine allows you to specify a time interval. When an event occurs, the operator waits for the specified interval before forwarding the event downstream. If another event occurs during this interval, the timer is reset, and the process repeats. Only when the interval elapses without any new events, the operator passes the last received event downstream.

 By applying debounce to user interactions, you can control the frequency of UI updates or expensive operations. This can be particularly useful in scenarios such as search-as-you-type functionality, where you want to avoid firing multiple network requests for every keystroke, or in handling fast-paced interactions that might overload the UI with unnecessary updates.

 Debouncing helps optimize performance, reduce unnecessary processing, and improve the overall user experience by ensuring that only relevant or significant events are acted upon.
 */

import SwiftUI
import Combine

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
}

struct SearchView: View {
    
    @StateObject var vm = SearchViewModel()
    
    @State var colors = ["Red", "Blue", "Yellow", "Pink", "White", "Black", "Green", "Brown", "Gray"]
    
    @State var filteredColor = [String]()
    
    /*
     In my example, using debounce with a delay of 4 seconds for search text in a TextField can be helpful in scenarios where you want to avoid excessive API calls and UI updates due to rapid typing by the user. However, a delay of 4 seconds might feel sluggish to the user in most cases.

     In a production environment, it's generally recommended to use a shorter debounce interval, such as 0.5 seconds, to strike a balance between responsiveness and reducing unnecessary API calls. This means that when the user types, there will be a 0.5-second delay before initiating the API call, allowing the user to input more characters before triggering the request. This delay can prevent excessive requests for every single keystroke and provide a smoother experience while still ensuring timely updates to the UI.
     */

    var body: some View {
        NavigationView {
            VStack {
                SearchBarView(searchText: $vm.searchText)
                    .onReceive(
                        vm.$searchText
                            .debounce(for: .seconds(4), scheduler: DispatchQueue.main)
                    ) {
                        guard !$0.isEmpty else { return }
                        searchColors()
                        print("Searhcing fpr \(vm.searchText)")
                    }
                    
                List {
                    ForEach(filteredColor, id: \.self) { color in
                        Text(color)
                            .font(.headline)
                    }
                }
            }
            .navigationTitle("Colors")
        }
    }
    
    private func searchColors() {
        if vm.searchText.isEmpty {
            filteredColor = colors
        } else {
            filteredColor = colors.filter { $0.lowercased().contains(vm.searchText.lowercased()) }
        }
    }
}

struct Debounce_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
