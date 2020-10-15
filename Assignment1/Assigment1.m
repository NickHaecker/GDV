bsp_image = imread('Eclectus_roratus-20030511.jpg');
assignment_image = im2double(bsp_image);
subplot(3,3,2);
imshow(assignment_image);
title('Original Image')

assignment_image_2_added_brightness = assignment_image+ 0.2;
%montage({assignment_image,assignment_image_2_added_brightness})
subplot(3,3,4);
imshow(assignment_image_2_added_brightness)
title('added britghness')


redChannel = assignment_image(:,:,1)*0.8;
greenChannel = assignment_image(:,:,2) *0.2;
blueChannel = assignment_image(:,:,3)*0.1;
newImage = cat(3, redChannel, greenChannel, blueChannel);
subplot(3,3,5);
imshow(newImage)
title('multiplicated britghness')
%montage({assignment_im,newImage})


redChannel_1 = assignment_image(:,:,1)*0.3;
greenChannel_1 = assignment_image(:,:,2) *0.6;
blueChannel_1 = assignment_image(:,:,3)*0.1;
newImage_1 = 0.2126 * redChannel_1 + 0.7152 * greenChannel_1 + 0.0722 * blueChannel_1;
newImage_1 = newImage_1 / max(newImage_1(:));
subplot(3,3,6);
imshow(newImage_1);
title('greyed Image')
%montage({assignment_image,newImage})








whos 