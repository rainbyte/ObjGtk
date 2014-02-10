#import "ObjGtkDrawingArea.h"

@implementation ObjGtkDrawingArea

@synthesize widget = _widget;

- (id)init
{
    self = [super init];
    if (self) {
        _widget = gtk_drawing_area_new();
    }
    
    return self;
}

// ObjGtkWidget protocol related

- (void)addEvents:(gint)eventsMask
{
    gtk_widget_add_events(_widget, eventsMask);
}

- (void)show
{
    gtk_widget_show(_widget);
}

- (void)showAll
{
    gtk_widget_show_all(_widget);
}

@end