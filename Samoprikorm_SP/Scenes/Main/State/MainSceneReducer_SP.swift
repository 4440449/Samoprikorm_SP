//
//  MainSceneReducer_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 01.06.2022.
//


struct MainSceneReducer_SP {
    
    func execute(action: MainSceneAction_SP,
                 state: MainSceneState_SP) -> MainSceneState_SP {
        switch action {
            
        case .initialLoading:
            return MainSceneState_SP() // API REQUST
            
        case .select(let card):
            var newState = state
            newState.selectedCard = card
            return newState
        }
    }
}
