bsp_image = imread('Eclectus_roratus-20030511.jpg');
assignment_image = im2double(bsp_image);
%subplot(3,3,2);
%imshow(assignment_image);
%title('Original Image')

assignment_image_2_added_brightness = assignment_image+ 0.2;
%montage({assignment_image,assignment_image_2_added_brightness})
%subplot(3,3,4);
%imshow(assignment_image_2_added_brightness)
%title('added britghness')


redChannel = assignment_image(:,:,1)*0.8;
greenChannel = assignment_image(:,:,2) *0.2;
blueChannel = assignment_image(:,:,3)*0.1;
newImage = cat(3, redChannel, greenChannel, blueChannel);
%subplot(3,3,5);
%imshow(newImage)
%title('multiplicated britghness')
%montage({assignment_im,newImage})


redChannel_1 = assignment_image(:,:,1)*0.3;
greenChannel_1 = assignment_image(:,:,2) *0.6;
blueChannel_1 = assignment_image(:,:,3)*0.1;
newImage_1 = 0.2126 * redChannel_1 + 0.7152 * greenChannel_1 + 0.0722 * blueChannel_1;
newImage_1 = newImage_1 / max(newImage_1(:));
%subplot(3,3,6);
%imshow(newImage_1);
%title('greyed Image')
%montage({assignment_image,newImage})



height_ = size(assignment_image, 1)*0.2;
width_ = size(assignment_image,2)*0.8;
square_image = insertShape(assignment_image, 'FilledRectangle', [width_, height_, 10, 10], 'Color', 'white', 'Opacity', 1);
%subplot(3,3,7);
%imshow(square_image);
%title('Sliced Image')

Image_with_horizontical_line = assignment_image;
Image_with_horizontical_line(415, 1:975, 1) = 1;
Image_with_horizontical_line(415, 1:975, 2) = 1;
Image_with_horizontical_line(415, 1:975, 3) = 1;
%subplot(3,3,8);
%imshow(Image_with_horizontical_line);
%title('Horizonticle line')


Image_with_verticle_line = assignment_image;
Image_with_verticle_line(1:553, 244, 1)=1;
Image_with_verticle_line(1:553,244,2)=1;
Image_with_verticle_line(1:553,244,3)=1;

%subplot(3,3,9);
%imshow(Image_with_verticle_line);
%title('Vertical line')


RGB2YUV = [ 0.299,0.587,0.114;
            -0.14713,-0.28886,0.436;
            0.615,-0.51499,-0.10001 ];
        
Yimg_red = assignment_image(:,:,1)*0.299;
Yimg_green = assignment_image(:,:,2)* 0.587;
Yimg_blue = assignment_image(:,:,3)*0.114;

Yimg = Yimg_red + Yimg_green + Yimg_blue;
%imshow(Yimg);

Uimg_red = assignment_image(:,:,1)* (-0.14713);
Uimg_green = assignment_image(:,:,2)* (-0.28886);
Uimg_blue = assignment_image(:,:,3) * 0.436;

Uimg = Uimg_red + Uimg_green + Uimg_blue;
%imshow(Uimg);

Vimg_red = assignment_image(:,:,1)* 0.615;
Vimg_green = assignment_image(:,:,2)* (-0.51499);
Vimg_blue = assignment_image(:,:,3) * (-0.10001);

Vimg = Vimg_red + Vimg_green + Vimg_blue;
%imshow(Vimg);

YUV_img = cat(3, Yimg, Uimg, Vimg);

%subplot(3,3,9);
%imshow(YUV_img);
%title('YUV_img')

YUV2RGB = [ 1, 0, 1.13983;
            1, -0.39465, -0.58060;
            1, 2.03211, 0           ];

Rimg_y = YUV_img(:,:,1) * 1;
Gimg_y = YUV_img(:,:,2) * 0;
Bimg_y = YUV_img(:,:,3) * 1.13983;


Img_y = Rimg_y + Gimg_y + Bimg_y;
%imshow(Img_y);


Rimg_u = YUV_img(:,:,1) * 1;
Gimg_u = YUV_img(:,:,2) * (-0.39465);
Bimg_u = YUV_img(:,:,3) * (-0.58060);


Img_u = Rimg_u + Gimg_u + Bimg_u;
%imshow(Img_u);


Rimg_v = YUV_img(:,:,1) * 1;
Gimg_v = YUV_img(:,:,2) * 2.03211;
Bimg_v = YUV_img(:,:,3) * 0;


Img_v = Rimg_v + Gimg_v + Bimg_v;
%imshow(Img_v);

RGB_img=cat(3, Img_y, Img_u, Img_v);
%subplot(3,3,10);
%imshow(RGB_img);
%title('YUV2RGB image')







whos 