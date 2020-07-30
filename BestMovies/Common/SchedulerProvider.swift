//
//  SchedulerProvider.swift
//  BestMovies
//
//  Created by Javier Quiles on 30/07/2020.
//  Copyright © 2020 Javier Quiles. All rights reserved.
//

import RxSwift

protocol SchedulerProviderProtocol {
    func io() -> SchedulerType
    func ui() -> SchedulerType
}

class SchedulerProvider: SchedulerProviderProtocol {
    func io() -> SchedulerType {
        return SerialDispatchQueueScheduler(qos: .default)
    }

    func ui() -> SchedulerType {
        return MainScheduler.instance
    }
}
