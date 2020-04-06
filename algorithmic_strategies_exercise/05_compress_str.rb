# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)

    # [[a, 1], [b, 2]]

    str.chars.each_with_object([]) { |char, acc| acc[-1] && acc[-1][0] == char ? acc[-1][1] += 1 : acc << [char, 1] }
       .map { |char, count| count > 1 ? "#{count}#{char}" : char }
       .join

    # result = ""

    # i = 0
    # while i < str.length
    #     char = str[i]
    #     count = 0
    #     while str[i] == char
    #         count += 1
    #         i += 1
    #     end
    #     if count > 1
    #         result += "#{count}#{char}"
    #     else
    #         result += char
    #     end
    # end

    # result
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
