close all
clear all;
%%
%reading the image
raw_image=imread('image1.bmp');
%%
%extracting red,green,blue components from the image
 
%when running the code don't close these 3 figures that pop out until matlab
%finishes executing the code
R = raw_image(:,:,1);
G = raw_image(:,:,2);
B = raw_image(:,:,3);
%%
%displaying red,green,blue components from the image
figure,imshow(R);%displaying red component
figure,imshow(G);%displaying green component
figure,imshow(B);%displaying blue component
%%
%extracting image resolution(dimensions) and setting block size(8x8)&number
%of blocks
[image_height,image_width,n] = size(raw_image);
block_size=8;
numbers_of_blocks_vertically = image_height/8;
numbers_of_blocks_horizontally = image_width/8;
%%
myrow_m1=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=1
myrow_m2=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=2
myrow_m3=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=3
myrow_m4=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=4
 
for row = 1: +block_size: image_height - block_size + 1
    
    mycolumn_m1=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=1
    mycolumn_m2=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=2
    mycolumn_m3=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=3
    mycolumn_m4=1;%counter used for summation of dct matrices (that contains elements that have values only & not including the zeros) for m=4
    
    for column=1 : +block_size: image_width - block_size + 1
 
%row & column are the begining of the 8x8 block rows & columns
 
%we determine each 8x8 block rows ends & columns ends
 
    row_end = row +block_size -1;
    column_end = column +block_size -1;
        
%extracting 8x8 blocks that we will process on in matrices for each color
%component
 
    Rblock8x8=R(row:row_end,column:column_end);
    Gblock8x8=G(row:row_end,column:column_end);
    Bblock8x8=B(row:row_end,column:column_end);
 
