function[AA,BB] = alternate_grid(final)
length = size(final,1);

count_A = 1;
count_B = 1;
AA = zeros([],3);
BB = zeros([],3);
for i =1 :length
    if (mod(final(i,1),1)==0 && mod(final(i,2),1)==0) %% integer
         AA(count_A,:) = final(i,1:3);     %, final(i,2)];
        count_A = count_A + 1;
    else 
        BB(count_B,:) = final(i,1:3); %%even
        count_B = count_B + 1;
    end
end
end