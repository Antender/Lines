-- SDL_Wrap.ew
-- Euphoria header file for SDL
-- Written by Mark K. Akita     4/29/02

--without type_check
--without warning
--without profile

include dll.e
include machine.e

global atom sdl
sdl = open_dll("SDL.dll")

global constant SDL_INIT_TIMER=#00000001
global constant SDL_INIT_AUDIO=#00000010
global constant SDL_INIT_VIDEO=#00000020
global constant SDL_INIT_CDROM=#00000100
global constant SDL_INIT_JOYSTICK=#00000200
global constant SDL_INIT_NOPARACHUTE=#00100000        -- Don't catch fatal signals --
global constant SDL_INIT_EVENTTHREAD=#01000000        -- Not supported on all OS's --
global constant SDL_INIT_EVERYTHING=#0000FFFF


-- These are the currently supported flags for the SDL_surface --
-- Available for SDL_CreateRGBSurface() or SDL_SetVideoMode() --
global constant SDL_SWSURFACE=#00000000        -- Surface is in system memory --
global constant SDL_HWSURFACE=#00000001        -- Surface is in video memory --
global constant SDL_ASYNCBLIT=#00000004        -- Use asynchronous blits if possible --
-- Available for SDL_SetVideoMode() --
global constant SDL_ANYFORMAT=#10000000        -- Allow any video depth/pixel-format --
global constant SDL_HWPALETTE=#20000000        -- Surface has exclusive palette --
global constant SDL_DOUBLEBUF=#40000000        -- Set up double-buffered video mode --
global constant SDL_FULLSCREEN=#80000000        -- Surface is a full screen display --
global constant SDL_OPENGL=#00000002      -- Create an OpenGL rendering context --
global constant SDL_OPENGLBLIT=#0000000A        -- Create an OpenGL rendering context and use it for blitting --
global constant SDL_RESIZABLE=#00000010        -- This video mode may be resized --
global constant SDL_NOFRAME=#00000020        -- No window caption or edge frame --
-- Used internally (read-only) --
global constant SDL_HWACCEL=#00000100        -- Blit uses hardware acceleration --
global constant SDL_SRCCOLORKEY=#00001000        -- Blit uses a source color key --
global constant SDL_RLEACCELOK=#00002000        -- Private flag --
global constant SDL_RLEACCEL=#00004000        -- Surface is RLE encoded --
global constant SDL_SRCALPHA=#00010000        -- Blit uses source alpha blending --
global constant SDL_PREALLOC=#01000000        -- Surface uses preallocated memory --
  
global constant SDL_QUERY= -1
global constant SDL_IGNORE= 0
global constant SDL_DISABLE= 0
global constant SDL_ENABLE= 1

-- flags for SDL_SetPalette() --
global constant SDL_LOGPAL=#01
global constant SDL_PHYSPAL=#02

global constant SDL_YV12_OVERLAY=#32315659    -- Planar mode: Y + V + U  (3 planes) 
global constant SDL_IYUV_OVERLAY=#56555949    -- Planar mode: Y + U + V  (3 planes) 
global constant SDL_YUY2_OVERLAY=#32595559    -- Packed mode: Y0+U0+Y1+V0 (1 plane) 
global constant SDL_UYVY_OVERLAY=#59565955    -- Packed mode: U0+Y0+V0+Y1 (1 plane) 
global constant SDL_YVYU_OVERLAY=#55595659    -- Packed mode: Y0+V0+Y1+U0 (1 plane) 

global constant SDL_GRAB_QUERY = -1
global constant SDL_GRAB_OFF = 0
global constant SDL_GRAB_ON = 1
                
global constant SDL_ADDEVENT=0
global constant SDL_PEEKEVENT=1
global constant SDL_GETEVENT=2

global constant SDL_NOEVENT=0                         -- Unused (do not remove) --
global constant SDL_ACTIVEEVENT=1                        -- Application loses/gains visibility --
global constant SDL_KEYDOWN=2                        -- Keys pressed --
global constant SDL_KEYUP=3                        -- Keys released --
global constant SDL_MOUSEMOTION=4                        -- Mouse moved --
global constant SDL_MOUSEBUTTONDOWN=5                -- Mouse button pressed --
global constant SDL_MOUSEBUTTONUP=6                -- Mouse button released --
global constant SDL_JOYAXISMOTION=7                -- Joystick axis motion --
global constant SDL_JOYBALLMOTION=8                -- Joystick trackball motion --
global constant SDL_JOYHATMOTION=9                -- Joystick hat position change --
global constant SDL_JOYBUTTONDOWN=10                -- Joystick button pressed --
global constant SDL_JOYBUTTONUP=11                        -- Joystick button released --
global constant SDL_QUIT=12                        -- User-requested quit --
global constant SDL_SYSWMEVENT=13                        -- System specific event --
global constant SDL_EVENT_RESERVEDA=14                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVEDB=15                -- Reserved for future use.. --
global constant SDL_VIDEORESIZE=16                        -- User resized video mode --
global constant SDL_VIDEOEXPOSE=17                        -- Screen needs to be redrawn --
global constant SDL_EVENT_RESERVED2=18                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVED3=19                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVED4=20                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVED5=21                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVED6=22                -- Reserved for future use.. --
global constant SDL_EVENT_RESERVED7=23                -- Reserved for future use.. --
       -- Events SDL_USEREVENT through SDL_MAXEVENTS-1 are for your use --
global constant SDL_USEREVENT = 24
       -- This last event is only for bounding internal arrays
       --  It is the number of bits in the event mask datatype -- Uint32
       
global constant SDL_NUMEVENTS = 32
                               
global constant SDLK_UNKNOWN= 0
global constant SDLK_FIRST= 0
global constant SDLK_BACKSPACE= 8
global constant SDLK_TAB= 9
global constant SDLK_CLEAR= 12
global constant SDLK_RETURN= 13
global constant SDLK_PAUSE= 19
global constant SDLK_ESCAPE= 27
global constant SDLK_SPACE= 32
global constant SDLK_EXCLAIM= 33
global constant SDLK_QUOTEDBL= 34
global constant SDLK_HASH= 35
global constant SDLK_DOLLAR= 36
global constant SDLK_AMPERSAND= 38
global constant SDLK_QUOTE= 39
global constant SDLK_LEFTPAREN= 40
global constant SDLK_RIGHTPAREN= 41
global constant SDLK_ASTERISK= 42
global constant SDLK_PLUS= 43
global constant SDLK_COMMA= 44
global constant SDLK_MINUS= 45
global constant SDLK_PERIOD= 46
global constant SDLK_SLASH= 47
global constant SDLK_0= 48
global constant SDLK_1= 49
global constant SDLK_2= 50
global constant SDLK_3= 51
global constant SDLK_4= 52
global constant SDLK_5= 53
global constant SDLK_6= 54
global constant SDLK_7= 55
global constant SDLK_8= 56
global constant SDLK_9= 57
global constant SDLK_COLON= 58
global constant SDLK_SEMICOLON= 59
global constant SDLK_LESS= 60
global constant SDLK_EQUALS= 61
global constant SDLK_GREATER= 62
global constant SDLK_QUESTION= 63
global constant SDLK_AT= 64
        -- 
--= Skip uppercase letters
         --
global constant SDLK_LEFTBRACKET     = 91
global constant SDLK_BACKSLASH= 92
global constant SDLK_RIGHTBRACKET     = 93
global constant SDLK_CARET= 94
global constant SDLK_UNDERSCORE= 95
global constant SDLK_BACKQUOTE= 96
global constant SDLK_a= 97
global constant SDLK_b= 98
global constant SDLK_c= 99
global constant SDLK_d= 100
global constant SDLK_e= 101
global constant SDLK_f= 102
global constant SDLK_g= 103
global constant SDLK_h= 104
global constant SDLK_i= 105
global constant SDLK_j= 106
global constant SDLK_k= 107
global constant SDLK_l= 108
global constant SDLK_m= 109
global constant SDLK_n= 110
global constant SDLK_o= 111
global constant SDLK_p= 112
global constant SDLK_q= 113
global constant SDLK_r= 114
global constant SDLK_s= 115
global constant SDLK_t= 116
global constant SDLK_u= 117
global constant SDLK_v= 118
global constant SDLK_w= 119
global constant SDLK_x= 120
global constant SDLK_y= 121
global constant SDLK_z= 122
global constant SDLK_DELETE= 127
        -- End of ASCII mapped keysyms --

        -- International keyboard syms --
