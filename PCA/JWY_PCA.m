function [pc,scores,latent]=JWY_PCA(data)

[evec,eva]=eig(JWY_cov(data))
%eva=eva(:,end:-1:1)
latent=JWY_sum(eva)/JWY_sum(eva(:));

%pc=evec(end:-1:1,:);
pc=evec;
scores=data*pc^-1;
latent=latent(end:-1:1)
pc=evec(:,end:-1:1);
scores=scores(:,end:-1:1)
end