#import <ObjFW/ObjFW.h>

#include <gtk/gtk.h>

@protocol ObjGtkWidget

@property GtkWidget *widget;

- (void)addEvents:(gint)eventsMask;
- (void)show;
- (void)showAll;

@end