global constant SDLK_WORLD_0= 160      -- 0xA0 --
global constant SDLK_WORLD_1= 161
global constant SDLK_WORLD_2= 162
global constant SDLK_WORLD_3= 163
global constant SDLK_WORLD_4= 164
global constant SDLK_WORLD_5= 165
global constant SDLK_WORLD_6= 166
global constant SDLK_WORLD_7= 167
global constant SDLK_WORLD_8= 168
global constant SDLK_WORLD_9= 169
global constant SDLK_WORLD_10= 170
global constant SDLK_WORLD_11= 171
global constant SDLK_WORLD_12= 172
global constant SDLK_WORLD_13= 173
global constant SDLK_WORLD_14= 174
global constant SDLK_WORLD_15= 175
global constant SDLK_WORLD_16= 176
global constant SDLK_WORLD_17= 177
global constant SDLK_WORLD_18= 178
global constant SDLK_WORLD_19= 179
global constant SDLK_WORLD_20= 180
global constant SDLK_WORLD_21= 181
global constant SDLK_WORLD_22= 182
global constant SDLK_WORLD_23= 183
global constant SDLK_WORLD_24= 184
global constant SDLK_WORLD_25= 185
global constant SDLK_WORLD_26= 186
global constant SDLK_WORLD_27= 187
global constant SDLK_WORLD_28= 188
global constant SDLK_WORLD_29= 189
global constant SDLK_WORLD_30= 190
global constant SDLK_WORLD_31= 191
global constant SDLK_WORLD_32= 192
global constant SDLK_WORLD_33= 193
global constant SDLK_WORLD_34= 194
global constant SDLK_WORLD_35= 195
global constant SDLK_WORLD_36= 196
global constant SDLK_WORLD_37= 197
global constant SDLK_WORLD_38= 198
global constant SDLK_WORLD_39= 199
global constant SDLK_WORLD_40= 200
global constant SDLK_WORLD_41= 201
global constant SDLK_WORLD_42= 202
global constant SDLK_WORLD_43= 203
global constant SDLK_WORLD_44= 204
global constant SDLK_WORLD_45= 205
global constant SDLK_WORLD_46= 206
global constant SDLK_WORLD_47= 207
global constant SDLK_WORLD_48= 208
global constant SDLK_WORLD_49= 209
global constant SDLK_WORLD_50= 210
global constant SDLK_WORLD_51= 211
global constant SDLK_WORLD_52= 212
global constant SDLK_WORLD_53= 213
global constant SDLK_WORLD_54= 214
global constant SDLK_WORLD_55= 215
global constant SDLK_WORLD_56= 216
global constant SDLK_WORLD_57= 217
global constant SDLK_WORLD_58= 218
global constant SDLK_WORLD_59= 219
global constant SDLK_WORLD_60= 220
global constant SDLK_WORLD_61= 221
global constant SDLK_WORLD_62= 222
global constant SDLK_WORLD_63= 223
global constant SDLK_WORLD_64= 224
global constant SDLK_WORLD_65= 225
global constant SDLK_WORLD_66= 226
global constant SDLK_WORLD_67= 227
global constant SDLK_WORLD_68= 228
global constant SDLK_WORLD_69= 229
global constant SDLK_WORLD_70= 230
global constant SDLK_WORLD_71= 231
global constant SDLK_WORLD_72= 232
global constant SDLK_WORLD_73= 233
global constant SDLK_WORLD_74= 234
global constant SDLK_WORLD_75= 235
global constant SDLK_WORLD_76= 236
global constant SDLK_WORLD_77= 237
global constant SDLK_WORLD_78= 238
global constant SDLK_WORLD_79= 239
global constant SDLK_WORLD_80= 240
global constant SDLK_WORLD_81= 241
global constant SDLK_WORLD_82= 242
global constant SDLK_WORLD_83= 243
global constant SDLK_WORLD_84= 244
global constant SDLK_WORLD_85= 245
global constant SDLK_WORLD_86= 246
global constant SDLK_WORLD_87= 247
global constant SDLK_WORLD_88= 248
global constant SDLK_WORLD_89= 249
global constant SDLK_WORLD_90= 250
global constant SDLK_WORLD_91= 251
global constant SDLK_WORLD_92= 252
global constant SDLK_WORLD_93= 253
global constant SDLK_WORLD_94= 254
global constant SDLK_WORLD_95= 255      -- 0xFF --

        -- Numeric keypad --
global constant SDLK_KP0= 256
global constant SDLK_KP1= 257
global constant SDLK_KP2= 258
global constant SDLK_KP3= 259
global constant SDLK_KP4= 260
global constant SDLK_KP5= 261
global constant SDLK_KP6= 262
global constant SDLK_KP7= 263
global constant SDLK_KP8= 264
global constant SDLK_KP9= 265
global constant SDLK_KP_PERIOD= 266
global constant SDLK_KP_DIVIDE= 267
global constant SDLK_KP_MULTIPLY = 268
global constant SDLK_KP_MINUS= 269
global constant SDLK_KP_PLUS= 270
global constant SDLK_KP_ENTER= 271
global constant SDLK_KP_EQUALS= 272

        -- Arrows + Home/End pad --
global constant SDLK_UP= 273
global constant SDLK_DOWN= 274
global constant SDLK_RIGHT= 275
global constant SDLK_LEFT= 276
global constant SDLK_INSERT= 277
global constant SDLK_HOME= 278
global constant SDLK_END= 279
global constant SDLK_PAGEUP= 280
global constant SDLK_PAGEDOWN= 281

        -- Function keys --
global constant SDLK_F1= 282
global constant SDLK_F2= 283
global constant SDLK_F3= 284
global constant SDLK_F4= 285
global constant SDLK_F5= 286
global constant SDLK_F6= 287
global constant SDLK_F7= 288
global constant SDLK_F8= 289
global constant SDLK_F9= 290
global constant SDLK_F10= 291
global constant SDLK_F11= 292
global constant SDLK_F12= 293
global constant SDLK_F13= 294
global constant SDLK_F14= 295
global constant SDLK_F15= 296

        -- Key state modifier keys --
global constant SDLK_NUMLOCK= 300
global constant SDLK_CAPSLOCK= 301
global constant SDLK_SCROLLOCK= 302
global constant SDLK_RSHIFT= 303
global constant SDLK_LSHIFT= 304
global constant SDLK_RCTRL= 305
global constant SDLK_LCTRL= 306
global constant SDLK_RALT= 307
global constant SDLK_LALT= 308
global constant SDLK_RMETA= 309
global constant SDLK_LMETA= 310
global constant SDLK_LSUPER= 311      -- Left "Windows" key --
global constant SDLK_RSUPER= 312      -- Right "Windows" key --
global constant SDLK_MODE= 313      -- "Alt Gr" key --
global constant SDLK_COMPOSE= 314      -- Multi-key compose key --

        -- Miscellaneous function keys --
global constant SDLK_HELP= 315
global constant SDLK_PRINT= 316
global constant SDLK_SYSREQ= 317
global constant SDLK_BREAK= 318
global constant SDLK_MENU= 319
global constant SDLK_POWER= 320      -- Power Macintosh power key --
global constant SDLK_EURO= 321      -- Some european keyboards --
global constant SDLK_UNDO= 322      -- Atari keyboard has Undo --

        -- Add any other keys here --

global constant SDLK_LAST = 323

global constant KMOD_NONE  = #0000
global constant KMOD_LSHIFT= #0001
global constant KMOD_RSHIFT= #0002
global constant KMOD_LCTRL = #0040
global constant KMOD_RCTRL = #0080
global constant KMOD_LALT  = #0100
global constant KMOD_RALT  = #0200
global constant KMOD_LMETA = #0400
global constant KMOD_RMETA = #0800
global constant KMOD_NUM= #1000
global constant KMOD_CAPS  = #2000
global constant KMOD_MODE  = #4000
global constant KMOD_RESERVED = #8000

global constant SDL_APPMOUSEFOCUS = #01      -- The app has mouse coverage --
global constant SDL_APPINPUTFOCUS = #02      -- The app has input focus --
global constant SDL_APPACTIVE     = #04      -- The application is active --

global constant AUDIO_U8 =#0008      -- Unsigned 8-bit samples --
global constant AUDIO_S8 =#8008      -- Signed 8-bit samples --
global constant AUDIO_U16LSB =#0010      -- Unsigned 16-bit samples --
global constant AUDIO_S16LSB =#8010      -- Signed 16-bit samples --
global constant AUDIO_U16MSB =#1010      -- As above, but big-endian byte order --
global constant AUDIO_S16MSB =#9010      -- As above, but big-endian byte order --
global constant AUDIO_U16 =  AUDIO_U16LSB
global constant AUDIO_S16 =  AUDIO_S16LSB

