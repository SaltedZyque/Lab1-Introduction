function [Out] = clown_rotate(In, Theta)
    % Width and Height of Source Image
    [width,height] =  size(In);

    % preallocate an empty output (for compute speed)
    Out = zeros(size(In));

    % Image Center - Rotate about Pivot
    piv = [round(width/2), round(height/2)];

    % forward transformation matrix
    ftm = [ cosd(Theta), sind(Theta) ;
            -sind(Theta), cosd(Theta)];

    % reverse transformation matrix
    rtm = inv(ftm);

    % for each point on the destination img
    for i = 1:width
        for j = 1:height
            dp = [i,j]; % destination point
            sp = round(rtm*(dp-piv)'+piv'); % nearest source point from rotation
            % if outside bounds (image size)
            if sp(1)<1 || sp(2)<1 || sp(1)>width || sp(2)>height
                Out(i,j)=0; % set to black (0)
            else
                Out(i,j) = In(sp(1), sp(2)); % else use value at source point
            end
        end
    end
end
