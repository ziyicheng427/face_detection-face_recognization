addpath(genpath('trainfunction'))
load('C:\Users\22935\Desktop\face_recg(1) (2)\weights\weights.mat');
mapping=getmapping(8,'u2');%先计算Lbp算子的映射表
[filename,pathname] =uigetfile({'*.bmp';'*.*'},'选择测试图片');
str=[pathname filename];
%打开图像
a=imread(str);
a=imresize(a,[120 120]);
a=rgb2gray(a);
c=a;
row=size(c,1);%读入图片，并对图片进行分块，2 
col=size(c,2);
B=mat2cell(c,[row/4 row/4 row/4 row/4],[col/4 col/4 col/4 col/4]);
H.a=0;                       %对每个子块进行Lbp
for k=1:16
    H1=lbp(B{k},1,8,mapping,'h'); %LBP histogram in (8,1) neighborhood %using uniform patterns
    H.hist{k}=H1;
end   
train_x=[];%测试数据
hist=[H.hist{1},H.hist{2},H.hist{3},H.hist{4},H.hist{5},H.hist{6},H.hist{7},H.hist{8},H.hist{9},H.hist{10},H.hist{11},H.hist{12},H.hist{13},H.hist{14},H.hist{15},H.hist{16}];
MappedData = mapminmax(hist, 0, 0.5);
test_x = MappedData;
test_x  = double(test_x) ;
pred = predict(Theta1, Theta2,Theta3, test_x);
disp(pred);