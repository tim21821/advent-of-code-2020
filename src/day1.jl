function part1()
    lines = open("input/day1.txt") do f
        return readlines(f)
    end

    expenses = parse.(Int, lines)
    for expense in expenses
        difference = 2020 - expense
        if difference in expenses
            return expense * difference
        end
    end
end

function part2()
    lines = open("input/day1.txt") do f
        return readlines(f)
    end

    expenses = parse.(Int, lines)
    for expense1 in expenses
        difference1 = 2020 - expense1
        for expense2 in expenses
            difference2 = difference1 - expense2
            if difference2 in expenses
                return expense1 * expense2 * difference2
            end
        end
    end
end
