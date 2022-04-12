function new_array = convertCharToCell(Chars)
%a = Chars
new_array = {};
[n, m] = size(Chars);
for i = 1:1:n
    new_array{i} = Chars(i,:);
end

end