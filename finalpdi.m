

I = imread('mango2.jpg');

%I = imresize(I, [256 256]);

B = I(:,:,1);
R = I(:,:,2);
G = I(:,:,3);

F1=I;

for i=1 : size(I,1)
  for j=1 : size(I,2)
    if R(i,j)<100%case 1
      F1(i,j,:)= 0;
    end
  % if R(i,j)>G(i,j) && R(i,j)>B(i,j)%case 2
  %  F1(i,j,:)= 0;
  % end
    if R(i,j)<=100 && B(i,j)<=100%case 2.1 e case 4
      F1(i,j,:)= 0;
    end
    if R(i,j)<=100 && G(i,j)<=100 && B(i,j)<=100%case 3
     F1(i,j,:)= 0;
    end
    if G(i,j)<100 && B(i,j)<100 %case 4.1
      F1(i,j,:)= 0;
    end
%    if G(i,j)>=100 && B(i,j)>=100%case 5
%      F1(i,j,:)= 0;
%    end
    if G(i,j)<=170 && B(i,j)<=150%case 5.1
      F1(i,j,:)= 0;
    end
    if G(i,j)>=B(i,j) && B(i,j)>=R(i,j)%case 6
      F1(i,j,:)= 0;
    end
%    if R(i,j)<200 && G(i,j)<200 && B(i,j)<200%case 7
%      F1(i,j,:)= 0;
%    end
    if R(i,j)>=G(i,j) && G(i,j)>=B(i,j)%case 7.1
      F1(i,j,:)= 0;
    end
%    if B(i,j)>R(i,j) && B(i,j)>G(i,j)%case 8
%      F1(i,j,:)= 0;
%    end
  end
end


G=im2bw(F1);
%J=edge(G);
[centers,radii] = imfindcircles(G,[50 90], 'Sensitivity', 0.95);


subplot(2,2,1), imshow(I); title('NORMAL');
subplot(2,2,2), imshow(F1); title('POS FILTRO');
subplot(2,2,3), imshow(G); title('HCT');
subplot(2,2,3), imshow(G(viscircles(centers, radii)));


