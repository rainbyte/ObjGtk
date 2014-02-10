#import "ObjCairoContext.h"

@implementation ObjCairoContext

- (id)initWithContext:(cairo_t *)context
{
    self = [super init];
    if (self) {
        _context = context;
    }
    
    return self;
}

- (void)setSourceWithR:(double)r G:(double)g B:(double)b
{
    cairo_set_source_rgb(_context, r, g, b);
}

- (void)setLineOfWidth:(double)width
{
    cairo_set_line_width(_context, width);
}

- (void)moveToX:(int)x andY:(int)y
{
    cairo_move_to(_context, x, y);
}

- (void)lineToX:(int)x andY:(int)y
{
    cairo_line_to(_context, x, y);
}

- (void)stroke
{
    cairo_stroke(_context);
}

@end
