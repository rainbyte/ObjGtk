#import "ObjGtkWindow.h"

@implementation ObjGtkWindow

@synthesize widget = _widget;

- (id)initWithType:(GtkWindowType)type
{
    self = [super init];
    if (self) {
        _widget = gtk_window_new(type);
    }
    
    return self;
}

- (void)setPosition:(GtkWindowPosition)position;
{
    gtk_window_set_position(GTK_WINDOW(_widget), position);
}

- (void)setTitle:(OFString *)title
{
    gtk_window_set_title(GTK_WINDOW(_widget), [title UTF8String]);
}

- (void)setDefaultSizeOfWidth:(int)width andHeight:(int)height
{
    gtk_window_set_default_size(GTK_WINDOW(_widget), width, height);
}

// ObjGtkContainer protocol related

- (void)addWidget:(OFObject<ObjGtkWidget> *)subwidget
{
    gtk_container_add(GTK_CONTAINER(_widget), [subwidget widget]);
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