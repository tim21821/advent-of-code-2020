function part1()
    lines = open("input/day9.txt") do f
        return readlines(f)
    end

    numbers = parse.(Int, lines)
    for i in 26:length(numbers)
        target = numbers[i]
        if !any(e -> target - e in numbers[i-25:i-1], numbers[i-25:i-1])
            return target
        end
    end
end

function part2()
    invalidnumber = part1()

    lines = open("input/day9.txt") do f
        return readlines(f)
    end

    numbers = parse.(Int, lines)
    for i in eachindex(numbers)
        summands = Vector{Int}()
        j = 0
        while sum(summands) < invalidnumber
            push!(summands, numbers[i+j])
            if sum(summands) == invalidnumber
                return minimum(summands) + maximum(summands)
            end
            j += 1
        end
    end
end
