//
//  Reducer_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//


struct Reducer_SP {
    
    func execute(action: Action_SP, state: State_SP) -> State_SP {
        switch action {
            
        case .initialLoading:
            return State_SP() // API REQUST
            
        case .select(let card):
            var newState = state
            newState.selectedCard = card
            return newState
        }
    }
}
