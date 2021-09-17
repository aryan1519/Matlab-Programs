close all;
x1 = [1 2 3 5 9];
subplot(3,1,1);
stem(x1);
title('First Signal');
x2 = [2 5 7 8];
subplot(3,1,2);
stem(x2);
title('Second Signal');
l1 = length(x1);
l2 = length(x2);
h1 = [x1,zeros(1,l2-1)];
h2 = [x2,zeros(1,l1-1)];
h = h1+h2-1;
for i = 1:l2+l1-1
    y(i) = 0;
    for j = 1:l1
        if((i-j+1)>0)
            y(i) = y(i) + (h1(j)*h2(i-j+1));
        end
    end
end
subplot(3,1,3);
stem(y);
title('Convolution')