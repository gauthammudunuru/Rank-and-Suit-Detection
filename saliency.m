function [img] = saliency(img)
    gaussian_kernel = fspecial('gaussian', [10 10], 5);
    img_gaussian = imfilter(img, gaussian_kernel, 'replicate');
    
    lab = rgb2lab(img_gaussian);
    
    l = double(lab(:, :, 1));
    lm = mean(mean(l));
    a = double(lab(:, :, 2));
    am = mean(mean(a));
    b = double(lab(:, :, 3));
    bm = mean(mean(b));
    
    sm = (l - lm) .^ 2 + (a - am) .^ 2 + (b - bm) .^ 2;
    mean_value = mean(sm(:))*1.4;
    sm(sm < mean_value) = 0;
    sm(sm >= mean_value) = 1;
    
    for t = 1:3
        img(:,:,t) = (img(:,:,t)).*uint8(sm);
    end
end