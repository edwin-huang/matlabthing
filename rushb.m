%brick = Brick('ioType','wifi','wfAddr','127.0.0.1','wfPort',5555,'wfSN','0016533dbaf5')
%autonomously operates the robot vehicle
%does not generalize to all mazes (which i assume will be milestone 2)
display('P90 gogogo'); 

%while (1)
    move(brick, 1);
    turn(brick, 1);
    move(brick, 1);
    turn(brick, 1);
    move(brick, 1);
    move(brick, 1);
    brick.MoveMotor('C', 100);
    pause(5);
    %brick.MoveMotor('C', -100);
    %pause(5);
    brick.MoveMotor('C', 0);
    turn(brick, -1);
    turn(brick, -1);
    move(brick, 1);
    move(brick, 1);
    turn(brick, -1);
    move(brick, 1);
    move(brick, 1);
    turn(brick, -1);
    move(brick, 1);
    move(brick, 1);
    turn(brick, -1);
    move(brick, 1);
    %move(brick, 1);
    %move(brick, -1);
%end
