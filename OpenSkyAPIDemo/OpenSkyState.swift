//
//  OpenSkyState.swift
//  OpenSkyAPIDemo
//
//  Created by Ginpei on 2017-06-07.
//  Copyright © 2017 Ginpei. All rights reserved.
//

import Foundation

class OpenSkyState {
    static func from(array row: [Any]) -> OpenSkyState? {
        if
            let icao24 = row[0] as? String,
            let callsign = row[1] as? String,
            let originCountry = row[2] as? String,
            let timePosition = row[3] as? Double,
            let timeVelocity = row[4] as? Double,
            let longitude = row[5] as? Double,
            let latitude = row[6] as? Double,
            let altitude = row[7] as? Double,
            let on_ground = row[8] as? Bool,
            let velocity = row[9] as? Double,
            let heading = row[10] as? Double,
            let verticalRate = row[11] as? Double
        {
            return OpenSkyState(
                icao24: icao24,
                callsign: callsign,
                originCountry: originCountry,
                timePosition: timePosition,
                timeVelocity: timeVelocity,
                longitude: longitude,
                latitude: latitude,
                altitude: altitude,
                on_ground: on_ground,
                velocity: velocity,
                heading: heading,
                verticalRate: verticalRate
            )
        }
        else {
            return nil
        }
    }
    
    let icao24: String
    let callsign: String
    let originCountry: String
    let timePosition: Double
    let timeVelocity: Double
    let longitude: Double
    let latitude: Double
    let altitude: Double
    let on_ground: Bool
    let velocity: Double
    let heading: Double
    let verticalRate: Double

    init(icao24: String, callsign: String, originCountry: String, timePosition: Double, timeVelocity: Double, longitude: Double, latitude: Double, altitude: Double, on_ground: Bool, velocity: Double, heading: Double, verticalRate: Double) {
        self.icao24 = icao24
        self.callsign = callsign
        self.originCountry = originCountry
        self.timePosition = timePosition
        self.timeVelocity = timeVelocity
        self.longitude = longitude
        self.latitude = latitude
        self.altitude = altitude
        self.on_ground = on_ground
        self.velocity = velocity
        self.heading = heading
        self.verticalRate = verticalRate
    }
}
