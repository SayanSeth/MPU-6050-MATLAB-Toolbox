function CUBEH = Plot_Cube(yaw,pitch,roll,Ax,CUBEH)
if ~exist('CUBEH','var')
    CUBEH = [];
end
C1=[0 0 0];
C2=[1 1 1];
C3=[0 0 1];
C4=[0 1 0];
C5=[1 0 0];
C6=[1 1 0];

%Height
H = 0.5; 
%Width
W = 1;
%Depth
D = 1;
R{3} = [1 0 0;0 cos(yaw) -sin(yaw);0 sin(yaw) cos(yaw)];
R{1} = [cos(pitch) 0 sin(pitch);0 1 0;-sin(pitch) 0 cos(pitch)];
R{2} = [cos(roll) -sin(roll) 0;sin(roll) cos(roll) 0;0 0 1];
    if ~exist('Ax');
        F = figure;
        Ax = axes('CameraPosition',[-9.1314 -11.9003 8.6603]);
        hold on;
    end
    Vertex=[-D -W -H;
            +D -W -H;
            +D +W -H;
            -D +W -H;%Cambio
            -D -W +H;
            +D -W +H;
            +D +W +H;
            -D +W +H]/2;
    for rot = 1:3
        for v = 1:8
            Vertex(v,:) = Vertex(v,:)*R{rot};
        end
    end
    %Base
    idx1 = [1 2 3 4 1];
%     idx2 = [1 5 6 2 3 7 8 4];
%     idx3 = [5 6 7 8 5];
    %Culo
    idx2 = [5 6 7 8 5];
    %Lados
    idx3 = [1 5 6 2];
    idx4 = [2 6 7 3];
    idx5 = [3 7 8 4];
    idx6 = [4 8 5 1];
    
    if isempty(CUBEH)
        CUBEH(1) = fill3(Vertex(idx1,1),Vertex(idx1,2),Vertex(idx1,3),C1);
        CUBEH(2) = fill3(Vertex(idx2,1),Vertex(idx2,2),Vertex(idx2,3),C2);
        CUBEH(3) = fill3(Vertex(idx3,1),Vertex(idx3,2),Vertex(idx3,3),C3);
        CUBEH(4) = fill3(Vertex(idx4,1),Vertex(idx4,2),Vertex(idx4,3),C4);
        CUBEH(5) = fill3(Vertex(idx5,1),Vertex(idx5,2),Vertex(idx5,3),C5);
        CUBEH(6) = fill3(Vertex(idx6,1),Vertex(idx6,2),Vertex(idx6,3),C6);
        alpha(0.4);
    else
        set(CUBEH(1),'XData',Vertex(idx1,1),'YData',Vertex(idx1,2),'ZData',Vertex(idx1,3));
        set(CUBEH(2),'XData',Vertex(idx2,1),'YData',Vertex(idx2,2),'ZData',Vertex(idx2,3));
        set(CUBEH(3),'XData',Vertex(idx3,1),'YData',Vertex(idx3,2),'ZData',Vertex(idx3,3));
        set(CUBEH(4),'XData',Vertex(idx4,1),'YData',Vertex(idx4,2),'ZData',Vertex(idx4,3));
        set(CUBEH(5),'XData',Vertex(idx5,1),'YData',Vertex(idx5,2),'ZData',Vertex(idx5,3));
        set(CUBEH(6),'XData',Vertex(idx6,1),'YData',Vertex(idx6,2),'ZData',Vertex(idx6,3));
    end
end