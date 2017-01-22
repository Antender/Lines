include machine.e
include sdl_wrap.e
include game_engine.e
include std/os.e

/* Usefull definitions*/
global constant false=0
global constant true=1
/* Usefull definitions END*/ 

/* Supplemental variables */
atom event=allocate(16)
integer quit=false,x,y
/* Supplemental variable END*/

/* Main event loop */
new_game()
while quit=false do
	if SDL_PollEvent(event) then
		if peek(event)=SDL_MOUSEBUTTONUP then
			x=peek2s(event+4)
			y=peek2s(event+6)
			if (610<x) and (x<780) and (250<y) and (y<300) then
				new_game()
			elsif (607<x) and (x<786) and (310<y) and (y<360) then
				quit=true
			elsif (10<x) and (x<595) and (10<y) and (y<595) then
				board_click(x,y)
			end if
		end if
		
	else
		invert_selection()
		sleep(0.05)
	end if
end while
end_game()
/* Main event loop END*/