# Function counter for the C language

function count_functions_in_c(filename)
    file = open(filename, "r")
    func_pattern = r"^\s*(\w+[\s\*]+)+(\w+)\s*\([^\)]*\)\s*\{?"
    function_count = 0

    for line in eachline(file)
        if match(func_pattern, line) !== nothing
            function_count += 1
        end
    end

    close(file)
    return function_count
end
