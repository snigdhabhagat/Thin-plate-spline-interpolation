function [K,P,control_points,ctrl_val] = computeK(ctrl_pts,m,mask_location,P,image)
if (m>=6)
    for (i=1:m)
        for(j=1:m)
            K(i,j)=  computelog(pdist2(ctrl_pts(i,:),ctrl_pts(j,:)));
            P=P;
            control_points=ctrl_pts;
            
        end
    end
else
    
    ctrl_pts_1=[pickrandpoints(mask_location); ctrl_pts];
    ctrl_pts_complex = ctrl_pts_1(:,1)+1i*ctrl_pts_1(:,2);
    ctrl_pts_complex_unique = unique(ctrl_pts_complex);
    ctrl_pts_2 = [real(ctrl_pts_complex_unique) imag(ctrl_pts_complex_unique)];
    [m1,n1]=size(ctrl_pts_2);
    for (i=1:m1)
        for(j=1:m1)
            K(i,j)=  computelog(pdist2(ctrl_pts_2(i,:),ctrl_pts_2(j,:)));
            P = [ones(m1,1) ctrl_pts_2];
            control_points = ctrl_pts_2;
            
            
        end
    end
    
end
ctrl_mat = image(control_points(:,1),control_points(:,2));
ctrl_val=diag(ctrl_mat);
end


