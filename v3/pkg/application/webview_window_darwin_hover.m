#import "webview_window_darwin_hover.h"

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