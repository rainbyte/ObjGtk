# -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([ObjGtk], [0.1], [alvarofernandogarcia@gmail.com])
AM_INIT_AUTOMAKE
AC_CONFIG_SRCDIR([src/lines.m])

AC_CHECK_TOOL(OBJFW_CONFIG, objfw-config)
AS_IF([test x"$OBJFW_CONFIG" = x""], [
        AC_MSG_ERROR(You need ObjFW and objfw-config installed!)
])

AC_LANG([Objective C])
AC_PROG_OBJC([clang])
AC_PROG_OBJCPP
AC_PROG_LN_S
AC_PROG_INSTALL
AC_PROG_RANLIB

CPP="$OBJCPP"
CPPFLAGS="$CPPFLAGS $OBJCPPFLAGS $($OBJFW_CONFIG --cppflags)"
OBJCFLAGS="$OBJCFLAGS -Wall $($OBJFW_CONFIG --objcflags)"
LDFLAGS="$LDFLAGS $($OBJFW_CONFIG --ldflags)"
LIBS="$LIBS $($OBJFW_CONFIG --libs)"

OBJCFLAGS="$OBJCFLAGS $($OBJFW_CONFIG --arc)"
AC_MSG_CHECKING([whether Objective C compiler supports ARC])
AC_TRY_COMPILE([
        #if !__has_feature(objc_arc)
        # error No ARC
        #endif
        @interface Test
        @end
], [
        __unsafe_unretained Test *t;
], [
        AC_MSG_RESULT(yes)
], [
        AC_MSG_RESULT(no)
        AC_MSG_ERROR(You need an Objective C compiler with ARC support!)
])

PKG_CHECK_MODULES(gtk3, [gtk+-3.0], [
        CPPFLAGS="$CPPFLAGS $gtk3_CFLAGS"
        LIBS="$LIBS $gtk3_LIBS"
], [
        AC_MSG_ERROR(You need gtk-3.0 installed!)
])

PKG_CHECK_MODULES(cairo, [cairo], [
        CPPFLAGS="$CPPFLAGS $cairo_CFLAGS"
        LIBS="$LIBS $cairo_LIBS"
], [
        AC_MSG_ERROR(You need cairo installed!)
])

OBJCFLAGS="$OBJCFLAGS -Werror"

AC_SUBST(CPP)
AC_SUBST(CPPFLAGS)

AC_CONFIG_FILES([Makefile
                 src/ObjCairo/Makefile
                 src/ObjGtk/Makefile
                 src/Makefile])
AC_OUTPUT

echo \
"------------------------------------------------

 ${PACKAGE_NAME} Version ${PACKAGE_VERSION}

 Prefix: '${prefix}'.
 Compiler: '${OBJC} ${OBJCFLAGS} ${CPPFLAGS}'

 Now type 'make @<:@<target>@:>@'
   where the optional <target> is:
     all                - build all binaries
     install            - install everything

------------------------------------------------"
