#import <ObjFW/ObjFW.h>

#import "ObjGtkWidget.h"
#import "ObjGtkContainer.h"

#include <gtk/gtk.h>

@interface ObjGtkWindow : OFObject<ObjGtkWidget, ObjGtkContainer>

- (id)initWithType:(GtkWindowType)type;
- (void)setPosition:(GtkWindowPosition)position;
- (void)setTitle:(OFString *)title;
- (void)setDefaultSizeOfWidth:(int)width andHeight:(int)height;

@end