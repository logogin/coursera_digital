1;

i1 = imread('digital-images-week5_quizzes-noisy.jpg');
[rows, columns] = size(i1);
i1 = double(i1);

i1_pass1 = medfilt2(i1);

#imshow(uint8(i1_pass1));

i1_pass2 = medfilt2(i1_pass1);

#imshow(uint8(i1_pass2));

original = imread('digital-images-week5_quizzes-original.jpg');
original = double(original);

psnr1 = psnr(original, i1, 255);
psnr2 = psnr(original, i1_pass1, 255);
psnr3 = psnr(original, i1_pass2, 255);

printf("%.2f %.2f %.2f\n", psnr1, psnr2, psnr3);