global constant SDL_AUDIO_STOPPED = 0
global constant SDL_AUDIO_PLAYING = 1
global constant SDL_AUDIO_PAUSED  = 2

global constant CD_TRAYEMPTY = 0
global constant CD_STOPPED = 1
global constant CD_PLAYING = 2
global constant CD_PAUSED = 3
global constant CD_ERROR = -1

------------------------------------------------------------ 
-- General

constant
xSDL_Init=define_c_func(sdl,"SDL_Init",{C_UINT},C_INT),
xSDL_InitSubSystem=define_c_func(sdl,"SDL_InitSubSystem",{C_UINT},C_INT),
xSDL_QuitSubSystem=define_c_proc(sdl,"SDL_QuitSubSystem",{C_UINT}),
xSDL_Quit=define_c_proc(sdl,"SDL_Quit",{}),
xSDL_WasInit=define_c_func(sdl,"SDL_WasInit",{C_UINT},C_UINT),
xSDL_GetError=define_c_func(sdl,"SDL_GetError",{},C_UINT)

-- SDL_Init -- Initializes SDL
global function SDL_Init(atom flags)
    return c_func(xSDL_Init,{flags})
end function

-- SDL_InitSubSystem -- Initialize subsystems
global function SDL_InitSubSystem(atom flags)
    return c_func(xSDL_InitSubSystem,{flags})
end function

-- SDL_QuitSubSystem -- Shut down a subsystem
global procedure SDL_QuitSubSystem(atom flags)
    c_proc(xSDL_QuitSubSystem,{flags})
end procedure

-- SDL_Quit -- Shut down SDL
global procedure SDL_Quit()
    c_proc(xSDL_Quit,{})
end procedure

-- SDL_WasInit -- Check which subsystems are initialized
global function SDL_WasInit(atom flags)
    return c_func(xSDL_WasInit,{flags})
end function

-- SDL_GetError -- Get SDL error string
global function SDL_GetError()
    return c_func(xSDL_GetError,{})
end function


------------------------------------------------------------ 
-- Video

constant
xSDL_GetVideoSurface=define_c_func(sdl,"SDL_GetVideoSurface",{},C_POINTER),
xSDL_GetVideoInfo=define_c_func(sdl,"SDL_GetVideoSurface",{},C_POINTER),
xSDL_VideoDriverName=define_c_func(sdl,"SDL_VideoDriverName",{C_POINTER,C_INT},C_POINTER),
xSDL_ListModes=define_c_func(sdl,"SDL_ListModes",{C_POINTER,C_INT},C_POINTER),
xSDL_VideoModeOK=define_c_func(sdl,"SDL_VideoModeOK",{C_INT,C_INT,C_INT,C_UINT},C_INT),
xSDL_SetVideoMode=define_c_func(sdl,"SDL_SetVideoMode",{C_INT,C_INT,C_INT,C_UINT},C_POINTER),
xSDL_UpdateRect=define_c_proc(sdl,"SDL_UpdateRect",{C_POINTER,C_INT,C_INT,C_INT,C_INT}),
xSDL_UpdateRects=define_c_proc(sdl,"SDL_UpdateRects",{C_POINTER,C_INT,C_POINTER}),
xSDL_Flip=define_c_func(sdl,"SDL_Flip",{C_POINTER},C_INT),
xSDL_SetColors=define_c_func(sdl,"SDL_SetColors",{C_POINTER,C_POINTER,C_INT,C_INT},C_INT),
xSDL_SetPalette=define_c_func(sdl,"SDL_SetPalette",{C_POINTER,C_INT,C_POINTER,C_INT,C_INT},C_INT),
xSDL_SetGamma=define_c_func(sdl,"SDL_SetGamma",{C_FLOAT,C_FLOAT,C_FLOAT},C_INT),
xSDL_GetGammaRamp=define_c_func(sdl,"SDL_GetGammaRamp",{C_POINTER,C_POINTER,C_POINTER},C_INT),
xSDL_SetGammaRamp=define_c_func(sdl,"SDL_SetGammaRamp",{C_POINTER,C_POINTER,C_POINTER},C_INT),
xSDL_MapRGB=define_c_func(sdl,"SDL_MapRGB",{C_POINTER,C_UCHAR,C_UCHAR,C_UCHAR},C_INT),
xSDL_MapRGBA=define_c_func(sdl,"SDL_MapRGBA",{C_POINTER,C_UCHAR,C_UCHAR,C_UCHAR,C_UCHAR},C_INT),
xSDL_GetRGB=define_c_proc(sdl,"SDL_GetRGB",{C_UINT,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
xSDL_GetRGBA=define_c_proc(sdl,"SDL_GetRGBA",{C_UINT,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER}),
xSDL_CreateRGBSurface=define_c_func(sdl,"SDL_CreateRGBSurface",{C_UINT,C_INT,C_INT,C_INT,C_UINT,C_UINT,C_UINT,C_UINT},C_POINTER),
xSDL_CreateRGBSurfaceFrom=define_c_func(sdl,"SDL_CreateRGBSurfaceFrom",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT,C_UINT,C_UINT,C_UINT},C_POINTER),
xSDL_FreeSurface=define_c_proc(sdl,"SDL_FreeSurface",{C_POINTER}),
xSDL_LockSurface=define_c_func(sdl,"SDL_LockSurface",{C_POINTER},C_INT),
xSDL_UnlockSurface=define_c_proc(sdl,"SDL_UnlockSurface",{C_POINTER}),
xSDL_RWFromFile=define_c_func(sdl,"SDL_RWFromFile",{C_POINTER,C_POINTER},C_POINTER),
xSDL_LoadBMP_RW=define_c_func(sdl,"SDL_LoadBMP_RW",{C_POINTER,C_INT},C_POINTER),
xSDL_SaveBMP_RW=define_c_func(sdl,"SDL_SaveBMP_RW",{C_POINTER,C_POINTER,C_INT},C_INT),
xSDL_SetColorKey=define_c_func(sdl,"SDL_SetColorKey",{C_POINTER,C_UINT,C_UINT},C_INT),
xSDL_SetAlpha=define_c_func(sdl,"SDL_SetAlpha",{C_POINTER,C_UINT,C_UCHAR},C_INT),
xSDL_SetClipRect=define_c_proc(sdl,"SDL_SetClipRect",{C_POINTER,C_POINTER}),
xSDL_GetClipRect=define_c_proc(sdl,"SDL_SetClipRect",{C_POINTER,C_POINTER}),
xSDL_ConvertSurface=define_c_func(sdl,"SDL_ConvertSurface",{C_POINTER,C_POINTER,C_UINT},C_POINTER),
xSDL_BlitSurface=define_c_func(sdl,"SDL_UpperBlit",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT),
xSDL_FillRect=define_c_func(sdl,"SDL_FillRect",{C_POINTER,C_POINTER,C_UINT},C_INT),
xSDL_DisplayFormat=define_c_func(sdl,"SDL_DisplayFormat",{C_POINTER},C_POINTER),
xSDL_DisplayFormatAlpha=define_c_func(sdl,"SDL_DisplayFormatAlpha",{C_POINTER},C_POINTER),
xSDL_WarpMouse=define_c_proc(sdl,"SDL_WarpMouse",{C_UINT,C_UINT}),
xSDL_CreateCursor=define_c_func(sdl,"SDL_CreateCursor",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT},C_POINTER),
xSDL_FreeCursor=define_c_proc(sdl,"SDL_FreeCursor",{C_POINTER}),
xSDL_SetCursor=define_c_proc(sdl,"SDL_SetCursor",{C_POINTER}),
xSDL_GetCursor=define_c_func(sdl,"SDL_GetCursor",{},C_POINTER),
xSDL_ShowCursor=define_c_func(sdl,"SDL_ShowCursor",{C_INT},C_INT),
xSDL_GL_LoadLibrary=define_c_func(sdl,"SDL_GL_LoadLibrary",{C_POINTER},C_INT),
xSDL_GL_GetProcAddress=define_c_func(sdl,"SDL_GL_GetProcAddress",{C_POINTER},C_POINTER),
xSDL_GL_GetAttribute=define_c_func(sdl,"SDL_GL_GetAttribute",{C_UINT,C_POINTER},C_INT),
xSDL_GL_SetAttribute=define_c_func(sdl,"SDL_GL_SetAttribute",{C_UINT,C_POINTER},C_INT),
xSDL_GL_SwapBuffers=define_c_proc(sdl,"SDL_GL_SwapBuffers",{}),
xSDL_CreateYUVOverlay=define_c_func(sdl,"SDL_CreateYUVOverlay",{C_INT,C_INT,C_UINT,C_POINTER},C_POINTER),
xSDL_LockYUVOverlay=define_c_func(sdl,"SDL_LockYUVOverlay",{C_POINTER},C_INT),
xSDL_UnlockYUVOverlay=define_c_proc(sdl,"SDL_UnlockYUVOverlay",{C_POINTER}),
xSDL_DisplayYUVOverlay=define_c_func(sdl,"SDL_DisplayYUVOverlay",{C_POINTER,C_POINTER},C_INT),
xSDL_FreeYUVOverlay=define_c_proc(sdl,"SDL_FreeYUVOverlay",{C_POINTER})

