@objc(Datetime)
class Datetime: NSObject {

    @objc(multiply:withB:withResolver:withRejecter:)
    func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        resolve(a*b)
    }
    
    @objc(utcToLocal:withTimeZoneName:withResolver:withRejecter:)
    func utcToLocal(utcString: String, timeZoneName: String, resolve:RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        
        let timeZone = NSTimeZone(name: timeZoneName)
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";
        newFormatter.timeZone = timeZone as TimeZone?
        
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
        if let date = formatter.date(from: utcString) {
            // let adjustedDate = Date(timeInterval:36000, since: date)
            // print(adjustedDate.description)
            let adjustedDate = newFormatter.string(from: date)
            resolve(adjustedDate);
        } else {
            print("no work")
        }
        
        
    }
    
    @objc(localOffset:withResolver:withRejecter:)
    func localOffset(timeZoneName: String, resolve:RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        
        let timeZone = NSTimeZone(name: timeZoneName)
        
        resolve(timeZone?.secondsFromGMT)
        
    }
    
    
}
