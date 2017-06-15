# OpenSky API Demo

This is an example to use the API.

# OpenSky API?

> The API lets you retrieve live airspace information for research and non-commerical purposes.

- [The OpenSky Network](https://opensky-network.org/)
- [The OpenSky Network API documentation — The OpenSky Network API 1.0.0 documentation](https://opensky-network.org/apidoc/)

# Usage

```swift
let req = OpenSkyRequest()
req.fetch() {data, res, err in
	if err != nil {
		print("ERR \(err!)")
			return
	}

	for s in data! {
		if let long = s.longitude, let lat = s.latitude {
			print("\(s.originCountry) [\(long),\(lat)]")
		}
		else {
			print("\(s.originCountry) (Unknown place)")
		}
	}
}
```

# References

## `class OpenSkyRequest`

### `func fetch(completionHandler: @escaping ([OpenSkyState]?, URLResponse?, Error?) -> Void)`

Fetches data and calls back.

## `class OpenSkyState`

### Properties

```swift
let icao24: String
let callsign: String?
let originCountry: String
let timePosition: Double?
let timeVelocity: Double?
let longitude: Double?
let latitude: Double?
let altitude: Double?
let onGround: Bool
let velocity: Double?
let heading: Double?
let verticalRate: Double?
```

Check [official document](https://opensky-network.org/apidoc/rest.html).

# Who made this example

Made by a student studying Swift and iOS. ¯\\\_(ツ)\_/¯
