function part1()
    lines = open("input/day8.txt") do f
        return readlines(f)
    end

    visited = Set{Int}()
    index = 1
    accumulator = 0
    while !(index in visited)
        line = lines[index]
        push!(visited, index)
        if startswith(line, "nop")
            index += 1
        elseif startswith(line, "jmp")
            _, jump = split(line)
            index += parse(Int, jump)
        else
            _, acc = split(line)
            accumulator += parse(Int, acc)
            index += 1
        end
    end
    return accumulator
end

function part2()
    lines = open("input/day8.txt") do f
        return readlines(f)
    end

    for i in eachindex(lines)
        if startswith(lines[i], "acc")
            continue
        end
        modifiedlines = copy(lines)
        command, val = split(lines[i])
        if command == "nop"
            modifiedlines[i] = "jmp $val"
        else
            modifiedlines[i] = "nop $val"
        end

        visited = Set{Int}()
        index = 1
        accumulator = 0
        while !(index in visited)
            if index > length(lines)
                return accumulator
            end

            line = modifiedlines[index]
            push!(visited, index)
            if startswith(line, "nop")
                index += 1
            elseif startswith(line, "jmp")
                _, jump = split(line)
                index += parse(Int, jump)
            else
                _, acc = split(line)
                accumulator += parse(Int, acc)
                index += 1
            end
        end
    end
end
