bsp_image = imread('Eclectus_roratus-20030511.jpg');
%I1 = bsp_image+150; imshow(I1);
assignment_image = im2double(bsp_image);


assignment_image_2_added_brightness = assignment_image+ 0.2;
montage({assignment_image,assignment_image_2_added_brightness})







whos 