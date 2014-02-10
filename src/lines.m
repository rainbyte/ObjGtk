#import "ObjCairo/ObjCairoContext.h"

#import "ObjGtk/ObjGtk.h"
#import "ObjGtk/ObjGtkDrawingArea.h"
#import "ObjGtk/ObjGtkWindow.h"

#include <cairo.h>
#include <gtk/gtk.h>

static ObjCairoContext *cairoContext;

static void do_drawing(cairo_t *);

struct {
    int count;
    double coordx[100];
    double coordy[100];
} glob;

static gboolean on_draw_event(GtkWidget *widget, cairo_t *cr,
    gpointer user_data)
{
    do_drawing(cr);
    
    return FALSE;
}

static void do_drawing(cairo_t *cr)
{
    [cairoContext setContext:cr];

    [cairoContext setSourceWithR:0 G:0 B:0];
    [cairoContext setLineOfWidth:0.5];
    
    for (int i = 0; i <= glob.count - 1; i++) {
        for (int j = 0; j <= glob.count - 1; j++) {
            [cairoContext moveToX:glob.coordx[i] andY:glob.coordy[i]];
            [cairoContext lineToX:glob.coordx[j] andY:glob.coordy[j]];
        }
    }
    
    glob.count = 0;
    [cairoContext stroke];
}

static gboolean clicked(GtkWidget *widget, GdkEventButton *event,
    gpointer user_data)
{
    if (event->button == 1) {
        glob.coordx[glob.count] = event->x;
        glob.coordy[glob.count] = event->y;
        glob.count++;
    }
    
    if (event->button == 3) {
        gtk_widget_queue_draw(widget);
    }
    
    return TRUE;
}

int main(int argc, char *argv[]) 
{
    @autoreleasepool {

        cairoContext = [[ObjCairoContext alloc] init];

//    GtkWidget *window;
        ObjGtkWindow *window = nil;
//    GtkWidget *darea;
        ObjGtkDrawingArea *drawingArea = nil;
    
        glob.count = 0;
    
//    gtk_init(&argc, &argv);
        [ObjGtk initWithArgc:argc andArgv:argv];

//    window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
        window = [[ObjGtkWindow alloc] initWithType:GTK_WINDOW_TOPLEVEL];
    
//    darea = gtk_drawing_area_new();
        drawingArea = [[ObjGtkDrawingArea alloc] init];
//    gtk_container_add(GTK_CONTAINER(window), darea);
        [window addWidget:drawingArea];
    
//    gtk_widget_add_events(window, GDK_BUTTON_PRESS_MASK);
        [window addEvents:GDK_BUTTON_PRESS_MASK];

//    g_signal_connect(G_OBJECT(darea), "draw",
//        G_CALLBACK(on_draw_event), NULL);
        g_signal_connect(G_OBJECT([drawingArea widget]), "draw",
            G_CALLBACK(on_draw_event), NULL);

//    g_signal_connect(window, "destroy",
//        G_CALLBACK(gtk_main_quit), NULL);
        g_signal_connect([window widget], "destroy",
            G_CALLBACK(gtk_main_quit), NULL);

//    g_signal_connect(window, "button-press-event",
//        G_CALLBACK(clicked), NULL);
        g_signal_connect([window widget], "button-press-event",
            G_CALLBACK(clicked), NULL);

//    gtk_window_set_position(GTK_WINDOW(window), GTK_WIN_POS_CENTER);
        [window setPosition:GTK_WIN_POS_CENTER];
//    gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);
        [window setDefaultSizeOfWidth:400 andHeight:300];
//    gtk_window_set_title(GTK_WINDOW(window), "Lines");
        [window setTitle:@"Lines"];

//    gtk_widget_show_all(window);
        [window showAll];

//    gtk_main();
        [ObjGtk main];

    }

    return 0;
}
