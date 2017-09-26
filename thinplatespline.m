%% Thin plate spline
function [new_location]=thinplatespline(ctrl_pts,mask_location,new_location,image)

[m,n] = size(ctrl_pts);
P = [ones(m,1) ctrl_pts];
[K,P,control_points,ctrl_val] = computeK(ctrl_pts,m,mask_location,P,image);
clear i j;
[t,u] = size(control_points);
L = [K P;P.' zeros(3,3)];
det(L);
zero_pad = size(L);
p=zero_pad(1)-t;
Y = [ctrl_val;zeros(p,1)] ;
X = linsolve(L,Y);
length = size(new_location,1);
for f_off = 1:length
    temp = single(new_location(f_off,:));
    a=temp(1);
    b=temp(2);
    generated_patch=[a b];
    out = 0;
    for(i=1:t)
        temp = pdist2(control_points(i,:),generated_patch);
        X_2 = X(i)*computelog(temp);
        out = out+X_2;
    end
    X_1 = X(t+1) + X(t+2)*a +X(t+3)*b;
    new_location(f_off,3)=X_1 +out;
end

end     %%%% Computes Z
