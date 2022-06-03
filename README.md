
<img src="Documentation/Assets/URLRequestChainIcon.jpeg" alt="icon" width="200" height="200"/>

# URLRequestChain

Create your URL requests with ease in a simple function chaining manner.

Its as easy as -
``` 
someURL
    .request()
```

Many properties of `URLRequest` have been wrapped in functions to allow for chaining.  A few examples include -

```
someURL
    .request()
    .setMethod(.GET)
    .setBody(nil)
    .setTimeout(10)
```

Manipulating a `URL` is easy too!

```
someURL
    .addPaths("path1", "path2")
    .addQueryParameters(
        URLQueryItem(
            name: "id",
            value: "..."))
```

Should you have a need to define commonly used paths, you can also use the `URLPath` protocol and define a path enum -

```
private enum CommonPaths: URLPath {
    case pathOne
    case pathTwo
    
    var path: String {
        switch self {
        case .pathOne: return "pathOne"
        case .pathTwo: return "pathTwo"
        }
    }
}

someURL
    .addPaths(CommonPaths.pathOne, CommonPaths.pathTwo)
```

### Inspiration
- SwiftUI declarative chaining syntax
- [Formatted API](https://developer.apple.com/documentation/foundation/formatstyle) (iOS 15+) especially `dateTime`
