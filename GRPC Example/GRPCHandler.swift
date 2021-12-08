//
//  GRPCHandler.swift
//  GRPC Example
//
//  Created by Mert Gürcan on 27.11.2021.
//

import Foundation
import GRPC
import NIO
import NIOSSL
import SwiftProtobuf

class GRPCHandler {

    var client : EventServiceClient
    let configuration = ClientConnection.Configuration(target: .hostAndPort("127.0.0.1", 50051), eventLoopGroup: MultiThreadedEventLoopGroup(numberOfThreads: 1))

    init(){
        client =  EventServiceClient(channel: ClientConnection(configuration: configuration))
    }

    func getEvent() -> [Event]? {
        do {
            let request = Empty()
            let response = try client.showEvents(request).response.wait().events
            return response
        } catch {
            print("ERROR\n\(error)")
        }
        return nil
    }
}
