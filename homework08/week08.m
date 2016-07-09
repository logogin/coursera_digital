clear all
close all
clc

entr1 = -(0.2*log2(0.2) + 0.3*log2(0.3) + 0.5*log2(0.5))

image_original = imread('Cameraman256.bmp');
[image_hist, x] = imhist(image_original);
total = sum(image_hist);
prob = image_hist / total;
prob_total = sum(prob);

entr = -sum(prob .* log2(prob))