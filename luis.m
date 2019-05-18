x = 0:0.1:10;
n=10;
C = {'k','b','r','g','y',[5 6 7],[8 2 6]}
legend_string=['','','','','','','','',];
legend_string

Legend_cell=cell(n,1)

for i=1:1:n
l=randi(8,1,1);
r=randi(8,1,1);
while l>r
r=randi(10,1,1);
end
y = sin(x*pi)+l-3*r;
%y=1/( 1+e^(?a(x?c)))
plot(x,y,'o')
hold on;
xlabel('sigmf, P = [l r] with l<r')
Legend_cell{i}=strcat('l=',num2str(l));
%ylim([-0.05 1.05])

end
legend(Legend_cell);
