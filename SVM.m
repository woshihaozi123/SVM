clc;clear;
%����ѧ�߿���
img=imread('F:\�Ӿ��ɲ������ѧϰѵ������\��������\��ͼ\93_90.JPG','jpg');
[n1,n2,~]=size(img);
%�Ҿ���д�ļ��׶�һ���
%������ʹ��aa=imread����1.jpg���� ���1.jpg ֻ�Ǹ����ӣ����忴���ͼƬ��ʲô�����˰�ͼƬ������Ĺ���Ŀ¼����
%������1.jpgǰ�����D:\��һ\·��ǰ׺
%�ã�ǰ�ڴ�����ɣ�showline��aa�������������aa����bb�Ϳ�����ôȡ�ñ������ˡ�
%����˵һ���ȽϹؼ��Ķ�����ѧϰmatlab��̤ʵ�İ취�����ĸ������help ��һ�£�������ȽϷ�ʱ����Ϊ����̫ϸ�ˡ�
imshow(img);
img2=img;
%img3=img;
%��ʾͼƬ
x1=floor(ginput(5));%road
%�������е�������ᵯ���������ƶ���ʮ�ּܣ����������Ϊ��һ�������������ϣ�ѡ5�����,��floor��ȷ���õ������궼��������
x2=floor(ginput(5));%sky
%���ͬ�������ǵڶ����ˡ�
x3=floor(ginput(5));%building
x4=floor(ginput(5));%tree
x5=floor(ginput(5));%car
x6=floor(ginput(5));%trunk
%���Ҳͬ��.
x=zeros(10,3);
%ÿ�η����ʱ����10��������ͬʱÿ�����������������ԣ�rgb��
for i=1:5%trunk;road-trunk
x(i,:)=reshape(img(x6(i,2),x6(i,1),:),1,3);
x(i+5,:)=reshape(img(x1(i,2),x1(i,1),:),1,3);
end
%��ֵ����Ϊͼ������ֵ��N*m*3�ľ��󣬲���ֱ���ã�reshapeΪ1*3�ġ�
y=[ones(5,1);-1*ones(5,1)];
%��ǩ��
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svmѵ��
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%ʹ��svm
group=reshape(group,n1,n2);
group1=zeros(n1,n2);
%��group����Ϊһ��n1*n2�Ĵ������ǩ�ľ���
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%�������һ�£��ֽ���
            % if i<130 %������ҹ��Ƶ�ֵ��ѡ�� ½�����콻��������һ������������
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
%��ֵ����Ϊͼ������ֵ��N*m*3�ľ��󣬲���ֱ���ã�reshapeΪ1*3�ġ�
y=[ones(5,1);-1*ones(5,1)];
%��ǩ��
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svmѵ��
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%ʹ��svm
group=reshape(group,n1,n2);
group2=zeros(n1,n2);
%��group����Ϊһ��n1*n2�Ĵ������ǩ�ľ���
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%�������һ�£��ֽ���
            % if i<130 %������ҹ��Ƶ�ֵ��ѡ�� ½�����콻��������һ������������
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
%��ֵ����Ϊͼ������ֵ��N*m*3�ľ��󣬲���ֱ���ã�reshapeΪ1*3�ġ�
y=[ones(5,1);-1*ones(5,1)];
%��ǩ��
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svmѵ��
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%ʹ��svm
group=reshape(group,n1,n2);
group3=zeros(n1,n2);
%��group����Ϊһ��n1*n2�Ĵ������ǩ�ľ���
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%�������һ�£��ֽ���
            % if i<130 %������ҹ��Ƶ�ֵ��ѡ�� ½�����콻��������һ������������
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
%��ֵ����Ϊͼ������ֵ��N*m*3�ľ��󣬲���ֱ���ã�reshapeΪ1*3�ġ�
y=[ones(5,1);-1*ones(5,1)];
%��ǩ��
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svmѵ��
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%ʹ��svm
group=reshape(group,n1,n2);
group4=zeros(n1,n2);
%��group����Ϊһ��n1*n2�Ĵ������ǩ�ľ���
for i=1:n1-1
     for j= 1:n2
         %if group(i,j)*group(i+1,j)<1%�������һ�£��ֽ���
            % if i<130 %������ҹ��Ƶ�ֵ��ѡ�� ½�����콻��������һ������������
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
%��ֵ����Ϊͼ������ֵ��N*m*3�ľ��󣬲���ֱ���ã�reshapeΪ1*3�ġ�
y=[ones(5,1);-1*ones(5,1)];
%��ǩ��
x=double(x);
y=double(y);
%x=floor(x);
%y=floor(y);
svmstruct=svmtrain(x,y);
%svmѵ��
group=svmclassify(svmstruct,double(reshape(img,n1*n2,3)));
%ʹ��svm
group=reshape(group,n1,n2);
group5=zeros(n1,n2);
%��group����Ϊһ��n1*n2�Ĵ������ǩ�ľ���
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