-- SDL_GetVideoSurface -- returns a pointer to the current display surface
global function SDL_GetVideoSurface()
    return c_func(xSDL_GetVideoSurface,{})
end function

-- SDL_GetVideoInfo -- returns a pointer to information about the
-- video hardware
global function SDL_GetVideoInfo()
    return c_func(xSDL_GetVideoInfo,{})
end function

-- SDL_VideoDriverName -- Obtain the name of the video driver
global function SDL_VideoDriverName(atom namebuf, integer maxlen)
    return c_func(xSDL_VideoDriverName,{namebuf,maxlen})
end function

-- SDL_ListModes -- Returns a pointer to an array of available screen
-- dimensions for the given format and video flags
global function SDL_ListModes(atom format, atom flags)
    return c_func(xSDL_ListModes,{format,flags})
end function

-- SDL_VideoModeOK -- Check to see if a particular video mode is supported.
global function SDL_VideoModeOK(integer width, integer height, integer bpp, atom flags)
    return c_func(xSDL_VideoModeOK, {width,height,bpp,flags})
end function

-- SDL_SetVideoMode -- Set up a video mode with the specified width,
-- height and bits-per-pixel.
global function SDL_SetVideoMode(integer width, integer height, integer bpp, atom flags)
    return c_func(xSDL_SetVideoMode, {width,height,bpp,flags})
end function

-- SDL_UpdateRect -- Makes sure the given area is updated on the given screen.
global procedure SDL_UpdateRect(atom surface, integer x, integer y, integer w, integer h)
    c_proc(xSDL_UpdateRect,{surface,x,y,w,h})
end procedure

-- SDL_UpdateRects -- Makes sure the given list of rectangles is updated 
-- on the given screen.
global procedure SDL_UpdateRects(atom surface, integer numrects, atom rects )
    c_proc(xSDL_UpdateRects,{surface,numrects,rects})
end procedure

--SDL_Flip -- Swaps screen buffers
global function SDL_Flip(atom surface)
    return c_func(xSDL_Flip,{surface})
end function

--SDL_SetColors -- Swaps screen buffers
global function SDL_SetColors(atom surface, atom colors, integer firstcolor, integer ncolors)
    return c_func(xSDL_SetColors,{surface, colors, firstcolor, ncolors})
end function

-- SDL_SetPalette -- Sets the colors in the palette of an 8-bit surface.
global function SDL_SetPalette(atom surface,integer flags, atom colors, integer firstcolor, integer ncolors)
    return c_func(xSDL_SetPalette,{surface, flags, colors, firstcolor, ncolors})
end function

-- SDL_SetGamma -- Sets the colors in the palette of an 8-bit surface.
global function SDL_SetGamma(atom redgamma, atom greengamma, atom bluegamma)
    return c_func(xSDL_SetGamma,{redgamma, greengamma, bluegamma})
end function

-- SDL_GetGammaRamp -- Gets the color gamma lookup tables for the display
global function SDL_GetGammaRamp(atom redtable, atom greentable, atom bluetable)
    return c_func(xSDL_GetGammaRamp,{redtable, greentable, bluetable})
end function

-- SDL_SetGammaRamp -- Sets the color gamma lookup tables for the display
global function SDL_SetGammaRamp(atom redtable, atom greentable, atom bluetable)
    return c_func(xSDL_SetGammaRamp,{redtable, greentable, bluetable})
end function

-- SDL_MapRGB -- Map a RGB color value to a pixel format.
global function SDL_MapRGB(atom fmt, integer r, integer g, integer b)
    return c_func(xSDL_MapRGB,{fmt,r,g,b})
end function

-- SDL_MapRGBA -- Map a RGBA color value to a pixel format.
global function SDL_MapRGBA(atom fmt, integer r, integer g, integer b, integer a)
    return c_func(xSDL_MapRGBA,{fmt,r,g,b,a})
end function

-- SDL_GetRGB -- Get RGB values from a pixel in the specified pixel format.
global procedure SDL_GetRGB(atom pixelz, atom fmt, atom r, atom g, atom b)
    c_proc(xSDL_GetRGB,{pixelz,fmt,r,g,b})
end procedure

-- SDL_GetRGBA -- Get RGBA values from a pixel in the specified pixel format.
global procedure SDL_GetRGBA(atom pixelz, atom fmt, atom r, atom g, atom b, atom a)
    c_proc(xSDL_GetRGBA,{pixelz,fmt,r,g,b,a})
end procedure        

-- SDL_CreateRGBSurface -- Create an empty SDL_Surface
global function SDL_CreateRGBSurface(atom flags, integer width, integer height, integer depth, atom Rmask, atom Gmask, atom Bmask, atom Amask)
    return c_func(xSDL_CreateRGBSurface,{flags,width,height,depth,Rmask,Gmask,Bmask,Amask})
end function

-- SDL_CreateRGBSurfaceFrom -- Create an SDL_Surface from pixel data
global function SDL_CreateRGBSurfaceFrom(atom pixels, integer width, integer height, integer depth, integer pitch, atom Rmask, atom Gmask, atom Bmask, atom Amask)
    return c_func(xSDL_CreateRGBSurfaceFrom,{pixels,width,height,depth,pitch,Rmask,Gmask,Bmask,Amask})
end function

-- SDL_FreeSurface -- Frees (deletes) a SDL_Surface
global procedure SDL_FreeSurface(atom surface)
    c_proc(xSDL_FreeSurface,{surface})
end procedure

-- SDL_LockSurface -- Lock a surface for directly access
global function SDL_LockSurface(atom surface)
    return c_func(xSDL_LockSurface,{surface})
end function

-- SDL_UnlockSurface -- Unlocks a previously locked surface.
global procedure SDL_UnlockSurface(atom surface)
    c_proc(xSDL_UnlockSurface,{surface})
end procedure

-- SDL_RWFromFile
global function SDL_RWFromFile(sequence fname, sequence x)
    atom f_adr,x_adr 
    atom ret
    f_adr = allocate_string(fname)
    x_adr = allocate_string(x)
    ret= c_func(xSDL_RWFromFile,{f_adr,x_adr})
    free(f_adr)
    free(x_adr)
    return ret
end function

-- SDL_LoadBMP_RW
global function SDL_LoadBMP_RW(atom src, integer freesrc)
    return c_func(xSDL_LoadBMP_RW,{src,freesrc})
end function

-- SDL_LoadBMP -- Load a Windows BMP file into an SDL_Surface.
global function SDL_LoadBMP(sequence fname)
    return SDL_LoadBMP_RW(SDL_RWFromFile(fname,"rb"),1)
end function

-- SDL_SaveBMP_RW
global function SDL_SaveBMP_RW(atom surface, atom dst, integer freesrc)
    return c_func(xSDL_SaveBMP_RW,{surface,dst,freesrc})
end function

-- SDL_SaveBMP -- Save an SDL_Surface as a Windows BMP file
global function SDL_SaveBMP(atom surface, sequence fname)
    return SDL_SaveBMP_RW(surface,SDL_RWFromFile(fname,"wb"),1)
end function

-- SDL_SetColorKey -- Sets the color key (transparent pixel) in a blittable
-- surface and RLE acceleration.
global function SDL_SetColorKey(atom surface, atom flag, atom key)
    return c_func(xSDL_SetColorKey,{surface,flag,key})
end function

-- SDL_SetAlpha -- Adjust the alpha properties of a surface
global function SDL_SetAlpha(atom surface, atom flag, integer alpha)
    return c_func(xSDL_SetAlpha,{surface,flag,alpha})
end function

-- SDL_SetClipRect -- Sets the clipping rectangle for a surface.
global procedure SDL_SetClipRect(atom surface, atom rect)
    c_proc(xSDL_SetClipRect,{surface,rect})
