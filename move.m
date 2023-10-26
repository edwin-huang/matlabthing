function move(brick, sign)
    brick.MoveMotor('AB', 100 * sign);
    pause(1.6);
    brick.MoveMotor('A', 0);
    brick.MoveMotor('B', 0);
    pause(1.4);
end