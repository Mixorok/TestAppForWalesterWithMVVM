//
//  Box.swift
//  WallesterAppMVVM
//
//  Created by Максим on 09.04.2021.
//

import Foundation

class Box<T> {
    typealias Listener = (T) -> ()
    
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener){
        self.listener = listener
        listener(value)
    }
    
    init (_ value: T){
        self.value = value
    }
}
