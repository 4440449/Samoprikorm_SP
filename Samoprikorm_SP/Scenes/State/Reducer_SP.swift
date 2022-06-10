//
//  Reducer_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//


struct Reducer_SP {
    
    func execute(action: Action_SP, state: State_SP) -> State_SP {
        var newState = state
        switch action {
            
        case .initialLoading(let params):
            newState.cards = params.cards
            
        case .search(let params):
            newState.searchFieldText = params.text
            
        case .select(let params):
            newState.selectedCard = params.card
            
        case .showError(let params):
            newState.errorMessage = params.description
            
        case .isLoading(let params):
            newState.isLoading = params.status
        }
        return newState
    }
    
}
