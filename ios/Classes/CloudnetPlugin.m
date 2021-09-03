#import "CloudnetPlugin.h"
#if __has_include(<cloudnet/cloudnet-Swift.h>)
#import <cloudnet/cloudnet-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "cloudnet-Swift.h"
#endif

@implementation CloudnetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCloudnetPlugin registerWithRegistrar:registrar];
}
@end
