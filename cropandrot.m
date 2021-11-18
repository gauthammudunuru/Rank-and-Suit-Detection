function [gs,BW] = cropandrot(gs,BW)
% The following script is for cropping the card and discard the black pad
% around it. It should be used AFTER the rotateImage function. It is
% following the same ideas developed during homework 2. 

y = sum(BW,1) < 30;
BW(:,y) = 0;

% First Column
finder = any(BW);
c = find(finder,1,'first');
BW(:,1:c) = [];gs(:,1:c) = [];

% Last Column
finder = any(BW);
c = find(finder,1,'last');
BW(:,c:end)=[];gs(:,c:end)=[];



% First Row
BW = imrotate(BW,90,'bicubic');
gs = imrotate(gs,90,'bicubic');
finder = any(BW);
c = find(finder,1,'first');
BW(:,1:c) = [];
gs(:,1:c) = [];



% Last Column 
finder = any(BW);
c = find(finder,1,'last');
BW(:,c:end) = [];gs(:,c:end) = [];



[row, column] = size(BW);

if row < column 
    BW = imrotate(BW,90,'bicubic');
    gs = imrotate(gs,90,'bicubic');
end

% Script developed and used by Cesar Sanchez and Gautham Mudunuru during
% Image Processing (Fall 2021) under the guidance of Dr. Hamed Sari-Sarraf.
end