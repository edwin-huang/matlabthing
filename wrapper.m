function wrapper(brick)
    desiredang = 90*round(brick.inputReadSI(2, 0)/90);
    state = 0;
    display('P90 gogogo');
    while (1)
        display(brick.inputReadSI(4, 0));
        if brick.inputReadSI(4, 0) > 50
            turn(-1);
            move(1);
        else
            turn(1);
        end
    end
    function correct()
        while abs(brick.inputReadSI(2, 0) - desiredang) > 0
            dir = sign(brick.inputReadSI(2, 0) - desiredang);
            brick.MoveMotor('A', 5 * dir);
            brick.MoveMotor('B', -5 * dir);
            while abs(brick.inputReadSI(2, 0) - desiredang) > 0
                pause(0.1);
            end
            brick.MoveMotor('A', 0);
            brick.MoveMotor('B', 0);
            pause(1);
        end
    end
    function turn(dir)
        desiredang = desiredang + 90 * dir;
        brick.MoveMotor('A', -20 * dir);
        brick.MoveMotor('B', 20 * dir);
        pause(1.4);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('B', 0);
        pause(1.6);
        correct();
    end
    function move(sign)
        brick.MoveMotor('AB', 100 * sign);
        pause(1.6);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('B', 0);
        pause(1.4);
        correct();
    end
end