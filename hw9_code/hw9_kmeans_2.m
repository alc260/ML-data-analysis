cluster_data = load("clustering_data.txt");
mincluster = realmax;
minclustergroup = zeros(1,2);
X = cluster_data(:,1);
Y = cluster_data(:,2);

c1 = zeros(30,1);
c2 = zeros(30,1);
c3 = zeros(30,1);
c4 = zeros(30,1);
ctotal = zeros(30,4);

cluster1 = 0;
cluster2 = 0;
cluster3 = 0;
cluster4 = 0;

%plot(X,Y,".");

opts = statset('Display','final');
[idx,C] = kmeans(cluster_data,4);

figure;
plot(cluster_data(idx==1,1),cluster_data(idx==1,2),'r.','MarkerSize',12)
hold on
plot(cluster_data(idx==2,1),cluster_data(idx==2,2),'b.','MarkerSize',12)
hold on
plot(cluster_data(idx==3,1),cluster_data(idx==3,2),'g.','MarkerSize',12)
hold on
plot(cluster_data(idx==4,1),cluster_data(idx==4,2),'y.','MarkerSize',12)

plot(C(:,1),C(:,2),'kx','MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids','Location','NW')
title 'Cluster Assignments and Centroids'
hold off

for k=1:30
[idx,C, sum] = kmeans(cluster_data,4);
    for i=1:200
        if idx(i) == 1
           cluster1 = cluster1 + 1; 
        elseif idx(i) == 2
           cluster2 = cluster2 + 1; 
        elseif idx(i) == 3
            cluster3 = cluster3 + 1;
        elseif idx(i) == 4
            cluster4 = cluster4 + 1;
        end
        
    end
    
    c1(k) = cluster1;
    c2(k) = cluster2;
    c3(k) = cluster3;
    c4(k) = cluster4; 
    
    cluster1 = 0;
    cluster2 = 0;
    cluster3 = 0;
    cluster4 = 0;
    
end 

ctotal(:,1) = c1;
ctotal(:,2) = c2;
ctotal(:,3) = c3;
ctotal(:,4) = c4;



function distance = edistance(x1, y1, x2, y2)
  distance = sqrt((x2 - x1)^(2) + (y2 - y1)^(2));
end