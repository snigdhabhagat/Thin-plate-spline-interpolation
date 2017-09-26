  function [corner_in_patch_final] = patch_generator(I,points)

        [row,col]= find(I);
        
        row_min = min(row);
        row_max = max(row);
        col_min = min(col);
        col_max = max(col);
        
        xv = [row_min row_max row_min row_max];
        yv = [col_min col_min col_max col_max];
        xq = round(points(:,1));
        yq = round(points(:,2));
        [in,on] = inpolygon(xq,yq,xv,yv);
        patch_points_in=find(in);
        patch_points_on=find(on);
        corner_in_patch = [round(points(patch_points_in,:));round(points(patch_points_on,:))];
        corners_complex = corner_in_patch(:,1)+1i*corner_in_patch(:,2);
        corner_complex_patch = unique(corners_complex);
        corner_in_patch_final = [real(corner_complex_patch) imag(corner_complex_patch)];
    end
 

