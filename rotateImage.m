function [imgrot,gs,BW] = rotateImage(img)
    % The following code was used to find the angle of rotation of a random
    % card placed on the desk. It is using edge detection (the built-in
    % function from MATLAB), the function graythresh to thresholding the
    % image dynamically, and the function radon (Radon transform), to find
    % the angles on the image. This should be finding properly the angle of
    % rotation. 
    %
    % The idea was used first on: 
    %
    % https://www.clear.rice.edu/elec301/Projects99/nphaze/research.html#initexp
    %
    % Which were Rice University students during the 90s and developed a
    % similar project only using Image Processing Algorithms. Note that
    % during this project, the idea was further developed using different
    % thresholding and modifying a bit the functions to achieve a better
    % behavior. 
    gs = rgb2gray(img);
    T = graythresh(gs);
    BW = gs >= T*255+35;
    e = edge(gs,'roberts');
    theta = 0:180;
    R =  radon(e,theta);
    value=0;
    for ang=1:180
        themax=max(R(:,ang));
        if (themax > value)
            value=themax;
            ubertheta=ang-1;
        end
    end
    imgrot = imrotate(img,-ubertheta);
    gs = imrotate(gs,-ubertheta);
    BW = imrotate(BW,-ubertheta);
    BW = imresize(BW,1/2);
    BW = imresize(BW,2);
    % Script developed by Cesar Sanchez and Gautham Mudunuro during Image
    % Processing (Fall 2021) under the guidance of Dr. Hamed Sari-Sarraf. 
end
	