% condin = [lc,thetac, phic, pl, ptheta]
function [t,f] = raytracerEllis(ang)
% Posicion de la camara
    lc = 1;
    thetac = pi/2;
    phic = 0;

% Propiedades del agujero negro
    rho = 0.7;
    W = 0.05;
    a = 0.5;
    M = W/1.42953;

% Angulos
    phics   = ang(1);
    thetacs = ang(2);
    
% (4) Choose a direction...
    Nx = sin(thetacs)*cos(phics);
    Ny = sin(thetacs)*sin(phics);
    Nz = cos(thetacs);
    nl     = -Nx;
    nphi   = -Ny;
    ntheta = Nz;

% (5) Compute the incoming light ray's canonical momenta
    pl     = nl;
    ptheta = r(rho,M,lc,a)*ntheta;
    pphi   = r(rho,M,lc,a)*sin(thetacs)*nphi;
    b = pphi;
    B = sqrt(r(rho,M,lc,a)^2*(ntheta^2+nphi^2));

% (6) Solve the system

    [t,y] = ode23(@(t,Y) odefun(t,Y,rho,M,a,b,B) , [0,-10^4] , [lc,thetac, phic, pl, ptheta]);
    lf = y(:,1);
    thetaf = y(:,2);
    phif = y(:,3);
    f = [lf,thetaf,phif];
end

function r=r(rho,M,l,a)
    r = sqrt(rho^2+l^2);
end


function drdl=drdl(rho,M,l,a)
    drdl = l/sqrt(r(rho,M,l,a)^2+l^2);
end

% Y = [l, theta, phi, pl, ptheta]
function dYdt = odefun(t,Y,rho,M,a,b,B)

dYdt = [ Y(4);
         Y(5)./(r(rho,M,Y(1),a).^2);
         b./(r(rho,M,Y(1),a).^2.*sin(Y(2)).^2);
         B.^2*drdl(rho,M,Y(1),a)./(r(rho,M,Y(1),a).^3);
         b^2./(r(rho,M,Y(1),a).^2).*cos(Y(2))./(sin(Y(2)).^3)];
end