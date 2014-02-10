lines:
	objfw-compile -DOG_GTK -Wall -g -o lines -I`pkg-config --cflags --libs gtk+-3.0` lines.m ObjCairo/ObjCairoContext.m ObjGtk/ObjGtk.m ObjGtk/ObjGtkWindow.m ObjGtk/ObjGtkDrawingArea.m
clean:
	-rm ObjCairo/*.o
	-rm ObjGtk/*.o
	-rm *.o
	-rm lines

.PHONY: clean
