//
//  TimerClient.swift
//  spot-find
//
//  Created by Yuya Morimoto on R 5/04/30.
//

import Dependencies

public struct TimeClient {
    public var delay: (Int) async throws -> Bool

    public init(
        delay: @escaping (Int) async throws -> Bool
    ) {
        self.delay = delay
    }
}

public extension TimeClient {
    static let live: Self = TimeClient(
        delay: { millisecond in
            try await Task.sleep(nanoseconds: UInt64(millisecond * 1000 * 1000))
            return true
        }
    )
}

public extension TimeClient {
    static var failing = Self(
        delay: XCTUnimplemented("\(Self.self).delay")
    )
}

private enum TimeClientKey: DependencyKey {
    public static let liveValue = TimeClient.live
    public static let testValue = TimeClient.failing
}

public extension DependencyValues {
    var timeClient: TimeClient {
        get { self[TimeClientKey.self] }
        set { self[TimeClientKey.self] = newValue }
    }
}
