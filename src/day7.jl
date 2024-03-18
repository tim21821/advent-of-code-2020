using DataStructures

"""
Get the number of children of `bag` according to its `children`.
"""
function getnumberofchildren(
    bag::AbstractString,
    children::Dict{String,Vector{Tuple{String,Int}}},
)
    if !(bag in keys(children))
        return 1
    end

    num = 1
    for (child, count) in children[bag]
        num += count * getnumberofchildren(child, children)
    end
    return num
end

function part1()
    lines = open("input/day7.txt") do f
        return readlines(f)
    end

    parentbags = Dict{String,Vector{String}}()
    for line in lines
        if occursin("no other bags", line)
            continue
        end

        parent, children_str = split(line, " bags contain ")
        children = split(children_str, ", ")
        for child in children
            _, child = split(child, limit = 2)
            child, _ = rsplit(child, limit = 2)
            if child in keys(parentbags)
                push!(parentbags[child], parent)
            else
                parentbags[child] = [parent]
            end
        end
    end

    queue = Queue{String}()
    enqueue!(queue, "shiny gold")
    containingbags = Set{String}()
    while !isempty(queue)
        bag = dequeue!(queue)
        push!(containingbags, bag)
        for nextbag in get(parentbags, bag, [])
            if !(nextbag in containingbags)
                enqueue!(queue, nextbag)
            end
        end
    end
    return length(containingbags) - 1
end

function part2()
    lines = open("input/day7.txt") do f
        return readlines(f)
    end

    childrenbags = Dict{String,Vector{Tuple{String,Int}}}()
    for line in lines
        if occursin("no other bags", line)
            continue
        end

        parent, children_str = split(line, " bags contain ")
        children = split(children_str, ", ")
        childcount = Vector{Tuple{String,Int}}()
        for child in children
            count, child = split(child, limit = 2)
            child, _ = rsplit(child, limit = 2)
            push!(childcount, (child, parse(Int, count)))
        end
        childrenbags[parent] = childcount
    end

    return getnumberofchildren("shiny gold", childrenbags) - 1
end
