//
//  CryptosInfoPresenter.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 8.01.2022.
//

import Foundation
import UIKit

// Talks to -> View, Router, Interactor
// Class, Protocol

protocol CryptoPresenterProtocol{
    var router: CryptoRouterProtocol? {get set}
    var interactor: CryptoInteractorProtocol? {get set}
    var view: CryptoViewProtocol? {get set}
    
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>)
    func showCryptoDetailVC(withCrypto crypto: CryptoModel)
}

class CryptoInfoPresenter: CryptoPresenterProtocol{
    
    var router: CryptoRouterProtocol?
    var interactor: CryptoInteractorProtocol? {
        didSet {
            interactor?.downloadCryptoJSON()
        }
    }
    var view: CryptoViewProtocol?
    
  
    
    func interactorDidDownloadCrypto(result: Result<[CryptoModel], Error>) {
        switch result{
        case .success(let cryptoModelArray):
            print("CRYPTOS Downloaded Successfully..")
            view?.update(with: cryptoModelArray)
        case .failure(let error):
            print("Error: \(error)")
            view?.update(with: error)
        }
    }
    
    func showCryptoDetailVC(withCrypto crypto: CryptoModel) {
        router?.pushToCryptoDetailModule(withCrypto: crypto)
    }
    
    
}
