
# essa funcao conta o total de linhas do codigo
function count_total_lines(filename)
    count = 0
    for _ in eachline(filename)
        count += 1
    end
    return count
end


# essa funcao vai detectar o tipo do arquivo (a linguagem de programacao)
function get_file_type(filename)

    # pegar a exntesao do arquivo
    ext = splitext(filename)[2]

    # jump table pq nao tem switch em julia (o que e muito bom ninguem mais usa switch case em 2024 por isso julia e tao legal vamos usar julia)
    table = Dict(
        ".c" => "c",
        ".js" => "javascript",
        ".java" => "java",
        ".jl" => "julia",
        ".py" => "python"
    )

    # se for alguma outra coisa lingua estranha sei la as vezes o cara meteu um .javs sem querer ou um .pi ai a gente retorna 3.14 KKKKKKKKKKKKKKKK 
    return get(table, ext, "Other")
end

# Map file types to their respective counting functions
const function_counter_map = Dict(
    "c" => count_functions_in_c,
    "javascript" => count_functions_in_javascript,
    "python" => count_functions_in_python
)


# essa funcao vai contar quantas funcoes o arquivo tem, mas ela e baseada na linguagem, entao ela chama um arquivo separado dependendo da linguagem
function function_counter(filename)

    fileType = get_file_type(filename)

    if fileType != "Other"

        
        include("function-counters/$(fileType).jl")
        counter_function = function_counter_map[fileType]
        return counter_function(filename)

    else

        println("No function counter available for this file type: ", fileType)  # Não encontrou o tipo de linguagem
        return 0  # retorna 0 se não encontrar um contador de funções

    end

end



# bota o nome do arquivo aqui | file name goes here
filename = "code-to-analyze/matrix.c"

lines = count_total_lines(filename)
fileType = get_file_type(filename)
functions = function_counter(filename)

println("Program language: ", fileType)
println("Total lines: ", lines)
println("Total functions: ", functions)