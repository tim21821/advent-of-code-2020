function part1()
    lines = open("input/day6.txt") do f
        return readlines(f)
    end

    countsum = 0
    current = zero(UInt32)
    for line in lines
        if line == ""
            countsum += count_ones(current)
            current = zero(UInt32)
        else
            for c in line
                current = current | one(UInt32) << (Int(c) - 97)
            end
        end
    end
    countsum += count_ones(current)
    return countsum
end

function part2()
    lines = open("input/day6.txt") do f
        return readlines(f)
    end

    countsum = 0
    current = 0b11111111111111111111111111 # 26 1's
    for line in lines
        if line == ""
            countsum += count_ones(current)
            current = 0b11111111111111111111111111 # 26 1's
        else
            thisline = zero(UInt32)
            for c in line
                thisline = thisline | one(UInt32) << (Int(c) - 97)
            end
            current = current & thisline
        end
    end
    countsum += count_ones(current)

    return countsum
end
