clear all;
close all;
clc;

image=im2double(rgb2gray(imread('bad_monkey.jpg')));   %% Read the image
image =imresize(image,[128 128]);                      %% Resize the image
[img_x,img_y]=size(image);                             %% Extract the size of the image 

threshold = 10^-7;                                     %% Small threshold => More corners  
corners = detectHarrisFeatures(image,'MinQuality',threshold);   %% Detect interest points using harris corner detector
imshow(image); hold on;                                %% Display the image
plot(corners.selectStrongest(4000));                   %% Plot the corners on the image

points = corners.Location;                             %% Location of the corners                          
patch_sz = 3;                                          %% patch size for functionalization 
count = 1;                                             %% counter for patch number    

integer=[];                                             

for i=1:((patch_sz-1)/2):(img_x-patch_sz)
    for j=1:((patch_sz-1)/2):(img_y-patch_sz)

        [mask,mask_location] = patch_extract(patch_sz,img_x,img_y,i,j,count);   %% function to create a mask at patch location and return indices
        [corners_in_patch] = patch_generator(mask,points);  %% function to extract the corners within the patch
        [new_location] = newmask_location(mask_location); %% fucntion to generate a mapping of patch indices on HR-grid with interpolation factor-2   
        temp = thinplatespline(corners_in_patch,mask_location,new_location,image); %% function to generate functional values on the HR-grid 
        integer = [integer; temp]; %% concatenation of new-indices and functional values for all the patches.
        count = count+1 
        
    end
end

%% placing the points on the HR grid

final_grid = placement(integer);
gray_final_grid = mat2gray(final_grid);
imshowpair(gray_final_grid,image,'montage');


