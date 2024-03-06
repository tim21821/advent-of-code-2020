function part1()
    lines = open("input/day2.txt") do f
        return readlines(f)
    end

    validpasswords = 0
    for line in lines
        policy, password = split(line, ": ")
        range, letter = split(policy, ' ')
        left, right = parse.(Int, split(range, '-'))
        if left <= count(c -> c == only(letter), password) <= right
            validpasswords += 1
        end
    end
    return validpasswords
end

function part2()
    lines = open("input/day2.txt") do f
        return readlines(f)
    end

    validpasswords = 0
    for line in lines
        policy, password = split(line, ": ")
        positions, letter = split(policy, ' ')
        left, right = parse.(Int, split(positions, '-'))
        if (password[left] == only(letter) && password[right] != only(letter)) ||
           (password[left] != only(letter) && password[right] == only(letter))
            validpasswords += 1
        end
    end
    return validpasswords
end
