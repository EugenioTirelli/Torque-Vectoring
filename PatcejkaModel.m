clear all

syms sratio sangle 
Fzpokemon = 4000;

CONTACT = 0.15;
RWHEEL = 0.3;
KTL = 90000;
KR = 4e8;
KTV = 110000;

b0 = 1.5;
b1 = 0;
b2 = 1100;
b3 = 0;
b4 = 300;
b5 = 0;
b6 = 0;
b7 = 0;
b8 = -2;
b9 =  0;
b10 = 0;
b11 = 0;
b12 = 0;
b13 = 0;

gamma = 0;
Fz = 4; %in kN

C = b0;
D = Fz * (b1*Fz+b2);
BCD = (b3*Fz^2 + b4*Fz)*exp(-b5*Fz);
B = BCD/(C*D);
H = b9*Fz + b10;
E = (b6*Fz^2 + b7*Fz+b8) * (1-b13*sign(sratio + H));
V = b11*Fz+b12;
Bx1 = B*(sratio+H);
F_long = D*sin(C*atan(Bx1-E*(Bx1-atan(Bx1)))) + V;

a0 =  1.4;
a1 =  0;
a2 =  1100;
a3 =  1100;
a4 =  10;
a5 =  0;
a6 =  0;
a7 = -2;
a8 =  0;
a9 =  0;
a10 = 0;
a11 = 0;
a12 = 0;
a13 = 0;
a14 = 0;
a15 = 0;
a16 = 0;
a17 = 0;

CA = a0;
DA = Fz*(a1*Fz + a2) * (1-a15*gamma^2);
BCDA = a3*sin(atan(Fz/a4)*2)*(1-a5*abs(gamma));
BA = BCDA/(CA*DA);
HA = a8*Fz + a9 + a10*gamma;
EA = (a6*Fz + a7)*(1-(a16*gamma + a17)*sign(sangle + HA));
VA = a11*Fz + a12 + (a13*Fz + a14)*gamma*Fz;
Bx1A = BA*(sangle + HA);
F_lat = DA*sin(CA*atan(Bx1A-EA*(Bx1A-atan(Bx1A)))) + VA;

F_xi_pokemon = (6*RWHEEL*KTL*Fzpokemon)*sratio/(CONTACT*KR)*100;

F_eta_pokemon = (6*RWHEEL*KTV*Fzpokemon*sangle)/(CONTACT*KR)*(180/pi);

fplot(F_lat, [-15, 15])
hold on 
fplot(F_eta_pokemon, [-15, 15])
ylim([-5000, 5000])
hold off
grid on
legend("FPatcejka", "Fpokemon")