


function count_lines(filename)
    count = 0
    for _ in eachline(filename)
        count += 1
    end
    return count
end

# bota o nome do arquivo aqui | file name goes here
lines = count_lines("code-to-analyze/matrix.c")

println("Total lines: ", lines)
