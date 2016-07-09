clear all
close all
clc

im = imread('Cameraman256.bmp');
imwritegray(im, 'Cameraman256_75.jpg', 'Quality', 75);
im75 = imread('Cameraman256_75.jpg');
imwritegray(im, 'Cameraman256_10.jpg', 'Quality', 10);
im10 = imread('Cameraman256_10.jpg');

figure; imshow(im);
figure; imshow(im75);
figure; imshow(im10);

psnr75 = psnr(double(im), double(im75), 255);
psnr10 = psnr(double(im), double(im10), 255);

a = repmat (uint8 (0:255), 100, 1);
imshow (a)
imwritegray (a, "test.jpg");
b = imread ("test.jpg");
figure;
imshow (b)
