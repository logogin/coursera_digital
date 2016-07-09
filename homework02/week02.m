1;
I = imread('digital-images-week2_quizzes-lena.gif');
#imshow(I);
S1 = imfilter(double(I), ones (3, 3) / 9, 'replicate');
S2 = imfilter(double(I), ones (5, 5) / 25, 'replicate');

psnr1 = psnr(I, S1, 255);
psnr2 = psnr(I, S2, 255);
printf("%f %f\n", psnr1, psnr2);
#imshow(S2);
#S = conv2 (I, ones (3, 3) / 9, "replicate");