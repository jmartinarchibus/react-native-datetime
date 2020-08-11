#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Datetime, NSObject)

RCT_EXTERN_METHOD(multiply:(float)a withB:(float)b
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject)

RCT_EXTERN_METHOD(utcToLocal:(NSString)utcString
                  withTimeZoneName: (NSString)timeZoneName
                  withResolver:(RCTPromiseResolveBlock)resolve
                  withRejecter:(RCTPromiseRejectBlock)reject )

@end
