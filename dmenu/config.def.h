/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"monospace:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char col_black[]       = "#000000";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_white[]       = "#ffffff";
static const char col_l_blue[]      = "#6666ff";
static const char col_d_blue[]      = "#334be2";
static const char col_l_orange[]    = "#ff8226";
static const char col_d_orange[]    = "#df5f00";
static const char col_arch_blue[]   = "#1aa3d8";

static const char *colors[SchemeLast][2] = {
	            /*     fg         bg       */
	[SchemeNorm] = { col_white , col_arch_blue },
	[SchemeSel] =  { col_d_blue, col_arch_blue },
	[SchemeOut] =  { col_black , col_arch_blue },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;
static unsigned int lineheight = 0;         /* -h option; minimum height of a menu line     */

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
