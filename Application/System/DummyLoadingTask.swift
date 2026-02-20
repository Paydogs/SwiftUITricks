//
//  DummyLoadingTask.swift
//  SwiftUITricks
//
//  Created by Andras Olah on 2026. 02. 20..
//

class DummyLoadingTask {
    static func load(for seconds: Int) async throws {
        print("Loading started")
        try await Task.sleep(for: .seconds(seconds))
        print("Loading finished")
        return
    }
}
