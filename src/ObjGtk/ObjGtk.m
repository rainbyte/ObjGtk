#import "ObjGtk.h"

@implementation ObjGtk

+ (void)initWithArgc:(int)argc andArgv:(char *[])argv
{
    gtk_init(&argc, &argv);
}

+ (void)main
{
    gtk_main();
}

@end
