#import <ObjFW/ObjFW.h>

#include <cairo.h>

@interface ObjCairoContext : OFObject

@property cairo_t *context;

- (id)initWithContext:(cairo_t *)context;
- (void)setSourceWithR:(double)r G:(double)g B:(double)b;
- (void)setLineOfWidth:(double)width;
- (void)moveToX:(int)x andY:(int)y;
- (void)lineToX:(int)x andY:(int)y;
- (void)stroke;

@end