end procedure

-- SDL_GetClipRect -- Gets the clipping rectangle for a surface.
global procedure SDL_GetClipRect(atom surface, atom rect)
    c_proc(xSDL_GetClipRect,{surface,rect})
end procedure

-- SDL_ConvertSurface -- Converts a surface to the same format as
-- another surface.
global function SDL_ConvertSurface(atom src, atom fmt, atom flags)
    return c_func(xSDL_ConvertSurface,{src,fmt,flags})
end function

-- SDL_BlitSurface -- This performs a fast blit from the source surface
-- to the destination surface.
global function SDL_BlitSurface(atom src, atom srcrect, atom dst, atom dstrect)
    return c_func(xSDL_BlitSurface,{src,srcrect,dst,dstrect})
end function

-- SDL_FillRect -- This function performs a fast fill of the given rectangle
-- with some color
global function SDL_FillRect(atom dst, atom dstrect, atom color)
    return c_func(xSDL_FillRect,{dst,dstrect,color})
end function

-- SDL_DisplayFormat -- Convert a surface to the display format
global function SDL_DisplayFormat(atom surface)
    return c_func(xSDL_DisplayFormat,{surface})
end function

-- SDL_DisplayFormatAlpha -- Convert a surface to the display format
global function SDL_DisplayFormatAlpha(atom surface)
    return c_func(xSDL_DisplayFormatAlpha,{surface})
end function

-- SDL_WarpMouse -- Set the position of the mouse cursor.
global procedure SDL_WarpMouse(integer x, integer y)
    c_proc(xSDL_WarpMouse,{x,y})
end procedure

-- SDL_CreateCursor -- Creates a new mouse cursor.
global function SDL_CreateCursor(atom data, atom mask, integer w, integer h, integer hot_x, integer hot_y)
    return c_func(xSDL_CreateCursor,{data,mask,w,h,hot_x,hot_y})
end function

-- SDL_FreeCursor -- Frees a cursor created with SDL_CreateCursor.
global procedure SDL_FreeCursor(atom cursorz)
    c_proc(xSDL_FreeCursor,{cursorz})
end procedure

-- SDL_SetCursor -- Set the currently active mouse cursor.
global procedure SDL_SetCursor(atom cursorz)
    c_proc(xSDL_SetCursor,{cursorz})
end procedure

-- SDL_GetCursor -- Get the currently active mouse cursor.
global function SDL_GetCursor()
    return c_func(xSDL_GetCursor,{})
end function

-- SDL_ShowCursor -- Toggle whether or not the cursor is shown on the screen.
global function SDL_ShowCursor(integer toggle)
    return c_func(xSDL_ShowCursor,{toggle})
end function

-- SDL_GL_LoadLibrary -- Specify an OpenGL library
global function SDL_GL_LoadLibrary(sequence path)
    atom p_adr 
    integer ret
    p_adr = allocate_string(path)
    ret= c_func(xSDL_GL_LoadLibrary,{p_adr})
    free(p_adr)
    return ret
end function

-- SDL_GL_GetProcAddress -- Get the address of a GL function
global function SDL_GL_GetProcAddress(sequence proc)
    atom p_adr 
    integer ret
    p_adr = allocate_string(proc)
    ret= c_func(xSDL_GL_GetProcAddress,{p_adr})
    free(p_adr)
    return ret
end function

-- SDL_GL_GetAttribute -- Get the value of a special SDL/OpenGL attribute
global function SDL_GL_GetAttribute(atom attr,atom valuez)
    return c_func(xSDL_GL_GetAttribute,{attr,valuez})
end function

-- SDL_GL_SetAttribute -- Set a special SDL/OpenGL attribute
global function SDL_GL_SetAttribute(atom attr,atom valuez)
    return c_func(xSDL_GL_SetAttribute,{attr,valuez})
end function

-- SDL_GL_SwapBuffers -- Swap OpenGL framebuffers/Update Display
global procedure SDL_GL_SwapBuffers()
    c_proc(xSDL_GL_SwapBuffers,{})
end procedure

-- SDL_CreateYUVOverlay -- Create a YUV video overlay
global function SDL_CreateYUVOverlay(integer width, integer height, atom format, atom display)
    return c_func(xSDL_CreateYUVOverlay,{width,height,format,display})
end function

-- SDL_LockYUVOverlay -- Lock an overlay
global function SDL_LockYUVOverlay(atom overlay)
    return c_func(xSDL_LockYUVOverlay,{overlay})
end function

-- SDL_UnlockYUVOverlay -- Unlock an overlay
global procedure SDL_UnlockYUVOverlay(atom overlay)
    c_proc(xSDL_UnlockYUVOverlay,{overlay})
end procedure      

-- SDL_DisplayYUVOverlay -- Blit the overlay to the display
global function SDL_DisplayYUVOverlay(atom overlay, atom dstrect)
    return c_func(xSDL_DisplayYUVOverlay,{overlay,dstrect})
end function

-- SDL_FreeYUVOverlay -- Free a YUV video overlay
global procedure SDL_FreeYUVOverlay(atom overlay)
    c_proc(xSDL_FreeYUVOverlay,{overlay})
end procedure      

------------------------------------------------------------ 
-- Window Management

constant
xSDL_WM_SetCaption=define_c_proc(sdl,"SDL_WM_SetCaption",{C_POINTER,C_POINTER}),
xSDL_WM_GetCaption=define_c_proc(sdl,"SDL_WM_GetCaption",{C_POINTER,C_POINTER}),
xSDL_WM_SetIcon=define_c_proc(sdl,"SDL_WM_SetIcon",{C_POINTER,C_POINTER}),
xSDL_WM_IconifyWindow=define_c_func(sdl,"SDL_WM_IconifyWindow",{},C_INT),
xSDL_WM_ToggleFullScreen=define_c_func(sdl,"SDL_WM_ToggleFullScreen",{C_POINTER},C_INT),
xSDL_WM_GrabInput=define_c_func(sdl,"SDL_WM_GrabInput",{C_POINTER},C_POINTER)

-- SDL_WM_SetCaption -- Sets the window tile and icon name.
global procedure SDL_WM_SetCaption(sequence title, sequence icon)
    atom t_adr,i_adr 
    t_adr = allocate_string(title)
    i_adr = allocate_string(icon)
    c_proc(xSDL_WM_SetCaption,{t_adr,i_adr})
    free(t_adr)
    free(i_adr)
end procedure      

-- SDL_WM_GetCaption -- Gets the window title and icon name.
global procedure SDL_WM_GetCaption(atom title, atom icon)
    c_proc(xSDL_WM_GetCaption,{title,icon})
end procedure      
         
-- SDL_WM_SetIcon - Sets the icon for the display window.
global procedure SDL_WM_SetIcon(atom icon, atom mask)
    c_proc(xSDL_WM_SetIcon,{icon,mask})
end procedure      

-- SDL_WM_IconifyWindow -- Iconify/Minimise the window
global function SDL_WM_IconifyWindow()
    return c_func(xSDL_WM_IconifyWindow,{})
end function

-- SDL_WM_ToggleFullScreen -- Toggles fullscreen mode
global function SDL_WM_ToggleFullScreen(atom surface)
    return c_func(xSDL_WM_ToggleFullScreen,{surface})
end function

-- SDL_WM_GrabInput -- Grabs mouse and keyboard input.
global function SDL_WM_GrabInput(atom mode)
    return c_func(xSDL_WM_GrabInput,{mode})
end function

------------------------------------------------------------ 
-- Event Handling

