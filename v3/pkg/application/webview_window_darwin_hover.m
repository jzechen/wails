#import "webview_window_darwin_hover.h"
#import "../events/events_darwin.h"

@implementation HoverView

- (void)updateTrackingAreas {
    [super updateTrackingAreas];

    NSTrackingAreaOptions options = NSTrackingMouseEnteredAndExited | NSTrackingMouseMoved | NSTrackingActiveAlways | NSTrackingInVisibleRect;
    NSTrackingArea *trackingArea = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                                options:options
                                                                  owner:self
                                                               userInfo:nil];
    [self addTrackingArea:trackingArea];
}

- (void)mouseEntered:(NSEvent *)event {
    NSLog(@"Mouse entered view");
}

- (void)mouseExited:(NSEvent *)event {
    NSLog(@"Mouse exited view");
}

- (void)mouseMoved:(NSEvent *)event {
    NSLog(@"Mouse moved: %@", NSStringFromPoint(event.locationInWindow));
}

@end

@implementation HoverWebView

- (void)updateTrackingAreas {
    [super updateTrackingAreas];
    // 全局、可见区内、失去 key window 也能响应
    NSTrackingAreaOptions opts = NSTrackingMouseEnteredAndExited
                              | NSTrackingMouseMoved
                              | NSTrackingActiveAlways
                              | NSTrackingInVisibleRect;
    // 把老的都移除，避免重复
    for (NSTrackingArea *ta in [self trackingAreas]) {
        [self removeTrackingArea:ta];
    }
    NSTrackingArea *ta = [[NSTrackingArea alloc] initWithRect:self.bounds
                                                      options:opts
                                                        owner:self
                                                     userInfo:nil];
    [self addTrackingArea:ta];
}

- (void)mouseEntered:(NSEvent *)event {
    NSLog(@"🐭 HoverWebView: mouseEntered %@, id: %u", NSStringFromPoint(event.locationInWindow), self.windowId);
    [super mouseEntered:event];
}

- (void)mouseExited:(NSEvent *)event {
    NSLog(@"🐭 HoverWebView: mouseExited %@, id: %u", NSStringFromPoint(event.locationInWindow), self.windowId);
    [super mouseExited:event];
}

// - (void)mouseMoved:(NSEvent *)event {
//     NSLog(@"🐭 HoverWebView: mouseMoved %@, id: %u", NSStringFromPoint(event.locationInWindow), self.windowId);
//     [super mouseMoved:event];
// }


@end