function[value]=computelog(r)
if (r~=0)
value = (r^2)*log10(r);
else 
    value=0;
end
end
