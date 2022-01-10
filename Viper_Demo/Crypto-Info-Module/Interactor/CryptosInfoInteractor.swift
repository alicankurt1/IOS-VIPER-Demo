//
//  CryptosInfoInteractor.swift
//  Viper_Demo
//
//  Created by Alican Kurt on 8.01.2022.
//

import Foundation


// Talks to -> Presenter
// Class, Protocol

protocol CryptoInteractorProtocol{
    var presenter: CryptoPresenterProtocol? {get set}
    
    func downloadCryptoJSON()
}

class CryptoInfoInteractor: CryptoInteractorProtocol{
    
    var presenter: CryptoPresenterProtocol?
    
    func downloadCryptoJSON() {
        
        // Download JSON File
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/IA32-CryptoComposeData/main/cryptolist.json") else{
            self.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.JsonNetworkFailed))
            return
        }
        
        let cryptoTask = URLSession.shared.dataTask(with: url) { [weak self] data , response , error in
            
            guard error == nil, let data = data else{
                return
            }
            do{
                let cryptosArray = try JSONDecoder().decode([CryptoModel].self, from: data)
                self?.presenter?.interactorDidDownloadCrypto(result: .success(cryptosArray))
            }catch{
                self?.presenter?.interactorDidDownloadCrypto(result: .failure(NetworkError.JsonParsingFailed))
            }
            
        }
        
        cryptoTask.resume()
        
        
    }
    
    
}
