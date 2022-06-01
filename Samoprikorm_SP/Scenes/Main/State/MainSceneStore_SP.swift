//
//  MainSceneStore_SP.swift
//  Samoprikorm_SP
//
//  Created by Maxim on 23.02.2022.
//

import Foundation


//protocol MainSceneStoreProtocol_SP: ObservableObject {
//    func dispatch(action: MainSceneAction_SP)
//}


final class MainSceneStore_SP: ObservableObject {
//                                MainSceneStoreProtocol_SP {
    
    //MARK: - Prop
    
    @Published var state: MainSceneState_SP
    private let reducer: MainSceneReducer_SP
    
    
    //MARK: - Init
    
    init(initialState: MainSceneState_SP?,
         reducer: MainSceneReducer_SP) {
        self.state = initialState ?? MainSceneState_SP()
        self.reducer = reducer
    }
    
    
    //MARK: - Interface
    
    func dispatch(action: MainSceneAction_SP) {
        state = reducer.execute(action: action, state: state)
    }
    
}
