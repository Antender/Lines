include machine.e
include sdl_wrap.e
include std/math.e

export enum yellow=1,red,green,blue,dark_blue,violet,brown,empty

/* Graphical resources */
atom background_image=SDL_LoadBMP("resources/background.bmp")
atom balls_image=SDL_LoadBMP("resources/balls.bmp")
atom numbers_image=SDL_LoadBMP("resources/numbers.bmp")
atom gameover_image=SDL_LoadBMP("resources/gameover.bmp")

sequence balls={}
for i=1 to 8 do
	balls=append(balls,allocate(8))
	poke2(balls[i],(i-1)*60)
	poke(balls[i]+2,{0,0,60,0,60,0})
end for

sequence numbers={}
for i=1 to 11 do
	numbers=append(numbers,allocate(8))
	poke2(numbers[i],(i-1)*45)
	poke(numbers[i]+2,{0,0,45,0,60,0})
end for

sequence cells={}
for i=1 to 9 do
	cells=append(cells,{})
	for j=1 to 9 do
		cells[i]=append(cells[i],allocate(8))
		poke2(cells[i][j]  ,11+(i-1)*65)
		poke2(cells[i][j]+2,11+(j-1)*65)
		poke(cells[i][j]+4,{60,0,60,0})
	end for
end for

sequence next_cells={}
for i=1 to 3 do
	next_cells=append(next_cells,allocate(8))
	poke2(next_cells[i],(i-1)*65+606)
	poke(next_cells[i]+2,{164,0,60,0,60,0})
end for

sequence scoreboard={}
for i=1 to 4 do
	scoreboard=append(scoreboard,allocate(8))
	poke2(scoreboard[i],795-i*45)
	poke(scoreboard[i]+2,{35,0,60,0,60,0})
end for

atom gameover=allocate(8)
poke(gameover,{138,0,138,0,114,1,128,0})
/* Graphical resources END*/
	
/* Initializing video subsystem */
SDL_Init(SDL_INIT_VIDEO)
atom main_surface = SDL_SetVideoMode(800,600,32,SDL_FULLSCREEN)
/* Initializing video subsystem END*/

/* Placing balls */
export procedure insert_ball(integer x,integer y,integer color)
	SDL_BlitSurface(balls_image,balls[color],main_surface,cells[x][y])
end procedure

export procedure insert_next_ball(integer number,integer color)
	SDL_BlitSurface(balls_image,balls[color],main_surface,next_cells[number])
end procedure
/* Placing balls END*/

/* Placing score */
export procedure insert_score(integer score)
	sequence score_numbers={}
	while score>=10 do
		score_numbers=append(score_numbers,remainder(score,10))
		score=trunc(score/10)
	end while
	score_numbers=append(score_numbers,score)
	for i=1 to length(score_numbers) do
		SDL_BlitSurface(numbers_image,numbers[11],main_surface,scoreboard[i])
		SDL_BlitSurface(numbers_image,numbers[score_numbers[i]+1],main_surface,scoreboard[i])
	end for
end procedure
/* Placing score END*/

/* Shortcuts */
export procedure main_screen()
	SDL_BlitSurface(background_image,NULL,main_surface,NULL)
end procedure

export procedure update_screen()
	SDL_Flip(main_surface)
end procedure

export procedure game_over()
	SDL_BlitSurface(gameover_image,NULL,main_surface,gameover)
	SDL_Flip(main_surface)
end procedure

export procedure drawing_free()
	SDL_FreeSurface(main_surface)
	SDL_Quit()
end procedure
/* Shortcuts END*/