constant
xSDL_PumpEvents=define_c_proc(sdl,"SDL_PumpEvents",{}),
xSDL_PeepEvents=define_c_func(sdl,"SDL_PeepEvents",{C_POINTER,C_INT,C_INT,C_UINT},C_INT),
xSDL_PollEvent=define_c_func(sdl,"SDL_PollEvent",{C_POINTER},C_INT),
xSDL_WaitEvent=define_c_func(sdl,"SDL_WaitEvent",{C_POINTER},C_INT),
xSDL_PushEvent=define_c_func(sdl,"SDL_PushEvent",{C_POINTER},C_INT),
--xSDL_SetEventFilter=define_c_proc(sdl,"SetEventFilter",{C_POINTER}),
--xSDL_GetEventFilter=define_c_func(sdl,"GetEventFilter",{},C_POINTER),
--xSDL_EventState=define_c_func(sdl,"EventState",{C_UCHAR,C_INT},C_UCHAR),
xSDL_GetKeyState=define_c_func(sdl,"SDL_GetKeyState",{C_POINTER},C_POINTER),
xSDL_GetModState=define_c_func(sdl,"SDL_GetModState",{},C_INT),
xSDL_SetModState=define_c_proc(sdl,"SDL_SetModState",{C_INT}),
xSDL_GetKeyName=define_c_func(sdl,"SDL_GetKeyName",{C_INT},C_POINTER),
xSDL_EnableUNICODE=define_c_func(sdl,"SDL_EnableUNICODE",{C_INT},C_INT),
xSDL_EnableKeyRepeat=define_c_func(sdl,"SDL_EnableKeyRepeat",{C_INT,C_INT},C_INT),
xSDL_GetMouseState=define_c_func(sdl,"SDL_GetMouseState",{C_POINTER,C_POINTER},C_UCHAR),
xSDL_GetRelativeMouseState=define_c_func(sdl,"SDL_GetRelativeMouseState",{C_POINTER,C_POINTER},C_UCHAR),
xSDL_GetAppState=define_c_func(sdl,"SDL_GetAppState",{},C_UCHAR),
xSDL_JoystickEventState=define_c_func(sdl,"SDL_JoystickEventState",{C_INT},C_INT)

-- SDL_PumpEvents -- Pumps the event loop, gathering events from the
-- input devices.
global procedure SDL_PumpEvents()
    c_proc(xSDL_PumpEvents,{})    
end procedure

-- SDL_PeepEvents -- Checks the event queue for messages and
-- optionally returns them
global function SDL_PeepEvents(atom events, integer numevents, integer eventaction, atom mask)
    return c_func(xSDL_PeepEvents,{events,numevents,eventaction,mask})
end function

-- SDL_PollEvent -- Polls for currently pending events.
global function SDL_PollEvent(atom event)
    return c_func(xSDL_PollEvent,{event})
end function

-- SDL_WaitEvent -- Waits indefinitely for the next available event.
global function SDL_WaitEvent(atom event)
    return c_func(xSDL_WaitEvent,{event})
end function

-- SDL_PushEvent -- Pushes an event onto the event queue
global function SDL_PushEvent(atom event)
    return c_func(xSDL_PushEvent,{event})
end function

-- SDL_SetEventFilter -- Sets up a filter to process all events before they 
-- are posted to the event queue.
--global procedure SDL_SetEventFilter(atom filter)
--    c_proc(xSDL_SetEventFilter,{filter})=    
--end procedure

-- SDL_GetEventFilter -- Retrieves a pointer to he event filter
--global function SDL_GetEventFilter()
--    return c_func(xSDL_GetEventFilter,{})
--end function

-- global function SDL_EventState(integer typez, integer state)
--    return c_func(xSDL_EventState,{typez,state})
--end function

-- SDL_GetKeyState -- Get a snapshot of the current keyboard state
global function SDL_GetKeyState(atom numkeys)
    return c_func(xSDL_GetKeyState,{numkeys})
end function

-- SDL_GetModState -- Get the state of modifier keys
global function SDL_GetModState()
    return c_func(xSDL_GetModState,{})
end function

-- SDL_SetModState -- Set the current key modifier state
global procedure SDL_SetModState(integer modstate)
    c_proc(xSDL_SetModState,{modstate})
end procedure

-- SDL_GetKeyName -- Get the name of an SDL virtual keysym
global function SDL_GetKeyName(integer key)
    return c_func(xSDL_GetKeyName,{key})
end function

-- SDL_EnableUNICODE -- Enable UNICODE translation
global function SDL_EnableUNICODE(integer enable)
    return c_func(xSDL_EnableUNICODE,{enable})
end function

-- SDL_EnableKeyRepeat -- Set keyboard repeat rate
global function SDL_EnableKeyRepeat(integer delay, integer interval)
    return c_func(xSDL_EnableKeyRepeat,{delay,interval})
end function

--SDL_GetMouseState -- Retrieve the current state of the mouse
global function SDL_GetMouseState(atom x, atom y)
    return c_func(xSDL_GetMouseState,{x,y})
end function

-- SDL_GetRelativeMouseState -- Retrieve the current state of the mouse
global function SDL_GetRelativeMouseState(atom x, atom y)
    return c_func(xSDL_GetRelativeMouseState,{x,y})
end function

-- SDL_GetAppState -- Get the state of the application
global function SDL_GetAppState()
    return c_func(xSDL_GetAppState,{})
end function

-- SDL_JoystickEventState -- Enable/disable joystick event polling
global function SDL_JoystickEventState(integer state)
    return c_func(xSDL_JoystickEventState,{state})
end function

------------------------------------------------------------ 
-- Joystick

constant
xSDL_NumJoysticks=define_c_func(sdl,"SDL_NumJoysticks",{},C_INT),
xSDL_JoystickName=define_c_func(sdl,"SDL_JoystickName",{C_INT},C_POINTER),
xSDL_JoystickOpen=define_c_func(sdl,"SDL_JoystickOpen",{C_INT},C_POINTER),
xSDL_JoystickOpened=define_c_func(sdl,"SDL_JoystickOpened",{C_INT},C_INT),
xSDL_JoystickIndex=define_c_func(sdl,"SDL_JoystickIndex",{C_POINTER},C_INT),
xSDL_JoystickNumAxes=define_c_func(sdl,"SDL_JoystickNumAxes",{C_POINTER},C_INT),
xSDL_JoystickNumBalls=define_c_func(sdl,"SDL_JoystickNumBalls",{C_POINTER},C_INT),
xSDL_JoystickNumHats=define_c_func(sdl,"SDL_JoystickNumHats",{C_POINTER},C_INT),
xSDL_JoystickNumButtons=define_c_func(sdl,"SDL_JoystickNumButtons",{C_POINTER},C_INT),
xSDL_JoystickUpdate=define_c_proc(sdl,"SDL_JoystickUpdate",{}),
xSDL_JoystickGetAxis=define_c_func(sdl,"SDL_JoystickGetAxis",{C_POINTER,C_INT},C_INT),
xSDL_JoystickGetHat=define_c_func(sdl,"SDL_JoystickGetHat",{C_POINTER,C_INT},C_INT),
xSDL_JoystickGetButton=define_c_func(sdl,"SDL_JoystickGetButton",{C_POINTER,C_INT},C_INT),
xSDL_JoystickGetBall=define_c_func(sdl,"SDL_JoystickGetBall",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_INT),
xSDL_JoystickClose=define_c_proc(sdl,"SDL_JoystickClose",{C_POINTER})
              
-- SDL_NumJoysticks -- Count available joysticks.
global function SDL_NumJoysticks()
    return c_func(xSDL_NumJoysticks,{})
end function

-- SDL_JoystickName -- Get joystick name.
global function SDL_JoystickName(integer index)
    return c_func(xSDL_JoystickName,{index})
end function

-- SDL_JoystickOpen -- Opens a joystick for use.
global function SDL_JoystickOpen(integer index)
    return c_func(xSDL_JoystickOpen,{index})
end function

-- SDL_JoystickOpened -- Determine if a joystick has been opened
global function SDL_JoystickOpened(integer index)
    return c_func(xSDL_JoystickOpened,{index})
end function

-- SDL_JoystickIndex -- Get the index of an SDL_Joystick.
global function SDL_JoystickIndex(atom joystick)
    return c_func(xSDL_JoystickIndex,{joystick})
end function

-- SDL_JoystickNumAxes -- Get the number of joystick axes
global function SDL_JoystickNumAxes(atom joystick)
    return c_func(xSDL_JoystickNumAxes,{joystick})
end function

-- SDL_JoystickNumBalls -- Get the number of joystick trackballs
global function SDL_JoystickNumBalls(atom joystick)
    return c_func(xSDL_JoystickNumBalls,{joystick})
end function

-- SDL_JoystickNumHats -- Get the number of joystick hats
global function SDL_JoystickNumHats(atom joystick)
    return c_func(xSDL_JoystickNumHats,{joystick})
end function

-- SDL_JoystickNumButtons -- Get the number of joysitck buttons
global function SDL_JoystickNumButtons(atom joystick)
    return c_func(xSDL_JoystickNumButtons,{joystick})
end function

-- SDL_JoystickUpdate -- Updates the state of all joysticks
global procedure SDL_JoystickUpdate()
    c_proc(xSDL_JoystickUpdate,{})
end procedure

-- SDL_JoystickGetAxis -- Get the current state of an axis
global function SDL_JoystickGetAxis(atom joystick, atom axis)
    return c_func(xSDL_JoystickGetAxis,{joystick,axis})
