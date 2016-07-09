1;

i1 = imread('digital-images-week4_quizzes-frame_1.jpg');
[rows, columns] = size(i1);
i1 = double(i1);

i2 = imread('digital-images-week4_quizzes-frame_2.jpg');
i2 = double(i2);

b = i2(65:96, 81:112);
r = i1(1:32, 1:32);

min = msa (r, b);
min_i = 1;
min_j = 1;

for i = 1:rows-31
  for j = 1:columns-31
    #printf("row=%d, col=%d\n", i, j);
    r = i1(i:i+31, j:j+31);
    _msa = msa (r, b);
    if (_msa < min)
      min = _msa;
      min_i = i;
      min_j = j;
    endif 
  endfor
endfor

printf("row=%d, col=%d, msa=%f\n", min_i, min_j, min);