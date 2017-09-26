 function [points] =newmask_location(mask_location)
row_min = min(mask_location(:,1));
row_max = max(mask_location(:,1));
col_min = min(mask_location(:,2));
col_max = max(mask_location(:,2));
[x,y] = meshgrid(row_min:0.5:row_max+0.5,col_min:0.5:col_max+0.5);
length=size(x,2);
%  for count = 1:length*length
count=1;
for (a=1:length)
    for (b=1:length)
        % clear points
        points(count,1) = x(a,b);
        points(count,2) = y(a,b);
        count=count+1;
    end
end
 end

% final=[];
% for(i=1:size(mask_location,1))
%     [new_temp_location]=corresponding(mask_location(i,:));
%     final = [final ; new_temp_location];
%