end function

-- SDL_JoystickGetHat -- Get the current state of a joystick hat
global function SDL_JoystickGetHat(atom joystick, integer hat)
    return c_func(xSDL_JoystickGetHat,{joystick,hat})
end function

-- SDL_JoystickGetButton -- Get the current state of a given button on
-- a given joystick
global function SDL_JoystickGetButton(atom joystick, integer button)
    return c_func(xSDL_JoystickGetButton,{joystick,button})
end function

-- SDL_JoystickGetBall -- Get relative trackball motion
global function SDL_JoystickGetBall(atom joystick, integer ball, atom dx, atom dy)
    return c_func(xSDL_JoystickGetBall,{joystick,ball,dx,dy})
end function

-- SDL_JoystickClose -- Closes a previously opened joystick
global procedure SDL_JoystickClose(atom joystick)
    c_proc(xSDL_JoystickClose,{joystick})
end procedure

------------------------------------------------------------ 
-- Audio

constant
xSDL_OpenAudio=define_c_func(sdl,"SDL_OpenAudio",{C_POINTER,C_POINTER},C_INT),
xSDL_PauseAudio=define_c_proc(sdl,"SDL_PauseAudio",{C_INT}),
xSDL_GetAudioStatus=define_c_func(sdl,"SDL_GetAudioStatus",{},C_INT),
xSDL_LoadWAV_RW=define_c_func(sdl,"SDL_LoadWAV_RW",{C_POINTER,C_INT,C_POINTER,C_POINTER,C_POINTER},C_POINTER),
xSDL_FreeWAV=define_c_proc(sdl,"SDL_FreeWAV",{C_POINTER}),
xSDL_BuildAudioCVT=define_c_func(sdl,"SDL_BuildAudioCVT",{C_POINTER,C_UINT,C_UCHAR,C_INT,C_UINT,C_UCHAR,C_INT},C_INT),
xSDL_ConvertAudio=define_c_func(sdl,"SDL_ConvertAudio",{C_POINTER},C_INT),
xSDL_MixAudio=define_c_proc(sdl,"SDL_MixAudio",{C_POINTER,C_POINTER,C_UINT,C_INT}),
xSDL_LockAudio=define_c_proc(sdl,"SDL_LockAudio",{}),
xSDL_UnlockAudio=define_c_proc(sdl,"SDL_UnlockAudio",{}),
xSDL_CloseAudio=define_c_proc(sdl,"SDL_CloseAudio",{})

-- SDL_OpenAudio -- Opens the audio device with the desired parameters.
global function SDL_OpenAudio(atom desired, atom obtained)
    return c_func(xSDL_OpenAudio,{desired,obtained})
end function

-- SDL_PauseAudio -- Pauses and unpauses the audio callback processing
global procedure SDL_PauseAudio(integer pause_on)
    c_proc(xSDL_PauseAudio,{pause_on})
end procedure

-- SDL_GetAudioStatus -- Get the current audio state
global function SDL_GetAudioStatus()
    return c_func(xSDL_GetAudioStatus,{})
end function

-- SDL_LoadWAV_RW
global function SDL_LoadWAV_RW(atom src, integer freesrc, atom spec, atom audio_buf, atom audio_len)
    return c_func(xSDL_LoadWAV_RW,{src,freesrc,spec,audio_buf,audio_len})
end function

-- SDL_LoadWAV -- Load a WAVE file
global function SDL_LoadWAV(sequence fname,atom spec, atom audio_buf, atom audio_len )
    return SDL_LoadWAV_RW(SDL_RWFromFile(fname,"rb"),1,spec,audio_buf,audio_len)
end function

-- SDL_FreeWAV -- Frees previously opened WAV data
global procedure SDL_FreeWAV(atom audio_buff)
    c_proc(xSDL_FreeWAV,{audio_buff})
end procedure

