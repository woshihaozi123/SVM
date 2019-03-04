clc;clear;
%给初学者看得
img=imread('F:\视觉可步性深度学习训练方法\引用论文\例图\93_90.JPG','jpg');
[n1,n2,~]=size(img);
%我尽量写的简单易懂一点儿
%首先你使用aa=imread（‘1.jpg’） 这个1.jpg 只是个例子，具体看你的图片叫什么，对了把图片放在你的工作目录里面
%或者在1.jpg前面加上D:\研一\路径前缀
%好，前期处理完成，showline（aa），这个具体是aa还是bb就看你怎么取得变量名了。
%现在说一个比较关键的东西，学习matlab最踏实的办法，是哪个不会就help 它一下，但这个比较费时间因为讲的太细了。
imshow(img);
img2=img;
%img3=img;
%显示图片
x1=floor(ginput(5));%road
%函数运行到这儿，会弹出鼠标可以移动的十字架，在你觉得作为第一类样本的像素上，选5个点吧,加floor是确保得到的坐标都是整数。
x2=floor(ginput(5));%sky
%这个同理，不过是第二类了。
x3=floor(ginput(5));%building
x4=floor(ginput(5));%tree
x5=floor(ginput(5));%car
x6=floor(ginput(5));%trunk
%这个也同理.
x=zeros(10,3);
%每次分类的时候都有10个样本，同时每个样本都有三个属性，rgb。
for i=1:5%trunk;road-trunk
x(i,:)=reshape(img(x6(i,2),x6(i,1),:),1,3);
x(i+5,:)=reshape(img(x1(i,2),x1(i,1),:),1,3);
end
%赋值，因为图像像素值是N*m*3的矩阵，不好直接用，reshape为1*3的。
y=[ones(5,1);-1*ones(5,1)];
%标签集
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svm训练
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%使用svm
group=reshape(group,n1,n2);
group1=zeros(n1,n2);
%将group调整为一个n1*n2的存放类别标签的矩阵。
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%两者类别不一致，分界线
            % if i<130 %这个是我估计的值，选择 陆地与天交接线下面一点儿的坐标就行
             %img2(i,j,:)=255;
             %end
          if  group(i,j)==1
              %if i<130 
                   %img2(i,j,:)=[250,0,0];
                   group1(i,j)=1;
              % end
         
         end
     end
end
%imshow(img2)
for i=1:5%tree;car;-tree
x(i,:)=reshape(img(x4(i,2),x4(i,1),:),1,3);
x(i+5,:)=reshape(img(x5(i,2),x5(i,1),:),1,3);
end
%赋值，因为图像像素值是N*m*3的矩阵，不好直接用，reshape为1*3的。
y=[ones(5,1);-1*ones(5,1)];
%标签集
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svm训练
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%使用svm
group=reshape(group,n1,n2);
group2=zeros(n1,n2);
%将group调整为一个n1*n2的存放类别标签的矩阵。
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%两者类别不一致，分界线
            % if i<130 %这个是我估计的值，选择 陆地与天交接线下面一点儿的坐标就行
             %img2(i,j,:)=255;
             %end
          if  group(i,j)==1
              %if i<130 
                   %img2(i,j,:)=[250,0,0];
                   group2(i,j)=1;
              % end
         
         end
     end
end
%imshow(img2)
for i=1:5%car;road-tree,car,build
x(i,:)=reshape(img(x5(i,2),x5(i,1),:),1,3);
x(i+5,:)=reshape(img(x1(i,2),x1(i,1),:),1,3);
end
%赋值，因为图像像素值是N*m*3的矩阵，不好直接用，reshape为1*3的。
y=[ones(5,1);-1*ones(5,1)];
%标签集
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svm训练
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%使用svm
group=reshape(group,n1,n2);
group3=zeros(n1,n2);
%将group调整为一个n1*n2的存放类别标签的矩阵。
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%两者类别不一致，分界线
            % if i<130 %这个是我估计的值，选择 陆地与天交接线下面一点儿的坐标就行
             %img2(i,j,:)=255;
             %end
          if  group(i,j)==1
              %if i<130 
                   %img2(i,j,:)=[250,0,0];
                   group3(i,j)=1;
              % end
         
         end
     end
end
%imshow(img2)
for i=1:5%car;building-tree,car
x(i,:)=reshape(img(x5(i,2),x5(i,1),:),1,3);
x(i+5,:)=reshape(img(x3(i,2),x3(i,1),:),1,3);
end
%赋值，因为图像像素值是N*m*3的矩阵，不好直接用，reshape为1*3的。
y=[ones(5,1);-1*ones(5,1)];
%标签集
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svm训练
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%使用svm
group=reshape(group,n1,n2);
group4=zeros(n1,n2);
%将group调整为一个n1*n2的存放类别标签的矩阵。
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%两者类别不一致，分界线
            % if i<130 %这个是我估计的值，选择 陆地与天交接线下面一点儿的坐标就行
             %img2(i,j,:)=255;
             %end
          if  group(i,j)==1
              %if i<130 
                   %img2(i,j,:)=[250,0,0];
                   group4(i,j)=1;
              % end
         
         end
     end
end
%imshow(img2)

for i=1:5%sky;road-sky,trunk,build
x(i,:)=reshape(img(x2(i,2),x2(i,1),:),1,3);
x(i+5,:)=reshape(img(x1(i,2),x1(i,1),:),1,3);
end
%赋值，因为图像像素值是N*m*3的矩阵，不好直接用，reshape为1*3的。
y=[ones(5,1);-1*ones(5,1)];
%标签集
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svm训练
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%使用svm
group=reshape(group,n1,n2);
group5=zeros(n1,n2);
%将group调整为一个n1*n2的存放类别标签的矩阵。
for i=1:n1-1
     for j= 1:n2
          if group(i,j)==1
              
             group5(i,j)=1;            
         
         end
     end
end
%imshow(img2)
group6=zeros(n1,n2);
for i=1:n1-1
     for j= 1:n2
        
          if  group3(i,j)==1&&group4(i,j)~=1%building
            img2(i,j,:)=[245,0,0];  
            group6(i,j)=1;
          end 
          if  group5(i,j)==1&&~(group3(i,j)==1&&group4(i,j)~=1)%sky
            img2(i,j,:)=[192,205,221]; 
            group6(i,j)=1;
          end
          
           if  group2(i,j)==1%tree
               img2(i,j,:)=[66,71,41];
               group6(i,j)=1;
          end
          if  group1(i,j)==1||(group4(i,j)==1&&group2(i,j)~=1)%truck
              img2(i,j,:)=[0,0,255];  
              group6(i,j)=1;
          end
          if ~(group3(i,j)==1||group5(i,j)==1)%road
              img2(i,j,:)=[193,174,160];  
              group6(i,j)=1;
          end
    end
end
for i=1:n1-1
     for j= 1:n2
        if  group6(i,j)~=1
         img2(i,j,:)=[245,0,0]; 
        end
   end
end
imshow(img2)