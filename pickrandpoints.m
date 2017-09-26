function [bar] = pickrandpoints(foo)
index = randsample(1:length(foo), 9);
bar = foo(index,:);

end


