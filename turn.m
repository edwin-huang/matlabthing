function turn(brick, sign)
    brick.MoveMotor('A', -20 * sign);
    brick.MoveMotor('B', 20 * sign);
    pause(1.4);
    brick.MoveMotor('A', 0);
    brick.MoveMotor('B', 0);
    pause(1.6);
end