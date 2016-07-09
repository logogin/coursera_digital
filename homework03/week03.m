1;

image = imread('digital-images-week3_quizzes-original_quiz.jpg');
[rows, columns] = size(image);

image = double(image);
filtered = imfilter(image, ones (3, 3) / 9, 'replicate');

down_sampled = filtered(1:2:rows, 1:2:columns);
#imshow(uint8(down_sampled));

up_sampled = zeros(rows, columns);

for i = 1:2:rows
  for j = 1:2:columns
    up_sampled(i, j) = down_sampled((i + 1)/2, (j + 1)/2);
  endfor
endfor

filter = [0.25,0.5,0.25;0.5,1,0.5;0.25,0.5,0.25];

up_sampled = imfilter(up_sampled, filter);
#imshow(uint8(up_sampled));

psnr = psnr(image, up_sampled, 255);

printf("%f\n", psnr);