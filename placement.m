function [GG] =placement(integer)
min_final = min(integer(:,3));
max_final = max(integer(:,3));
range_val = range(integer(:,3));
integer(:,4) = ((integer(:,3)-min_final)./(max_final-min_final))*255;
final_grid = [];
final_grid = (integer(:,1:2)*2)-1;
final_grid(:,3) = integer(:,4);
 
 GG = zeros(256);
 for mm = 1:562500
    GG(final_grid(mm,1),final_grid(mm,2)) = final_grid(mm,3);
 end