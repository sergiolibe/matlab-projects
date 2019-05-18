c=1;
close;

div=100;
colormap=zeros(div+1,3);
for i=0:255/div:255
    colormap(c,:)=[255-i,0,i]/255;   
    c=c+1;
end


x=[0 1];
y=[1 1];

for i=1:length(colormap)
    plot(x,y*i,'Color',colormap(i,:));
    hold on;
end
set(gca,'color',[0 0 0])
%set(gcf, 'Colormap', colormap);
colorbar


length(colormap)
colormap(5,:)