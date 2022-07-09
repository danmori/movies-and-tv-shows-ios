//
//  Bindable.swift
//  Movies and TV Shows
//
//  Created by Dan Mori on 09/07/22.
//

import Foundation

class Bindable<T> {
    var observer: ((T?) -> ())?
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    func bind(observer: @escaping (T?) -> ()) {
        self.observer = observer
    }
}
