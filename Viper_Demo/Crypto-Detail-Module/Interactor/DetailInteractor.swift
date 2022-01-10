//
//  DetailInteractor.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 10.01.2022.
//

import Foundation

protocol DetailInteractorProtocol{
    var presenter: DetailPresenterProtocol? {get set}
    func sendCryptoToPresenter(withCrypto crypto: CryptoModel)
}

class DetailInteractor: DetailInteractorProtocol{
    
    var presenter: DetailPresenterProtocol?
    
    func sendCryptoToPresenter(withCrypto crypto: CryptoModel){
        print("CRYPTO: \(crypto)")
        guard crypto != nil else{
            presenter?.sendCryptoToView(result: .failure(DetailErrors.CryptoIsNilError))
            return
        }
        presenter?.sendCryptoToView(result: .success(crypto))
   
    }
    
    
}
