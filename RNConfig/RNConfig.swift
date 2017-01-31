import Foundation

@objc(RNConfig)
public class RNConfig: NSObject {

    public func read(env: String) -> Any {
        if let value = readFile()?[env] {
            return value
        }
        print("Environment variable [\(env)] was not found. Returning empty string")
        return ""
    }

    public func readFile() -> [String: Any]? {
        let emptyEnvironment = [String: Any]()
        guard let file = Bundle.init(for: RNConfig.self).path(forResource: "config", ofType: "json") else {
            print("Environment file was not found. Sure you didn't delete it?")
            return emptyEnvironment
        }

        do {
            let jsonData = try Data(contentsOf: NSURL(fileURLWithPath: file) as URL)
            let jsonDict = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers)
            return jsonDict as? [String: Any] ?? emptyEnvironment
        } catch  {
            print("Got the following error while converting file to json: \(error). Returning empty environment")
            return emptyEnvironment
        }
    }

    @objc(constantsToExport)
    public func constantsToExport() -> [String: Any] {
        return readFile() ?? [String:Any]();
    }
}
