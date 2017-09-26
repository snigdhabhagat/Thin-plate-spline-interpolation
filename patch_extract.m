function [mask,mask_location]= patch_extract(patch_sz,img_x,img_y,i,j,count)
Image.(sprintf('patch_%d',count)).value= zeros(img_x,img_y);
Image.(sprintf('patch_%d',count)).location = zeros(patch_sz*2,2);
N=1;
for a=i:i+(patch_sz-1)
    for b=j:j+(patch_sz-1)
        Image.(sprintf('patch_%d',count)).value(a,b) = 1 ;
        Image.(sprintf('patch_%d',count)).location(N,:) = [a,b];
        %patch_disp = I.*im2double(image);
        N=N+1;
    end
end
mask = Image.(sprintf('patch_%d',count)).value;
mask_location= Image.(sprintf('patch_%d',count)).location;
end