%making dct(discrete cosine transform) on each block of color components
    
    Rblockdct8x8=dct2(Rblock8x8);
    Gblockdct8x8=dct2(Gblock8x8);
    Bblockdct8x8=dct2(Bblock8x8);
    
    %for m=1:extracting the dc components of each color component from the
    %dct converted matrices
    
    dc_red_m1=Rblockdct8x8(1,1);
    dc_green_m1=Gblockdct8x8(1,1);
    dc_blue_m1=Bblockdct8x8(1,1);
    
    %for m=2:extracting the top left 2x2 matrix of each color component from the dct converted matrices 
    
    dc_red2x2=[Rblockdct8x8(1,1) Rblockdct8x8(1,2)
               Rblockdct8x8(2,1) Rblockdct8x8(2,2)];
    dc_green2x2=[Gblockdct8x8(1,1) Gblockdct8x8(1,2)
                 Gblockdct8x8(2,1) Gblockdct8x8(2,2)];
    dc_blue2x2=[Bblockdct8x8(1,1) Bblockdct8x8(1,2)
                Bblockdct8x8(2,1) Bblockdct8x8(2,2)];
            
    %for m=3:extracting the top left 3x3 matrix of each color component from the dct converted matrices 
    
    dc_red3x3=[Rblockdct8x8(1,1) Rblockdct8x8(1,2) Rblockdct8x8(1,3)
               Rblockdct8x8(2,1) Rblockdct8x8(2,2) Rblockdct8x8(2,3)
               Rblockdct8x8(3,1) Rblockdct8x8(3,2) Rblockdct8x8(3,3)];
    dc_green3x3=[Gblockdct8x8(1,1) Gblockdct8x8(1,2) Gblockdct8x8(1,3)
               Gblockdct8x8(2,1) Gblockdct8x8(2,2) Gblockdct8x8(2,3)
               Gblockdct8x8(3,1) Gblockdct8x8(3,2) Gblockdct8x8(3,3)];
    dc_blue3x3=[Bblockdct8x8(1,1) Bblockdct8x8(1,2) Bblockdct8x8(1,3)
               Bblockdct8x8(2,1) Bblockdct8x8(2,2) Bblockdct8x8(2,3)
               Bblockdct8x8(3,1) Bblockdct8x8(3,2) Bblockdct8x8(3,3)];
           
    %for m=4:extracting the top left 4x4 matrix of each color component from the dct converted matrices
    
    dc_red4x4=[Rblockdct8x8(1,1) Rblockdct8x8(1,2) Rblockdct8x8(1,3) Rblockdct8x8(1,4)
               Rblockdct8x8(2,1) Rblockdct8x8(2,2) Rblockdct8x8(2,3) Rblockdct8x8(2,4)
               Rblockdct8x8(3,1) Rblockdct8x8(3,2) Rblockdct8x8(3,3) Rblockdct8x8(3,4)
               Rblockdct8x8(4,1) Rblockdct8x8(4,2) Rblockdct8x8(4,3) Rblockdct8x8(4,4)];
    dc_green4x4=[Gblockdct8x8(1,1) Gblockdct8x8(1,2) Gblockdct8x8(1,3) Gblockdct8x8(1,4)
                 Gblockdct8x8(2,1) Gblockdct8x8(2,2) Gblockdct8x8(2,3) Gblockdct8x8(2,4)
                 Gblockdct8x8(3,1) Gblockdct8x8(3,2) Gblockdct8x8(3,3) Gblockdct8x8(3,4)
                 Gblockdct8x8(4,1) Gblockdct8x8(4,2) Gblockdct8x8(4,3) Gblockdct8x8(4,4)];
    dc_blue4x4=[ Bblockdct8x8(1,1) Bblockdct8x8(1,2) Bblockdct8x8(1,3) Bblockdct8x8(1,4)
                 Bblockdct8x8(2,1) Bblockdct8x8(2,2) Bblockdct8x8(2,3) Bblockdct8x8(2,4)
                 Bblockdct8x8(3,1) Bblockdct8x8(3,2) Bblockdct8x8(3,3) Bblockdct8x8(3,4)
                 Bblockdct8x8(4,1) Bblockdct8x8(4,2) Bblockdct8x8(4,3) Bblockdct8x8(4,4)];
    
             %%
             
    %setting some mask matrices
             
    mask1_1=[1 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask1_2=[0 1 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask1_3=[0 0 1 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask1_4=[0 0 0 1 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask2_1=[0 0 0 0 0 0 0 0
          1 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask2_2=[0 0 0 0 0 0 0 0
          0 1 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask2_3=[0 0 0 0 0 0 0 0
          0 0 1 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask2_4=[0 0 0 0 0 0 0 0
          0 0 0 1 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask3_1=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          1 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask3_2=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 1 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask3_3=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 1 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask3_4=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 1 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask4_1=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          1 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask4_2=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 1 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask4_3=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 1 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      mask4_4=[0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 1 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0
          0 0 0 0 0 0 0 0];
      
      %%
      
      %putting each dc component in first element in 8x8 matrix & all other
      %elements are zeros for m=1
      
      matrix_dc_red_m1=mask1_1*dc_red_m1;
      matrix_dc_green_m1=mask1_1*dc_green_m1;
      matrix_dc_blue_m1=mask1_1*dc_blue_m1;
      
      %putting each non zero elements in a matrix
      
      dct_image_red_m1(myrow_m1,mycolumn_m1)=dc_red_m1;
      dct_image_green_m1(myrow_m1,mycolumn_m1)=dc_green_m1;
      dct_image_blue_m1(myrow_m1,mycolumn_m1)=dc_blue_m1;
      
      %get the idct(inverse discrete cosine transform)for the 8x8 matrix
      
      idct_red_m1=idct2(matrix_dc_red_m1);
      idct_green_m1=idct2(matrix_dc_green_m1);
      idct_blue_m1=idct2(matrix_dc_blue_m1);
      
      %placing 8x8 matrices in the 1080x1920 matrix
      
      inverse_image_red_m1(row:row_end,column:column_end)=idct_red_m1;
      inverse_image_green_m1(row:row_end,column:column_end)=idct_green_m1;
      inverse_image_blue_m1(row:row_end,column:column_end)=idct_blue_m1;
      
      %%
      
      %putting each dc component in first element in 8x8 matrix & all other
      %elements are zeros for m=2 (by dc here meaning top left 2x2 matrix)
      
      matrix_dc_red2x2=(mask1_1*dc_red2x2(1,1)+mask1_2*dc_red2x2(1,2)+mask2_1*dc_red2x2(2,1)+mask2_2*dc_red2x2(2,2));
      matrix_dc_green2x2=(mask1_1*dc_green2x2(1,1)+mask1_2*dc_green2x2(1,2)+mask2_1*dc_green2x2(2,1)+mask2_2*dc_green2x2(2,2));
      matrix_dc_blue2x2=(mask1_1*dc_blue2x2(1,1)+mask1_2*dc_blue2x2(1,2)+mask2_1*dc_blue2x2(2,1)+mask2_2*dc_blue2x2(2,2));
      
      %putting each non zero elements in a matrix  
      
      dct_image_red_m2(myrow_m2:myrow_m2+1,mycolumn_m2:mycolumn_m2+1)=dc_red2x2(1:2,1:2);
      dct_image_green_m2(myrow_m2:myrow_m2+1,mycolumn_m2:mycolumn_m2+1)=dc_green2x2(1:2,1:2);
      dct_image_blue_m2(myrow_m2:myrow_m2+1,mycolumn_m2:mycolumn_m2+1)=dc_blue2x2(1:2,1:2);
      
      %get the idct(inverse discrete cosine transform)for the 8x8 matrix
      
      idct_red_m2=idct2(matrix_dc_red2x2);
      idct_green_m2=idct2(matrix_dc_green2x2);
      idct_blue_m2=idct2(matrix_dc_blue2x2);
      
      %placing 8x8 matrices in the 1080x1920 matrix
      
      inverse_image_red_m2(row:row_end,column:column_end)=idct_red_m2;
      inverse_image_green_m2(row:row_end,column:column_end)=idct_green_m2;
      inverse_image_blue_m2(row:row_end,column:column_end)=idct_blue_m2;
      
      %%
      
      %putting each dc component in first element in 8x8 matrix & all other
      %elements are zeros for m=3 (by dc here meaning top left 3x3 matrix)
      
      matrix_dc_red3x3=(mask1_1*dc_red3x3(1,1)+mask1_2*dc_red3x3(1,2)+mask1_3*dc_red3x3(1,3)+mask2_1*dc_red3x3(2,1)+mask2_2*dc_red3x3(2,2)+mask2_3*dc_red3x3(2,3)+mask3_1*dc_red3x3(3,1)+mask3_2*dc_red3x3(3,2)+mask3_3*dc_red3x3(3,3));
      matrix_dc_green3x3=(mask1_1*dc_green3x3(1,1)+mask1_2*dc_green3x3(1,2)+mask1_3*dc_green3x3(1,3)+mask2_1*dc_green3x3(2,1)+mask2_2*dc_green3x3(2,2)+mask2_3*dc_green3x3(2,3)+mask3_1*dc_green3x3(3,1)+mask3_2*dc_green3x3(3,2)+mask3_3*dc_green3x3(3,3));
      matrix_dc_blue3x3=(mask1_1*dc_blue3x3(1,1)+mask1_2*dc_blue3x3(1,2)+mask1_3*dc_blue3x3(1,3)+mask2_1*dc_blue3x3(2,1)+mask2_2*dc_blue3x3(2,2)+mask2_3*dc_blue3x3(2,3)+mask3_1*dc_blue3x3(3,1)+mask3_2*dc_blue3x3(3,2)+mask3_3*dc_blue3x3(3,3));
      
      %putting each non zero elements in a matrix 
      
      dct_image_red_m3(myrow_m3:myrow_m3+2,mycolumn_m3:mycolumn_m3+2)=dc_red3x3(1:3,1:3);
      dct_image_green_m3(myrow_m3:myrow_m3+2,mycolumn_m3:mycolumn_m3+2)=dc_green3x3(1:3,1:3);
      dct_image_blue_m3(myrow_m3:myrow_m3+2,mycolumn_m3:mycolumn_m3+2)=dc_blue3x3(1:3,1:3);
      
      %get the idct(inverse discrete cosine transform)for the 8x8 matrix
      
      idct_red_m3=idct2(matrix_dc_red3x3);
      idct_green_m3=idct2(matrix_dc_green3x3);
      idct_blue_m3=idct2(matrix_dc_blue3x3);
      
      %placing 8x8 matrices in the 1080x1920 matrix
      
      inverse_image_red_m3(row:row_end,column:column_end)=idct_red_m3;
      inverse_image_green_m3(row:row_end,column:column_end)=idct_green_m3;
      inverse_image_blue_m3(row:row_end,column:column_end)=idct_blue_m3;
      
      %%
      
      %putting each dc component in first element in 8x8 matrix & all other
      %elements are zeros for m=4 (by dc here meaning top left 4x4 matrix)
      
      matrix_dc_red4x4=(mask1_1*dc_red4x4(1,1)+mask1_2*dc_red4x4(1,2)+mask1_3*dc_red4x4(1,3)+mask1_4*dc_red4x4(1,4)+mask2_1*dc_red4x4(2,1)+mask2_2*dc_red4x4(2,2)+mask2_3*dc_red4x4(2,3)+mask2_4*dc_red4x4(2,4)+mask3_1*dc_red4x4(3,1)+mask3_2*dc_red4x4(3,2)+mask3_3*dc_red4x4(3,3)+mask3_4*dc_red4x4(3,4)+mask4_1*dc_red4x4(4,1)+mask4_2*dc_red4x4(4,2)+mask4_3*dc_red4x4(4,3)+mask4_4*dc_red4x4(4,4));
      matrix_dc_green4x4=(mask1_1*dc_green4x4(1,1)+mask1_2*dc_green4x4(1,2)+mask1_3*dc_green4x4(1,3)+mask1_4*dc_green4x4(1,4)+mask2_1*dc_green4x4(2,1)+mask2_2*dc_green4x4(2,2)+mask2_3*dc_green4x4(2,3)+mask2_4*dc_green4x4(2,4)+mask3_1*dc_green4x4(3,1)+mask3_2*dc_green4x4(3,2)+mask3_3*dc_green4x4(3,3)+mask3_4*dc_green4x4(3,4)+mask4_1*dc_green4x4(4,1)+mask4_2*dc_green4x4(4,2)+mask4_3*dc_green4x4(4,3)+mask4_4*dc_green4x4(4,4));
      matrix_dc_blue4x4=(mask1_1*dc_blue4x4(1,1)+mask1_2*dc_blue4x4(1,2)+mask1_3*dc_blue4x4(1,3)+mask1_4*dc_blue4x4(1,4)+mask2_1*dc_blue4x4(2,1)+mask2_2*dc_blue4x4(2,2)+mask2_3*dc_blue4x4(2,3)+mask2_4*dc_blue4x4(2,4)+mask3_1*dc_blue4x4(3,1)+mask3_2*dc_blue4x4(3,2)+mask3_3*dc_blue4x4(3,3)+mask3_4*dc_blue4x4(3,4)+mask4_1*dc_blue4x4(4,1)+mask4_2*dc_blue4x4(4,2)+mask4_3*dc_blue4x4(4,3)+mask4_4*dc_blue4x4(4,4));
      
      %putting each non zero elements in a matrix
      
      dct_image_red_m4(myrow_m4:myrow_m4+3,mycolumn_m4:mycolumn_m4+3)=dc_red4x4(1:4,1:4);
      dct_image_green_m4(myrow_m4:myrow_m4+3,mycolumn_m4:mycolumn_m4+3)=dc_green4x4(1:4,1:4);
      dct_image_blue_m4(myrow_m4:myrow_m4+3,mycolumn_m4:mycolumn_m4+3)=dc_blue4x4(1:4,1:4);
      
      %get the idct(inverse discrete cosine transform)for the 8x8 matrix
      
      idct_red_m4=idct2(matrix_dc_red4x4);
      idct_green_m4=idct2(matrix_dc_green4x4);
      idct_blue_m4=idct2(matrix_dc_blue4x4);
      
      %placing 8x8 matrices in the 1080x1920 matrix
      
      inverse_image_red_m4(row:row_end,column:column_end)=idct_red_m4;
      inverse_image_green_m4(row:row_end,column:column_end)=idct_green_m4;
      inverse_image_blue_m4(row:row_end,column:column_end)=idct_blue_m4;
      
      %%
      
    mycolumn_m1=mycolumn_m1+1;
    mycolumn_m2=mycolumn_m2+2;
    mycolumn_m3=mycolumn_m3+3;
    mycolumn_m4=mycolumn_m4+4;
    
    end
    
    myrow_m1=myrow_m1+1;
    myrow_m2=myrow_m2+2;
    myrow_m3=myrow_m3+3;
    myrow_m4=myrow_m4+4;
 
end
 
      %%
      
      %for m=1:rescaling matrices & converting their values from double to
      %uint8
      
      rescaled_dct_image_red_m1=rescale(dct_image_red_m1);
      rescaled_dct_image_green_m1=rescale(dct_image_green_m1);
      rescaled_dct_image_blue_m1=rescale(dct_image_blue_m1);
      
      rescaled_dct_image_red_m1=im2uint8(rescaled_dct_image_red_m1);
      rescaled_dct_image_green_m1=im2uint8(rescaled_dct_image_green_m1);
      rescaled_dct_image_blue_m1=im2uint8(rescaled_dct_image_blue_m1);
      
      rescaled_inverse_image_red_m1=rescale(inverse_image_red_m1);
      rescaled_inverse_image_green_m1=rescale(inverse_image_green_m1);
      rescaled_inverse_image_blue_m1=rescale(inverse_image_blue_m1);
      
      rescaled_inverse_image_red_m1=im2uint8(rescaled_inverse_image_red_m1);
      rescaled_inverse_image_green_m1=im2uint8(rescaled_inverse_image_green_m1);
      rescaled_inverse_image_blue_m1=im2uint8(rescaled_inverse_image_blue_m1);
 
      %concatenation of red,green, and blue color components and retriving
      %images in one matrix then write the images(extract them) & display
      %them
      
      Decompressed_Image_At_m1 = cat(3, rescaled_inverse_image_red_m1, rescaled_inverse_image_green_m1, rescaled_inverse_image_blue_m1);
      imwrite(Decompressed_Image_At_m1,'Decompressed_Image_At_m=1.bmp');
 
      Compressed_Image_At_m1 = cat(3, rescaled_dct_image_red_m1, rescaled_dct_image_green_m1, rescaled_dct_image_blue_m1);
 
      imwrite(Compressed_Image_At_m1,'Compressed_Image_At_m=1.bmp');
      
      figure,imshow(Decompressed_Image_At_m1);
 
      %end of m=1
      %%
      
      %for m=2:rescaling matrices & converting their values from double to
      %uint8
      
      rescaled_dct_image_red_m2=rescale(dct_image_red_m2);
      rescaled_dct_image_green_m2=rescale(dct_image_green_m2);
      rescaled_dct_image_blue_m2=rescale(dct_image_blue_m2);
      
      rescaled_dct_image_red_m2=im2uint8(rescaled_dct_image_red_m2);
      rescaled_dct_image_green_m2=im2uint8(rescaled_dct_image_green_m2);
      rescaled_dct_image_blue_m2=im2uint8(rescaled_dct_image_blue_m2);
      
      rescaled_inverse_image_red_m2=rescale(inverse_image_red_m2);
      rescaled_inverse_image_green_m2=rescale(inverse_image_green_m2);
      rescaled_inverse_image_blue_m2=rescale(inverse_image_blue_m2);
      
      rescaled_inverse_image_red_m2=im2uint8(rescaled_inverse_image_red_m2);
      rescaled_inverse_image_green_m2=im2uint8(rescaled_inverse_image_green_m2);
      rescaled_inverse_image_blue_m2=im2uint8(rescaled_inverse_image_blue_m2);
 
      %concatenation of red,green, and blue color components and retriving
      %images in one matrix then write the images(extract them) & display
      %them
      
      Decompressed_Image_At_m2 = cat(3, rescaled_inverse_image_red_m2, rescaled_inverse_image_green_m2, rescaled_inverse_image_blue_m2);
      imwrite(Decompressed_Image_At_m2,'Decompressed_Image_At_m=2.bmp');
 
      Compressed_Image_At_m2 = cat(3, rescaled_dct_image_red_m2, rescaled_dct_image_green_m2, rescaled_dct_image_blue_m2);
 
      imwrite(Compressed_Image_At_m2,'Compressed_Image_At_m=2.bmp');
      
      figure,imshow(Decompressed_Image_At_m2);
      
      %end of m=2
      %%
      
      %for m=3%:rescaling matrices & converting their values from double to
      %uint8
      
      rescaled_dct_image_red_m3=rescale(dct_image_red_m3);
      rescaled_dct_image_green_m3=rescale(dct_image_green_m3);
      rescaled_dct_image_blue_m3=rescale(dct_image_blue_m3);
      
      rescaled_dct_image_red_m3=im2uint8(rescaled_dct_image_red_m3);
      rescaled_dct_image_green_m3=im2uint8(rescaled_dct_image_green_m3);
      rescaled_dct_image_blue_m3=im2uint8(rescaled_dct_image_blue_m3);
      
      rescaled_inverse_image_red_m3=rescale(inverse_image_red_m3);
      rescaled_inverse_image_green_m3=rescale(inverse_image_green_m3);
      rescaled_inverse_image_blue_m3=rescale(inverse_image_blue_m3);
      
      rescaled_inverse_image_red_m3=im2uint8(rescaled_inverse_image_red_m3);
      rescaled_inverse_image_green_m3=im2uint8(rescaled_inverse_image_green_m3);
      rescaled_inverse_image_blue_m3=im2uint8(rescaled_inverse_image_blue_m3);
 
      %concatenation of red,green, and blue color components and retriving
      %images in one matrix then write the images(extract them) & display
      %them
      
      Decompressed_Image_At_m3 = cat(3, rescaled_inverse_image_red_m3, rescaled_inverse_image_green_m3, rescaled_inverse_image_blue_m3);
      imwrite(Decompressed_Image_At_m3,'Decompressed_Image_At_m=3.bmp');
 
      Compressed_Image_At_m3 = cat(3, rescaled_dct_image_red_m3, rescaled_dct_image_green_m3, rescaled_dct_image_blue_m3);
 
      imwrite(Compressed_Image_At_m3,'Compressed_Image_At_m=3.bmp');
      
      figure,imshow(Decompressed_Image_At_m3);
      
      %end of m=3
      %%
      
      %for m=4%:rescaling matrices & converting their values from double to
      %uint8
      
      rescaled_dct_image_red_m4=rescale(dct_image_red_m4);
      rescaled_dct_image_green_m4=rescale(dct_image_green_m4);
      rescaled_dct_image_blue_m4=rescale(dct_image_blue_m4);
      
      rescaled_dct_image_red_m4=im2uint8(rescaled_dct_image_red_m4);
      rescaled_dct_image_green_m4=im2uint8(rescaled_dct_image_green_m4);
      rescaled_dct_image_blue_m4=im2uint8(rescaled_dct_image_blue_m4);
      
      rescaled_inverse_image_red_double_m4=rescale(inverse_image_red_m4);
      rescaled_inverse_image_green_double_m4=rescale(inverse_image_green_m4);
      rescaled_inverse_image_blue_double_m4=rescale(inverse_image_blue_m4);
      
      rescaled_inverse_image_red_m4=im2uint8(rescaled_inverse_image_red_double_m4);
      rescaled_inverse_image_green_m4=im2uint8(rescaled_inverse_image_green_double_m4);
      rescaled_inverse_image_blue_m4=im2uint8(rescaled_inverse_image_blue_double_m4);
 
      %concatenation of red,green, and blue color components and retriving
      %images in one matrix then write the images(extract them) & display
      %them
      
      Decompressed_Image_At_m4 = cat(3, rescaled_inverse_image_red_m4, rescaled_inverse_image_green_m4, rescaled_inverse_image_blue_m4);
 
      imwrite(Decompressed_Image_At_m4,'Decompressed_Image_At_m=4.bmp');
 
      Compressed_Image_At_m4 = cat(3, rescaled_dct_image_red_m4, rescaled_dct_image_green_m4, rescaled_dct_image_blue_m4);
 
      imwrite(Compressed_Image_At_m4,'Compressed_Image_At_m=4.bmp');
      
      figure,imshow(Decompressed_Image_At_m4);
 
      %end of m=4
      %%
      
      %Calculation of the PSNR Curve plot displaying the PSNR (on the vertical axis) against m (on the horizontal axis).
      
      red_component = im2double(R);
      green_component = im2double(G);
      blue_component = im2double(B);
 T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
 red_block = blockproc(red_component,[8 8],dct);
 green_block = blockproc(green_component,[8 8],dct);
 blue_block = blockproc(blue_component,[8 8],dct);
 
 mask_m4 =[1   1   1   1   0   0   0   0
           1   1   1   1   0   0   0   0
           1   1   1   1   0   0   0   0
           1   1   1   1   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0];
 
 mask_m2 =[1   1   0   0   0   0   0   0
           1   1   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0];
 
 mask_m3 =[1   1   1   0   0   0   0   0
           1   1   1   0   0   0   0   0
           1   1   1   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0];
       
       mask_m1 =[1   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0
           0   0   0   0   0   0   0   0];
       
      %m=1
      
 r_block = blockproc(red_block,[8 8],@(block_struct) mask_m1 .* block_struct.data);
 g_block = blockproc(green_block,[8 8],@(block_struct) mask_m1 .* block_struct.data);
 b_block = blockproc(blue_block,[8 8],@(block_struct) mask_m1 .* block_struct.data);
 invdct = @(block_struct) T' * block_struct.data * T;
red_I = blockproc(r_block,[8 8],invdct);
 green_I = blockproc(g_block,[8 8],invdct);
 blue_I = blockproc(b_block,[8 8],invdct);
red_component=im2uint8(red_component);
 red_I=im2uint8(red_I);
 psnr_red_m2=psnr(red_I,red_component,255);
green_component=im2uint8(green_component);
 green_I=im2uint8(green_I);
 psnr_green_m2=psnr(green_I,green_component,255);
blue_component=im2uint8(blue_component);
 blue_I=im2uint8(blue_I);
 psnr_blue_m2=psnr(blue_I,blue_component,255);
  img=cat(3,red_I,green_I,blue_I);
 PSNR_At_m1=psnr(img,raw_image,255);
       
       %m=2
       
 r_block = blockproc(red_block,[8 8],@(block_struct) mask_m2 .* block_struct.data);
 g_block = blockproc(green_block,[8 8],@(block_struct) mask_m2 .* block_struct.data);
 b_block = blockproc(blue_block,[8 8],@(block_struct) mask_m2 .* block_struct.data);
 invdct = @(block_struct) T' * block_struct.data * T;
red_I = blockproc(r_block,[8 8],invdct);
 green_I = blockproc(g_block,[8 8],invdct);
 blue_I = blockproc(b_block,[8 8],invdct);
red_component=im2uint8(red_component);
 red_I=im2uint8(red_I);
 peaksnr_red_m2=psnr(red_I,red_component,255);
green_component=im2uint8(green_component);
 green_I=im2uint8(green_I);
 peaksnr_green_m2=psnr(green_I,green_component,255);
blue_component=im2uint8(blue_component);
 blue_I=im2uint8(blue_I);
 psnr_blue_m2=psnr(blue_I,blue_component,255);
  img=cat(3,red_I,green_I,blue_I);
 PSNR_At_m2=psnr(img,raw_image,255);
 
 %m=3
 
 r_block = blockproc(red_block,[8 8],@(block_struct) mask_m3 .* block_struct.data);
 g_block = blockproc(green_block,[8 8],@(block_struct) mask_m3 .* block_struct.data);
 b_block = blockproc(blue_block,[8 8],@(block_struct) mask_m3 .* block_struct.data);
 invdct = @(block_struct) T' * block_struct.data * T;
red_I = blockproc(r_block,[8 8],invdct);
 green_I = blockproc(g_block,[8 8],invdct);
 blue_I = blockproc(b_block,[8 8],invdct);
red_component=im2uint8(red_component);
 red_I=im2uint8(red_I);
 peaksnr_red_m3=psnr(red_I,red_component,255);
green_component=im2uint8(green_component);
 green_I=im2uint8(green_I);
 peaksnr_green_m3=psnr(green_I,green_component,255);
blue_component=im2uint8(blue_component);
 blue_I=im2uint8(blue_I);
 peaksnr_blue_m3=psnr(blue_I,blue_component,255);
  img2=cat(3,red_I,green_I,blue_I);
 PSNR_At_m3=psnr(img2,raw_image,255);
 
 %m=4
 
 r_block = blockproc(red_block,[8 8],@(block_struct) mask_m4 .* block_struct.data);
 g_block = blockproc(green_block,[8 8],@(block_struct) mask_m4 .* block_struct.data);
 b_block = blockproc(blue_block,[8 8],@(block_struct) mask_m4 .* block_struct.data);
 invdct = @(block_struct) T' * block_struct.data * T;
red_I = blockproc(r_block,[8 8],invdct);
green_I = blockproc(g_block,[8 8],invdct);
 blue_I = blockproc(b_block,[8 8],invdct);
red_component=im2uint8(red_component);
 red_I=im2uint8(red_I);
 peaksnr_red_m4=psnr(red_I,red_component,255);
green_component=im2uint8(green_component);
 green_I=im2uint8(green_I);
 peaksnr_green_m4=psnr(green_I,green_component,255);
blue_component=im2uint8(blue_component);
 blue_I=im2uint8(blue_I);
 peaksnr3_blue_m4=psnr(blue_I,blue_component,255);
  img=cat(3,red_I,green_I,blue_I);
 PSNR_At_m4=psnr(img,raw_image,255);
        
 %%
 
%Curve plot displaying the PSNR (on the vertical axis) against m (on the horizontal axis).
       m=1:4;
       
       PSNR=[PSNR_At_m1,PSNR_At_m2,PSNR_At_m3,PSNR_At_m4];
       
       figure,plot(m,PSNR)
       xlabel('m')
       ylabel('PSNR')