-- SDL_BuildAudioCVT -- Initializes a SDL_AudioCVT structure for conversion
global function SDL_BuildAudioCVT(atom cvt, integer src_format, integer src_channels, integer src_rate, integer dst_format, integer dst_channels, integer dst_rate)
    return c_func(xSDL_BuildAudioCVT,{cvt,src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

-- SDL_ConvertAudio -- Convert audio data to a desired audio format.
global function SDL_ConvertAudio(atom cvt)
    return c_func(xSDL_ConvertAudio,{cvt})
end function

-- SDL_MixAudio -- Mix audio data
global procedure SDL_MixAudio(atom dst, atom src, atom len, integer volume)
    c_proc(xSDL_MixAudio,{dst,src,len,volume})
end procedure

-- SDL_LockAudio -- Lock out the callback function
global procedure SDL_LockAudio()
    c_proc(xSDL_LockAudio,{})
end procedure

-- SDL_UnlockAudio -- Unlock the callback function
global procedure SDL_UnlockAudio()
    c_proc(xSDL_UnlockAudio,{})
end procedure

-- SDL_CloseAudio -- Shuts down audio processing and closes the audio device.
global procedure SDL_CloseAudio()
    c_proc(xSDL_CloseAudio,{})
end procedure

------------------------------------------------------------ 
-- CD-ROM

constant
xSDL_CDNumDrives=define_c_func(sdl,"SDL_CDNumDrives",{},C_INT),
xSDL_CDName=define_c_func(sdl,"SDL_CDName",{C_INT},C_POINTER),
xSDL_CDOpen=define_c_func(sdl,"SDL_CDOpen",{C_INT},C_POINTER),
xSDL_CDStatus=define_c_func(sdl,"SDL_CDStatus",{C_POINTER},C_INT),
xSDL_CDPlay=define_c_func(sdl,"SDL_CDPlay",{C_POINTER,C_INT,C_INT},C_INT),
xSDL_CDPlayTracks=define_c_func(sdl,"SDL_CDPlayTracks",{C_POINTER,C_INT,C_INT,C_INT,C_INT},C_INT),
xSDL_CDPause=define_c_func(sdl,"SDL_CDPause",{C_POINTER},C_INT),
xSDL_CDResume=define_c_func(sdl,"SDL_CDResume",{C_POINTER},C_INT),
xSDL_CDStop=define_c_func(sdl,"SDL_CDStop",{C_POINTER},C_INT),
xSDL_CDEject=define_c_func(sdl,"SDL_CDEejct",{C_POINTER},C_INT),
xSDL_CDClose=define_c_proc(sdl,"SDL_CDClose",{C_INT})

-- SDL_CDNumDrives -- Returns the number ofCD-ROM drives on the system.
global function SDL_CDNumDrives()
    return c_func(xSDL_CDNumDrives,{})
end function

-- SDL_CDName -- Returns a human-readable, system-dependent identifier
-- for the CD-ROM.
global function SDL_CDName(integer drive)
    return c_func(xSDL_CDName,{drive})
end function

-- SDL_CDOpen -- Opens a CD-ROM drive for access
global function SDL_CDOpen(integer drive)
    return c_func(xSDL_CDOpen,{drive})
end function

-- SDL_CDStatus -- Returns the current status of the given drive.
global function SDL_CDStatus(atom cdrom)
    return c_func(xSDL_CDStatus,{cdrom})
end function

-- SDL_CDPlay -- Play a CD
global function SDL_CDPlay(atom cdrom, integer start, integer lengthz)
    return c_func(xSDL_CDPlay,{cdrom,start,lengthz})
end function

-- SDL_CDPlayTracks -- Play the given CD track(s)
global function SDL_CDPlayTracks(atom cdrom, integer start_track, integer frames, integer ntracks, integer nframes)
    return c_func(xSDL_CDPlayTracks,{cdrom,start_track,frames,ntracks,nframes})
end function

-- SDL_CDPause -- Pauses a CDROM
global function SDL_CDPause(atom cdrom)
    return c_func(xSDL_CDPause,{cdrom})
end function

-- SDL_CDResume -- Resumes a CDRMOM
global function SDL_CDResume(atom cdrom)
    return c_func(xSDL_CDResume,{cdrom})
end function

-- SDL_CDStop -- Stops a CDROM
global function SDL_CDStop(atom cdrom)
    return c_func(xSDL_CDStop,{cdrom})
end function

-- SD_CDEject -- Ejects a CDROM
global function SDL_CDEject(atom cdrom)
    return c_func(xSDL_CDEject,{cdrom})
end function

-- SDL_CDClose -- Closes a SDL_CD handle
global procedure SDL_CDClose(atom cdrom)
    c_proc(xSDL_CDClose,{cdrom})
end procedure

------------------------------------------------------------ 
-- Threads

constant
xSDL_CreateThread=define_c_func(sdl,"SDL_CreateThread",{C_POINTER,C_POINTER},C_POINTER),
xSDL_ThreadID=define_c_func(sdl,"SDL_ThreadID",{},C_INT),
xSDL_GetThreadID=define_c_func(sdl,"SDL_ThreadID",{C_POINTER},C_INT),
xSDL_WaitThread=define_c_proc(sdl,"SDL_WaitThread",{C_POINTER,C_INT}),
xSDL_KillThread=define_c_proc(sdl,"SDL_KillThread",{C_POINTER}),
xSDL_CreateMutex=define_c_func(sdl,"SDL_CreateMutex",{},C_POINTER),
xSDL_DestroyMutex=define_c_proc(sdl,"SDL_DestroyMutex",{C_POINTER}),
xSDL_mutexP=define_c_func(sdl,"SDL_mutexP",{C_POINTER},C_INT),
xSDL_mutexV=define_c_func(sdl,"SDL_mutexV",{C_POINTER},C_INT),
xSDL_CreateSemaphore=define_c_func(sdl,"SDL_CreateSemaphore",{C_UINT},C_POINTER),
xSDL_DestroySemaphore=define_c_proc(sdl,"SDL_DestroySemaphore",{C_POINTER}),
xSDL_SemWait=define_c_func(sdl,"SDL_SemWait",{C_POINTER},C_INT),
xSDL_SemTryWait=define_c_func(sdl,"SDL_SemTryWait",{C_POINTER},C_INT),
xSDL_SemWaitTimeout=define_c_func(sdl,"SDL_SemWaitTimeout",{C_POINTER,C_UINT},C_INT),
xSDL_SemPost=define_c_func(sdl,"SDL_SemPost",{C_POINTER},C_INT),
xSDL_SemValue=define_c_func(sdl,"SDL_SemValue",{C_POINTER},C_UINT),
xSDL_CreateCond=define_c_func(sdl,"SDL_CreateCond",{},C_POINTER),
xSDL_DestroyCond=define_c_proc(sdl,"SDL_DestroyCond",{C_POINTER}),
xSDL_CondSignal=define_c_func(sdl,"SDL_CondSignal",{C_POINTER},C_INT),
xSDL_CondBroadcast=define_c_func(sdl,"SDL_CondBroadcast",{C_POINTER},C_INT),
xSDL_CondWait=define_c_func(sdl,"SDL_CondWait",{C_POINTER,C_POINTER},C_INT),
xSDL_CondWaitTimeout=define_c_func(sdl,"SDL_CondWaitTimeout",{C_POINTER,C_POINTER,C_UINT},C_INT)

-- SDL_CreateThread -- Creates a new thread of execution that shares
-- its parent's properties.
global function SDL_CreateThread(atom fn, atom data)
    return c_func(xSDL_CreateThread,{fn,data})
end function

-- SDL_ThreadID -- Get the 32-bit thread identifier for the current thread.
global function SDL_ThreadID()
    return c_func(xSDL_ThreadID,{})
end function

-- SDL_GetThreadID -- Get the SDL thread ID of a SDL_Thread
global function SDL_GetThreadID(atom thread)
    return c_func(xSDL_GetThreadID,{thread})
end function

-- SDL_WaitThread -- Wait for a thread to finish.
global procedure SDL_WaitThread(atom thread, integer status)
    c_proc(xSDL_WaitThread,{thread,status})
end procedure

-- SDL_KillThread -- Gracelessly terminates the thread.
global procedure SDL_KillThread(atom thread)
    c_proc(xSDL_KillThread,{thread})
end procedure

-- Create a new, unlocked mutex.
global function SDL_CreateMutex()
    return c_func(xSDL_CreateMutex,{})
end function

-- SDL_DestroyMutex -- Destroy a mutex
global procedure SDL_DestroyMutex(atom mutex)
    c_proc(xSDL_DestroyMutex,{mutex})
end procedure

-- SDL_mutexP -- Lock a mutex
global function SDL_mutexP(atom mutex)
    return c_func(xSDL_mutexP,{mutex})
end function

-- SDL_mutexV -- Unlock a mutex
global function SDL_mutexV(atom mutex)
    return c_func(xSDL_mutexV,{mutex})
end function

-- SDL_CreateSemaphore -- Creates a new semaphore and assigns an initial
-- value to it.
global function SDL_CreateSemaphore(atom initial_value)
    return c_func(xSDL_CreateSemaphore,{initial_value})
end function

-- SDL_DestroySemaphore -- Destroys a semaphore that was created by
-- SDL_CreateSemaphore.
global procedure SDL_DestroySemaphore(atom sem)
    c_proc(xSDL_DestroySemaphore,{sem})
end procedure

-- SDL_SemWait -- Lock a semaphore and suspend the thread if the semaphore
-- value is zero
global function SDL_SemWait(atom sem)
    return c_func(xSDL_SemWait,{sem})
end function

-- SDL_SemTryWait -- Attempt to lock a semaphore but don't suspend the thread.
global function SDL_SemTryWait(atom sem)
    return c_func(xSDL_SemTryWait,{sem})
end function

-- SDL_SemWaitTimeout -- Lock a semaphore, but only wait up to a specified
-- maximum time.
global function SDL_SemWaitTimeout(atom sem, atom timeout)
    return c_func(xSDL_SemWaitTimeout,{sem,timeout})
end function

-- SDL_SemPost -- Unlock a semaphore.
global function SDL_SemPost(atom sem)
    return c_func(xSDL_SemPost,{sem})
end function

-- SDL_SemValue -- Return the current value of a semaphore.
global function SDL_SemValue(atom sem)
    return c_func(xSDL_SemValue,{sem})
end function

-- SDL_CreateCond -- Create a condition variable
global function SDL_CreateCond()
    return c_func(xSDL_CreateCond,{})
end function

-- SDL_DestroyCond -- Destroy a condition variable
global procedure SDL_DestroyCond(atom cond)
    c_proc(xSDL_DestroyCond,{cond})
end procedure

-- SDL_CondSignal -- Restart a thread wait on a condition variable
global function SDL_CondSignal(atom cond)
    return c_func(xSDL_CondSignal,{cond})
end function

-- SDL_CondBroadcast -- Restart all threads waiting on a condition variable
global function SDL_CondBroadcast(atom cond)
    return c_func(xSDL_CondBroadcast,{cond})
end function

-- SDL_CondWait -- Wait on a condition variable
global function SDL_CondWait(atom cond, atom mut)
    return c_func(xSDL_CondWait,{cond,mut})
end function

-- SDL_CondWaitTimeout -- Wait on a condition variable, with timeout
global function SDL_CondWaitTimeout(atom cond, atom mut, atom ms)
    return c_func(xSDL_CondWaitTimeout,{cond,mut,ms})
end function

------------------------------------------------------------ 
-- Timers

constant
xSDL_GetTicks=define_c_func(sdl,"SDL_GetTicks",{},C_INT),
xSDL_Delay=define_c_proc(sdl,"SDL_Delay",{C_UINT}),
xSDL_AddTimer=define_c_func(sdl,"SDL_AddTimer",{C_UINT,C_POINTER,C_POINTER},C_POINTER),
xSDL_RemoveTimer=define_c_func(sdl,"SDL_RemoveTimer",{C_POINTER},C_UCHAR),
xSDL_SetTimer=define_c_func(sdl,"SDL_SetTimer",{C_UINT,C_POINTER},C_INT)

-- SDL_GetTicks -- Get the number of milliseconds since the SDL
-- library initialization.
global function SDL_GetTicks()
    return c_func(xSDL_GetTicks,{})
end function

-- SDL_Delay -- Wait a specified number of milliseconds before returning.
global procedure SDL_Delay(atom ms)
    c_proc(xSDL_Delay,{ms})
end procedure

-- SDL_AddTimer -- Add a timer which will call a callback after the
-- specified number of milliseconds has elapsed
global function SDL_AddTimer(atom interval, atom callback, atom param)
    return c_func(xSDL_AddTimer,{interval, callback, param})
end function

-- SDL_RemoveTimer -- Remove a timer which was added with SDL_AddTimer.
global function SDL_RemoveTimer(atom timer)
    return c_func(xSDL_RemoveTimer,{timer})
end function

-- SDL_SetTimer -- Set a callback to run after the specified number of
-- milliseconds has elapsed.
global function SDL_SetTimer(atom interval, atom callback)
    return c_func(xSDL_SetTimer,{interval, callback})
end function

