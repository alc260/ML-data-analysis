Y = load('clustering_data.txt');

Z = linkage(Y,'complete','euclidean');
dendrogram(Z,0);
C = cluster(Z,'maxclust' ,4);
scatter(Y(:,1),Y(:,2),10,C);

%cutoff = median([Z(end-2,3) Z(end-1,3)]);
%dendrogram(Z,'ColorThreshold',cutoff)

%figure;
%plot(C(idx==1,1),C(idx==1,2),'r.','MarkerSize',12)
%hold on
%plot(C(idx==2,1),C(idx==2,2),'b.','MarkerSize',12)
%hold on
%plot(cluster_data(idx==3,1),cluster_data(idx==3,2),'g.','MarkerSize',12)
%hold on
%plot(cluster_data(idx==4,1),cluster_data(idx==4,2),'y.','MarkerSize',12)
%plot(C,Z, ".");