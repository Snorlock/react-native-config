import Foundation

@objc(RNConfig)
public class RNConfig: NSObject {
    
    @objc(read:)
    func read(env: String) -> Any {
        print("Reading value")
        if let value = readFile()?[env] {
            return value
        }
        print("Environment variable [\(env)] was not found. Returning empty string")
        return ""
    }
    
    @objc(readFile)
    func readFile() -> [String: Any]? {
        print("Reading file")
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
}