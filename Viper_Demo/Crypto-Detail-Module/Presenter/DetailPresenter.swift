//
//  DetailPresenter.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import Foundation

protocol DetailPresenterProtocol{
    var router: DetailRouterProtocol? {get set}
    var interactor: DetailInteractorProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var crypto: CryptoModel! {get set}
    
    func sendCryptoToView(result: Result<CryptoModel, Error>)
}

class DetailPresenter: DetailPresenterProtocol{
  
    var router: DetailRouterProtocol?
    var interactor: DetailInteractorProtocol?
    var view: DetailViewProtocol?
    
    var crypto: CryptoModel!{
        didSet{
            interactor?.sendCryptoToPresenter(withCrypto: crypto)
        }
    }
    
    func sendCryptoToView(result: Result<CryptoModel, Error>) {
        
        switch result{
        case .success(let crypto):
            view?.showCryptoDetail(withCrypto: crypto)
        case .failure(let error):
            view?.showCryptoError(withError: error)
        }
        
    }
    
    
    
    
}


