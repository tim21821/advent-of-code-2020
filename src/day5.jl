"""
Return a (`row`, `column`) tuple representing the seat from `str`.
"""
function getseat(str::AbstractString)
    row = 0
    for i in 1:7
        if str[i] == 'B'
            row += 2^(7 - i)
        end
    end
    column = 0
    for i in 8:10
        if str[i] == 'R'
            column += 2^(10 - i)
        end
    end
    return row, column
end

function part1()
    lines = open("input/day5.txt") do f
        return readlines(f)
    end

    seats = getseat.(lines)
    return maximum(e -> e[1] * 8 + e[2], seats)
end

function part2()
    lines = open("input/day5.txt") do f
        return readlines(f)
    end

    seats = getseat.(lines)
    ids = [seat[1] * 8 + seat[2] for seat in seats]
    sort!(ids)
    for (i, id) in enumerate(ids)
        if ids[i+1] != id + 1
            return id + 1
        end
    end
end
