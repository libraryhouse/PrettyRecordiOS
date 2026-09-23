# PrettyRecordKit

Closed-source distribution of **PrettyRecord** — one clean JSON string for any record, a server model or a Core Data object. Ships as a precompiled XCFramework: you get the API, not the source.

## Install (Swift Package Manager)

In Xcode: **File → Add Package Dependencies…** and enter:

```
https://github.com/libraryhouse/PrettyRecordiOS.git
```

Or in `Package.swift`:

```swift
.package(url: "https://github.com/libraryhouse/PrettyRecordiOS.git", from: "1.0.5")
```

Then (the module name is `PrettyRecordKit`, even though the repo is `PrettyRecordiOS`):

```swift
import PrettyRecordKit
```

Platform: **iOS 13+** (device + simulator).

## Usage

```swift
import PrettyRecordKit

// Any Encodable (server models)
print(user.prettyJSON)

// Core Data (NSManagedObject)
print(task.prettyJSON)             // relationships as IDs
print(task.prettyJSON(.expanded(1))) // expand one level, cycle-safe

// Raw JSON Data (network responses)
print(responseData.prettyJSON)

// "I don't care what it is"
PrettyRecord.print(anyRecord)
let json = PrettyRecord.string(for: anyRecord)
```

### Options

```swift
record.prettyJSON(.compact)      // single line
record.prettyJSON(.expanded(2))  // Core Data relationships 2 levels deep

var options = PrettyRecord.Options()
options.dateEncoding = .millisecondsSince1970
options.dataEncoding = .base64
print(record.prettyJSON(options))
```

| Option | Default | Notes |
| --- | --- | --- |
| `relationshipDepth` | `0` | Core Data: `0` = IDs, `1+` = expand. Cycle-safe. |
| `sortedKeys` | `true` | Alphabetical, diff-friendly. |
| `prettyPrinted` | `true` | `false` = one line. |
| `includeEntityName` | `true` | Adds `_entity` for Core Data. |
| `dateEncoding` | `.iso8601` | `.secondsSince1970`, `.millisecondsSince1970`, `.description`. |
| `dataEncoding` | `.byteCount` | `.base64`, `.omitted`. |

> Note the import is **`PrettyRecordKit`**, while the API namespace is **`PrettyRecord`** (e.g. `PrettyRecord.Options`). This split is required so the binary framework's module name doesn't collide with the type name.
