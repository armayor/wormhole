tic
% Carga de las imagenes
Ig = imread('universe.jpg');
Is = imread('saturn.jpg');
[nyg, nxg, nzg] = size(Ig);
[nys, nxs, nzs] = size(Is);
ny = min(nyg,nys);
nx = min(nxs,nxg);
Ig = imresize(Ig,[ny,nx]);
Is = imresize(Is,[ny,nx]);
[nyg, nxg, nzg] = size(Ig);
[nys, nxs, nzs] = size(Is);

% Resolucion de la imagen final
resphi   = 1280;
restheta = 720;
copia    = Ig(1:restheta, 1:resphi,:);


phic   = linspace(0,2*pi,resphi);
thetac = linspace(0,pi,restheta);

for i=1:resphi
    for j=1:restheta
        
    ang = [phic(i),thetac(j)];
    [t,y]=raytracerEllis(ang);
    lf = y(end,1);
    thetaf = mod(y(end,2),pi);
    phif   = mod(y(end,3),2*pi);
    phi_im   = round(1+(nxg-1)/(2*pi).*phif);
    theta_im = round(1+(nyg-1)/(pi).*thetaf);
    
    if lf<0
            copia(j,i,:) = Is(theta_im,phi_im,:);
        else
            copia(j,i,:) = Ig(theta_im,phi_im,:);
        end
    
    end
end



imshow(copia)
toc

