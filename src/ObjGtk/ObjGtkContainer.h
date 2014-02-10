#import <ObjFW/ObjFW.h>

#import "ObjGtkWidget.h"

@protocol ObjGtkContainer

- (void)addWidget:(OFObject<ObjGtkWidget> *)subwidget;

@end
