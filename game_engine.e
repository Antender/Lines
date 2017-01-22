include std/sequence.e
include std/math.e
include drawing.e

/* Game state */
enum x_c,y_c,color_c
constant empty=8
constant num_rand_balls=3
integer difficulty=7
integer free_cells=0
sequence game_board
sequence next_balls
sequence ball
integer  ball_inverted
integer  score
/* Game state END*/

/* Init/deinit */
export procedure new_game ()
	main_screen()
	game_board=repeat(repeat(empty,9),9)
	free_cells=81
	next_balls=random_balls(3)
	ball={false,false,empty}
	ball_inverted=false
	score=0
	update_board()
end procedure

export procedure end_game ()
	drawing_free()
end procedure
/* Init/deinit END*/

/* Input interpreting */
export procedure board_click(integer x_pos,integer y_pos)
	if free_cells>0 then
		x_pos=trunc((x_pos-10)/65)+1
		y_pos=trunc((y_pos-10)/65)+1
		if equal(ball,{false,false,empty}) then
			if game_board[x_pos][y_pos]!=empty then
				ball={x_pos,y_pos,game_board[x_pos][y_pos]}
			end if
		elsif equal(ball,{x_pos,y_pos,game_board[x_pos][y_pos]}) then
			insert_ball(ball[x_c],ball[y_c],ball[color_c])
			ball={false,false,empty}
			update_screen()
		elsif game_board[x_pos][y_pos]=empty then
			insert_ball(ball[x_c],ball[y_c],empty)
			insert_ball(x_pos,y_pos,ball[color_c])
			game_board[ball[x_c]][ball[y_c]]=empty
			game_board[x_pos][y_pos]=ball[color_c]
			ball={false,false,empty}
			if check_lines(x_pos,y_pos,game_board[x_pos][y_pos]) then
				update_board()
			end if
		else
			insert_ball(ball[x_c],ball[y_c],game_board[ball[x_c]][ball[y_c]])
			ball={x_pos,y_pos,game_board[x_pos][y_pos]}
		end if
	else
		game_over()
	end if
end procedure
/* Input interpreting END*/

/* Board-related algorithms*/	
/*function check_path()
end function*/

function check_lines(integer x,integer y,integer color)
	integer result=line_bigger_5(append(check_half_line(x-1,y-1,-1,-1,color) & check_half_line(x+1,y+1,1,1,color),{x,y}))
	result=line_bigger_5(append(check_half_line(x+1,y-1,1,-1,color) & check_half_line(x-1,y+1,-1,1,color),{x,y}))
	result=line_bigger_5(append(check_half_line(x,y-1,0,-1,color) & check_half_line(x,y+1,0,1,color),{x,y}))
	result=line_bigger_5(append(check_half_line(x-1,y,-1,0,color) & check_half_line(x+1,y,1,0,color),{x,y}))
	insert_score(score)
	update_screen()
	return result
end function

function check_half_line(integer x_pos,integer y_pos,integer x_diff,integer y_diff,integer color)
	sequence line={}
	if (1<=x_pos) and (x_pos<=9) and (1<=y_pos) and (y_pos<=9) then 
		while game_board[x_pos][y_pos]=color do
			line=append(line,{x_pos,y_pos})
			x_pos+=x_diff
			y_pos+=y_diff
			if (x_pos<1) or (9<x_pos) or (y_pos<1) or (9<y_pos) then
				exit
			end if
		end while
	end if
	return line
end function

function line_bigger_5(sequence line)
	if length(line)>=5 then
		for i=1 to length(line) do
			game_board[line[i][x_c]][line[i][y_c]]=empty
			insert_ball(line[i][x_c],line[i][y_c],empty)
			free_cells+=1
			score+=1
		end for
		return false
	else
		return true
	end if
end function

function random_balls(integer count)
	return rand(repeat(difficulty,count))
end function

procedure random_position(integer counter)
	integer pos=rand(81)-1
	integer found=false
	integer x_pos,y_pos
	while found=false do
		x_pos=remainder(pos,9)+1
		y_pos=trunc(pos/9)+1
		if game_board[x_pos][y_pos]=empty then
			found=true
		else
			if pos=80 then
				pos=0
			else
				pos+=1
			end if
		end if
	end while
	free_cells-=1
	game_board[x_pos][y_pos]=next_balls[counter]
	insert_ball(x_pos,y_pos,next_balls[counter])
	check_lines(x_pos,y_pos,next_balls[counter])
end procedure

procedure update_board()
	for i=1 to num_rand_balls do
		if free_cells>0 then
			random_position(i)
		end if
	end for
	next_balls=random_balls(num_rand_balls)
	for i=1 to num_rand_balls do
		insert_next_ball(i,next_balls[i])
	end for
	insert_score(score)
	update_screen()
end procedure
/* Board-related algorithms*/

/* Visual effects */
export procedure invert_selection()
	if not (equal(ball,{false,false,empty})) then
		if ball_inverted=false then
			ball_inverted=true
			insert_ball(ball[x_c],ball[y_c],empty)
			update_screen()
		else
			ball_inverted=false
			insert_ball(ball[x_c],ball[y_c],ball[color_c])
			update_screen()
		end if
	end if
end procedure
/* Visual effects END*/