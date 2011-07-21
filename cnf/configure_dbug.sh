#!/bin/sh

# Handle -DEBUGGING
mstart "Checking whether to enable -g"
case "$DEBUGGING" in
	-g|both|define)
   		case "$optimize" in
			*-g*)
				result "already enabled" ;;
			*)
				setvar optimize "$optimize -g"
				result "yes" ;;
   		esac ;;
	none|undef)
		case "$optimize" in
			*-g*) setvar optimize "`echo $optimize | sed -e 's/-g ?//'`" ;;
   		esac ;;
esac

mstart "Checking whether to use -DDEBUGGING"
case "$DEBUGGING" in
	both|define)
		setvar dflt '-DDEBUGGING'
		result "yes" ;;
	*)
		setvar dflt ''
		result "no" ;;
esac
