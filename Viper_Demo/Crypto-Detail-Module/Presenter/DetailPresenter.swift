//
//  DetailPresenter.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import Foundation

protocol DetailPresenterProtocol{
    var router: DetailRouterProtocol? {get set}
    var view: DetailViewProtocol? {get set}
    var crypto: CryptoModel! {get set}
    
    func sendCryptoToView()
}

class DetailPresenter: DetailPresenterProtocol{
  
    var router: DetailRouterProtocol?
    var view: DetailViewProtocol?
    
    var crypto: CryptoModel!
    
    func sendCryptoToView() {
            view?.showCryptoDetail(withCrypto: crypto)
    }
    
    
    
    
}


