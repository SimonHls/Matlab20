
g=500;

t = [-g:g/1000:g];
w1=0.8; w2=0.85;
y1=sin(w1*t);y2=sin(w2*t);
s=(y1+y2);

plot(t,y1,'g',t,y2,'bl', t,s);

xachse=([-1.1*g:g/0.0001:1.1*g]);

xlabel("Zeit t in sek", "Color","bl", "FontSize",16);
ylabel("Amplitude", "Color","bl","FontSize",16);
title("Meine Lieblingsschwebung",... 
"FontSize", 20, "Color", "bl");
xlim([-g*1.1,g*1.1]);
ylim([-2.5,2.5]);





