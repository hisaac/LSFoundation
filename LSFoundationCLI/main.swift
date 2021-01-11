// A place to experiment with the `LSFoundation` extensions
// (and unlike Playgrounds, you can use the debugger here in the CLI)

import Foundation

let now = Date.now
let dayBefore = now.dayBefore!
let dayAfter = now.dayAfter!

let dateFormatter = ISO8601DateFormatter()
dateFormatter.timeZone = TimeZone(abbreviation: "CST")

print(dateFormatter.string(from: now))
print(dateFormatter.string(from: dayBefore))
print(dateFormatter.string(from: dayAfter))

let referenceDate = Date(timeIntervalSinceReferenceDate: 0)
let referenceDatePlus60 = Date(timeIntervalSinceReferenceDate: 609993)

let secondsBefore = referenceDate.isHowMany(ofComponent: .second, before: referenceDatePlus60)
let secondsAfter = referenceDatePlus60.isHowMany(ofComponent: .second, after: referenceDate)
print(secondsBefore)
print(secondsAfter)
