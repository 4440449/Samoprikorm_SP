//
//  Store_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//

import Foundation


final class Store_SP: ObservableObject {
    
    //MARK: - Prop
    
    @Published var state: State_SP
    private let reducer: Reducer_SP
    
    
    //MARK: - Init
    
    init(initialState: State_SP?,
         reducer: Reducer_SP) {
        self.state = initialState ?? State_SP()
        self.reducer = reducer
    }
    
    
    //MARK: - Interface
    
    func dispatch(action: Action_SP) {
        state = reducer.execute(action: action, state: state)
    }
    
}
