

input_img = imread('I.png');
[temp1 temp2 temp3] = size(input_img);
% encrypt_key =cell2mat(struct2cell( load('key5.mat')));
encrypt_key = keygen(temp1*temp2);
for ind = 1 : m    
    Fkey(:,ind) = encrypt_key((1+(ind-1)*temp1) : (((ind-1)*temp1)+temp1));
end
len = temp1;
bre = temp2;
for ind = 1 : temp3
Img = input_img(:,:,ind);
for ind1 = 1 : len
for ind2 = 1 : bre        
proImage(ind1,ind2) = bitxor(Img(ind1,ind2),Fkey(ind1,ind2));        
end
end
proImageOut(:,:,ind) = proImage(:,:,1);
end
% figure,imshow(proImageOut);
subplot(1,2,1),subimage(input_img),title('input image');
subplot(1,2,2),subimage(proImageOut),title('encrypted image');