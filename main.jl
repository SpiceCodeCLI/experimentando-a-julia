


function count_total_lines(filename)
    count = 0
    for _ in eachline(filename)
        count += 1
    end
    return count
end

function get_file_type(filename)

    # pegar a exntesao do arquivo
    ext = splitext(filename)[2]

    # jump table pq nao tem switch em julia (o que e muito bom ninguem mais usa switch case em 2024 por isso julia e tao legal vamos usar julia)
    table = Dict(
        ".c" => "C",
        ".js" => "JavaScript",
        ".java" => "Java",
        ".jl" => "Julia",
        ".py" => "Python"
    )

    return get(table, ext, "Other")
end



# bota o nome do arquivo aqui | file name goes here
filename = "code-to-analyze/matrix.c"

lines = count_total_lines(filename)
fileType = get_file_type(filename)

println("Program language: ", fileType)
println("Total lines: ", lines)









## DAQUI PRA BAIXO NAO GARANTO QUE NADA FUNCIONE ISSO E PRO FUTURO QUANDO EU DESCOBRIR COMO MEXER NA JULIA


# function count_total_lines(filename)
#     count = 0
#     for _ in eachline(filename)
#         count += 1
#     end
#     return count
# end

# function get_file_type(filename)

#     # pegar a exntesao do arquivo
#     ext = splitext(filename)[2]

#     # jump table pq nao tem switch em julia (o que e muito bom ninguem mais usa switch case em 2024 por isso julia e tao legal vamos usar julia)
#     table = Dict(
#         ".c" => "C",
#         ".js" => "JavaScript",
#         ".java" => "Java",
#         ".jl" => "Julia",
#         ".py" => "Python"
#     )

#     return get(table, ext, "Other")
# end



# # bota o nome do arquivo aqui | file name goes here
# filename = "code-to-analyze/matrix.c"

# lines = count_total_lines(filename)
# fileType = get_file_type(filename)

# println("Program language: ", fileType)
# println("Total lines: ", lines)
