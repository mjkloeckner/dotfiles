/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 16;       /* snap pixel */
static const unsigned int gappih    = 3;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 3;       /* vert inner gap between windows */
static const unsigned int gappoh    = 6;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 8;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 1;        /* 1 means no outer gap when there is only one window */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;   	/* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 0;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 0;        /* 0 means bottom bar */
static const char *fonts[]          = { "Source Code Pro:style=Regular:size=8", "JoyPixels:style=Regular:size=7:antialias=true:autohint=true", "DejaVu Sans"  };
static const char dmenufont[]       = "DejaVuSansMono Nerd Font:style=Regular:size=8";
static const char col_gray1[]       = "#000000";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#cccccc";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char col_blue[]        = "#0055ff";
static const char col_red[]        = "#ff1100";
static const char col_orange[]        = "#ff1100";
static const char col_violet[]        = "#EE82EE";
static const char col_darkmagenta[]        = "#8B008B";
/* static const unsigned int baralpha = 0xd0; */
/* static const unsigned int borderalpha = OPAQUE; */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_darkmagenta,  col_darkmagenta  },
	[SchemeTitle]  = { col_gray4, col_gray1,  col_cyan  },
};

/* static const unsigned int alphas[][3]      = { */
/* 	/1*               fg      bg        border     *1/ */
/* 	[SchemeNorm] = { OPAQUE, baralpha, borderalpha }, */
/* 	[SchemeSel]  = { OPAQUE, baralpha, borderalpha }, */
/* }; */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class		instance	title       tags mask   isfloating	monitor	float x,y,w,h	floatborderpx*/
	{ "Gimp",		NULL,       NULL,		0,			0,          -1 },
	{ "Firefox",	NULL,       NULL,		1 << 8,     0,          -1 },
	{ "calculator", NULL,		NULL,		0,			1,          -1,		80,50,400,300,		1 },
	{ "floating",	NULL,		NULL,		0,			1,          -1,		80,50,800,600,		0 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	//{ "[#]",      gaplessgrid },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	//{ "---",      horizgrid },
	//{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask		/* MODKEY to SuperKey */
#define MOD2KEY Mod1Mask	/* MOD2KEY to altkey	*/

#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run_history", "-h", "16", "-b", "-m", dmenumon, "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_darkmagenta, "-sf", col_gray4, NULL };
/*	static const char *termcmd[]  = { "alacritty", "-o", "cursor.style.blinking=Always", NULL };	*/
static const char *termcmd[]  = { "kitty", NULL };
static const char *ftermcmd[]  = { "kitty", "--class", "floating", NULL };
static const char *webcmd[]  = { "firefox", NULL };
static const char *filescmd[]  = { "alacritty", "-e", "ranger", NULL };
static const char *gfilescmd[]  = { "pcmanfm-qt", "-n", NULL };
static const char *bookscmd[] = { "openbook", "-nb", col_gray1, "-nf", col_gray3, "-sb", col_darkmagenta, "-sf", col_gray4, NULL };
static const char *spotifycmd[]  = { "spotify", NULL };
static const char *virtualboxcmd[]  = { "virtualbox", NULL };
static const char *calccmd[]  = { "gnome-calculator", NULL };
static const char *lutriscmd[]  = { "lutris", NULL };
static const char *switchkblayout[]  = { "switchkblayout", NULL };


/* commands spawned when clicking statusbar, the mouse button pressed is exported as BUTTON */
static char *statuscmds[] = { "notify-send -r Mouse$BUTTON" };
static char *statuscmd[] = { "/bin/sh", "-c", NULL, NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,		                XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,	            XK_Return, spawn,          {.v = ftermcmd } },
	{ MODKEY,		                XK_w,	   spawn,          {.v = webcmd } },
	{ MODKEY,		                XK_e,	   spawn,          {.v = gfilescmd } },
	{ MODKEY,		                XK_z,	   spawn,          {.v = lutriscmd } },
	{ MODKEY|ShiftMask,		        XK_e,	   spawn,          {.v = filescmd } },
	{ MODKEY,		                XK_v,	   spawn,          {.v = virtualboxcmd } },
	{ MODKEY,		                XK_b,	   spawn,          {.v = bookscmd } },
	{ MODKEY,		                XK_s,	   spawn,          {.v = spotifycmd } },
	{ MODKEY,		                XK_c,	   spawn,          {.v = calccmd } },
	{ MODKEY|MOD2KEY,		        XK_l,	   spawn,          {.v = switchkblayout } },
	{ MODKEY|ShiftMask,             XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_p,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,		                XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY|ShiftMask,             XK_j,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,			            XK_q,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,             XK_t,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,             XK_m,      setlayout,      {.v = &layouts[9]} },
	{ MODKEY,                       XK_y,      setlayout,      {.v = &layouts[3]} },
	{ MODKEY|ShiftMask,             XK_y,      setlayout,      {.v = &layouts[4]} },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[5]} },
	{ MODKEY|ShiftMask,             XK_u,      setlayout,      {.v = &layouts[6]} },
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[7]} },
	{ MODKEY|ShiftMask,             XK_g,      setlayout,      {.v = &layouts[8]} },
	{ MODKEY,                       XK_i,      setlayout,      {.v = &layouts[10]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[11]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	/*{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },*/
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,				XK_equal,  incrgaps,       {.i = +1 } },
	{ MODKEY,					    XK_minus,  incrgaps,       {.i = -1 } },
	{ MODKEY|MOD2KEY,				XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,	    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|MOD2KEY,				XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,		XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|MOD2KEY,               XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|MOD2KEY,               XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|MOD2KEY,               XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|MOD2KEY,               XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|MOD2KEY|ShiftMask,     XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|MOD2KEY,               XK_0,      togglegaps,     {0} },
	{ MODKEY,					    XK_equal,  defaultgaps,    {0} },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	TAGKEYS(                        XK_0,                      9)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = statuscmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkStatusText,        0,              Button1,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = statuscmd } },
	{ ClkStatusText,        0,              Button3,        spawn,          {.v = statuscmd } },
};
