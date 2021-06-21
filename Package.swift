// swift-tools-version:5.0

import PackageDescription

let pkg = Package(name: "PromiseKit")
pkg.platforms = [
    .macOS(.v10_10),
    .iOS(.v10),       //FIXME strictly 8.0, but Tests require 10
    .tvOS(.v10),      //FIXME strictly 9.0, but Tests require 10
    .watchOS(.v3)
]
pkg.swiftLanguageVersions = [.v5]


func dependencies(for name: String) -> [Target.Dependency] {
    switch name {
    case "PromiseKit":
        return []
    default:
        return [.target(name: "PromiseKit")]
    }
}

for name in ["PMKCloudKit", "PMKCoreLocation", "PMKFoundation", "PMKHealthKit", "PMKHomeKit", "PMKMapKit", "PMKPhotos", "PMKStoreKit", "PromiseKit"] {

  #if os(Linux) || os(Android)
    guard name == "PromiseKit" || name == "PMKFoundation" else { continue }
  #endif

    pkg.targets.append(.target(name: name, dependencies: dependencies(for: name)))
    pkg.products.append(.library(name: name, targets: [name]))

}
