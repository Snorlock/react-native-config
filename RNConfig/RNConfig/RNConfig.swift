class ReactNativeConfig {

    RCT_EXPORT_MODULE()
    
    func env() -> NSDictionary {
        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            return NSDictionary(contentsOfFile: path) ?? NSDictionary()
        }
        return NSDictionary()
    }
    
    func envForKey(key: String) -> String {
        return env().object(forKey: key) as? String ?? ""
    }
}
