# Function counter for the Python language

function count_functions_in_python(filename)
    file = open(filename, "r")
    func_pattern = r"^\s*def\s+(\w+)\s*\([^\)]*\):"
    function_count = 0

    for line in eachline(file)
        if match(func_pattern, line) !== nothing
            function_count += 1
        end
    end

    close(file)
    return function_count
end
