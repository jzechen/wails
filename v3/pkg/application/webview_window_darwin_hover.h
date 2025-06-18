#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface HoverView : NSView
@end

@interface HoverWebView : WKWebView
@property(assign) unsigned int windowId;
@end