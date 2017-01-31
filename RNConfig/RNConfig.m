#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNConfig, NSObject)

RCT_EXTERN_METHOD(read:(NSString *)env)

RCT_EXTERN_METHOD(readFile)


@end
