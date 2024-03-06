"""
Return the number of trees that will by passed when traversing the `grid` using the
`slope`.
"""
function counttrees(grid::Matrix{Char}, slope::CartesianIndex{2})
    currentposition = CartesianIndex(1, 1)
    totaltrees = 0
    while currentposition[1] <= size(grid, 1)
        if currentposition[2] > size(grid, 2)
            currentposition -= CartesianIndex(0, size(grid, 2))
        end
        if grid[currentposition] == '#'
            totaltrees += 1
        end
        currentposition += slope
    end
    return totaltrees
end

function part1()
    lines = open("input/day3.txt") do f
        return readlines(f)
    end

    grid = stack(collect.(lines); dims = 1)
    return counttrees(grid, CartesianIndex(1, 3))
end

function part2()
    lines = open("input/day3.txt") do f
        return readlines(f)
    end

    grid = stack(collect.(lines); dims = 1)
    return prod(
        e -> counttrees(grid, e),
        [
            CartesianIndex(1, 1),
            CartesianIndex(1, 3),
            CartesianIndex(1, 5),
            CartesianIndex(1, 7),
            CartesianIndex(2, 1),
        ],
    )
end
