//
//  Store_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//

import Foundation


final class Store_SP: ObservableObject {
    
    //MARK: - Prop
    
    @Published private (set) var state: State_SP
    private let reducer: Reducer_SP
    
    
    //MARK: - Init
    
    init(initialState: State_SP?,
         reducer: Reducer_SP) {
        self.state = initialState ?? State_SP()
        self.reducer = reducer
        print("INIT Store_SP")
    }
    
    
    //MARK: - Interface
    
    func dispatch(action: Action_SP) {
        state = reducer.execute(action: action, state: state)
    }
    
    
    deinit {
        print("DEINIT Store_SP")
    }
}
