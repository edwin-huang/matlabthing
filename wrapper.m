function wrapper(brick)
    desiredAng = 90*round(brick.inputReadSI(2, 0)/90);
    state = 1;
    while (state ~= 4)
        if brick.inputReadSI(4, 0) > 50
            turn(-1);
            move(1);
            if state == 2
                brick.MoveMotor('C', 100);
                pause(5);
                brick.MoveMotor('C', 0);
                state = 3;
            end
        else
            turn(1);
        end
    end
    function correct()
        while abs(brick.inputReadSI(2, 0) - desiredAng) > 0
            dir = sign(brick.inputReadSI(2, 0) - desiredAng);
            brick.MoveMotor('A', 5 * dir);
            brick.MoveMotor('B', -5 * dir);
            while abs(brick.inputReadSI(2, 0) - desiredAng) > 0
                pause(0.1);
            end
            brick.MoveMotor('A', 0);
            brick.MoveMotor('B', 0);
            pause(1);
        end
    end
    function turn(dir)
        desiredAng = desiredAng + 90 * dir;
        brick.MoveMotor('A', -20 * dir);
        brick.MoveMotor('B', 20 * dir);
        pause(1.4);
        brick.MoveMotor('A', 0);
        brick.MoveMotor('B', 0);
        pause(1.1);
    end
    function move(sign)
        correct();
        brick.MoveMotor('AB', 100 * sign);
        for i=1:13
            data = brick.inputReadRaw(3, Device.ColRGB, 3);
            redColor = typecast(uint8(data(6:9)),'uint32');
            if(state == 1 && redColor == 255)
                state = 2;
            end
             if(state == 3 && redColor == 0)
                state = 4;
             end
            pause(0.1);
        end
        brick.MoveMotor('A', 0);
        brick.MoveMotor('B', 0);
        pause(0.9);
        correct();
    end
end
