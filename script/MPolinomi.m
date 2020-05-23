clear
clc
close all

load_dataset

%Normalizzazione 
x1_id=x1_id/365;
x2_id=x2_id/24;
x1_val=x1_val/365;
x2_val=x2_val/24;
[X1,X2] = meshgrid(linspace(0,1,365), linspace(0,1,24));

%% Modello polinomiale terzo grado
phi_B=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id];
phi_B_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:)];

[theta_B, std_theta_B, q_B, y_hat_B, epsilon_B, SSR_B, y_hat_B_ext, y_hat_B_ext_mat] = identificazioneModello(phi_B, phi_B_ext, X1, y_id_dt);

% Plot Dati + stima (terzo grado)
stampaModello('Modello polinomiale III grado',X1,X2,y_hat_B_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di quarto grado
phi_C=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3)];
phi_C_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:)...
    X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3)];

[theta_C, std_theta_C, q_C, y_hat_C, epsilon_C, SSR_C, y_hat_C_ext, y_hat_C_ext_mat] = identificazioneModello(phi_C, phi_C_ext, X1, y_id_dt);

% Plot Dati + stima (quarto grado)
stampaModello('Modello polinomiale IV grado',X1,X2,y_hat_C_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di quinto grado
phi_D=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)];
phi_D_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)];

[theta_D, std_theta_D, q_D, y_hat_D, epsilon_D, SSR_D, y_hat_D_ext, y_hat_D_ext_mat] = identificazioneModello(phi_D, phi_D_ext, X1, y_id_dt);

% Plot Dati + stima (quinto grado)
stampaModello('Modello polinomiale V grado',X1,X2,y_hat_D_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di sesto grado
phi_E=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3)];
phi_E_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3)];

[theta_E, std_theta_E, q_E, y_hat_E, epsilon_E, SSR_E, y_hat_E_ext, y_hat_E_ext_mat] = identificazioneModello(phi_E, phi_E_ext, X1, y_id_dt);

% Plot Dati + stima (sesto grado)
stampaModello('Modello polinomiale VI grado',X1,X2,y_hat_E_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di settimo grado
phi_F=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3) x1_id.^7 x2_id.^7 x1_id.^6.*x2_id x1_id.*(x2_id.^6) (x1_id.^5).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^5) (x1_id.^4).*(x2_id.^3) (x1_id.^3).*(x2_id.^4)];
phi_F_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3) X1(:).^7 X2(:).^7 (X1(:).^6).*X2(:) X1(:).*(X2(:).^6) (X1(:).^5).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^5) (X1(:).^4).*(X2(:).^3) (X1(:).^3).*(X2(:).^4)];

[theta_F, std_theta_F, q_F, y_hat_F, epsilon_F, SSR_F, y_hat_F_ext, y_hat_F_ext_mat] = identificazioneModello(phi_F, phi_F_ext, X1, y_id_dt);

% Plot Dati + stima (settimo grado)
stampaModello('Modello polinomiale VII grado',X1,X2,y_hat_F_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di ottavo grado
phi_G=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3) x1_id.^7 x2_id.^7 x1_id.^6.*x2_id x1_id.*(x2_id.^6) (x1_id.^5).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^5) (x1_id.^4).*(x2_id.^3) (x1_id.^3).*(x2_id.^4) x1_id.^8 x2_id.^8 x1_id.^7.*x2_id x1_id.*(x2_id.^7) (x1_id.^6).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^6) (x1_id.^5).*(x2_id.^3) (x1_id.^3).*(x2_id.^5) (x1_id.^4).*(x2_id.^4)];
phi_G_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3) X1(:).^7 X2(:).^7 (X1(:).^6).*X2(:) X1(:).*(X2(:).^6) (X1(:).^5).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^5) (X1(:).^4).*(X2(:).^3) (X1(:).^3).*(X2(:).^4) X1(:).^8 X2(:).^8 (X1(:).^7).*X2(:) X1(:).*(X2(:).^7) (X1(:).^6).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^6) (X1(:).^5).*(X2(:).^3) (X1(:).^3).*(X2(:).^5) (X1(:).^4).*(X2(:).^4)];

[theta_G, std_theta_G, q_G, y_hat_G, epsilon_G, SSR_G, y_hat_G_ext, y_hat_G_ext_mat] = identificazioneModello(phi_G, phi_G_ext, X1, y_id_dt);

% Plot Dati + stima (ottavo grado)
stampaModello('Modello polinomiale VIII grado',X1,X2,y_hat_G_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di nono grado
phi_H=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3) x1_id.^7 x2_id.^7 x1_id.^6.*x2_id x1_id.*(x2_id.^6) (x1_id.^5).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^5) (x1_id.^4).*(x2_id.^3) (x1_id.^3).*(x2_id.^4) x1_id.^8 x2_id.^8 x1_id.^7.*x2_id x1_id.*(x2_id.^7) (x1_id.^6).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^6) (x1_id.^5).*(x2_id.^3) (x1_id.^3).*(x2_id.^5) (x1_id.^4).*(x2_id.^4) x1_id.^9 x2_id.^9 x1_id.^8.*x2_id x1_id.*(x2_id.^8) (x1_id.^7).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^7) (x1_id.^6).*(x2_id.^3) (x1_id.^3).*(x2_id.^6) (x1_id.^5).*(x2_id.^4) (x1_id.^4).*(x2_id.^5)];
phi_H_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3) X1(:).^7 X2(:).^7 (X1(:).^6).*X2(:) X1(:).*(X2(:).^6) (X1(:).^5).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^5) (X1(:).^4).*(X2(:).^3) (X1(:).^3).*(X2(:).^4) X1(:).^8 X2(:).^8 (X1(:).^7).*X2(:) X1(:).*(X2(:).^7) (X1(:).^6).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^6) (X1(:).^5).*(X2(:).^3) (X1(:).^3).*(X2(:).^5) (X1(:).^4).*(X2(:).^4) X1(:).^9 X2(:).^9 (X1(:).^8).*X2(:) X1(:).*(X2(:).^8) (X1(:).^7).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^7) (X1(:).^6).*(X2(:).^3) (X1(:).^3).*(X2(:).^6) (X1(:).^5).*(X2(:).^4) (X1(:).^4).*(X2(:).^5)];

[theta_H, std_theta_H, q_H, y_hat_H, epsilon_H, SSR_H, y_hat_H_ext, y_hat_H_ext_mat] = identificazioneModello(phi_H, phi_H_ext, X1, y_id_dt);

% Plot Dati + stima (nono grado)
stampaModello('Modello polinomiale IX grado',X1,X2,y_hat_H_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di decimo grado
phi_I=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3) x1_id.^7 x2_id.^7 x1_id.^6.*x2_id x1_id.*(x2_id.^6) (x1_id.^5).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^5) (x1_id.^4).*(x2_id.^3) (x1_id.^3).*(x2_id.^4) x1_id.^8 x2_id.^8 x1_id.^7.*x2_id x1_id.*(x2_id.^7) (x1_id.^6).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^6) (x1_id.^5).*(x2_id.^3) (x1_id.^3).*(x2_id.^5) (x1_id.^4).*(x2_id.^4) x1_id.^9 x2_id.^9 x1_id.^8.*x2_id x1_id.*(x2_id.^8) (x1_id.^7).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^7) (x1_id.^6).*(x2_id.^3) (x1_id.^3).*(x2_id.^6) (x1_id.^5).*(x2_id.^4) (x1_id.^4).*(x2_id.^5) x1_id.^10 x2_id.^10 x1_id.^9.*x2_id x1_id.*(x2_id.^9) (x1_id.^8).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^8) (x1_id.^7).*(x2_id.^3) (x1_id.^3).*(x2_id.^7) (x1_id.^6).*(x2_id.^4) (x1_id.^4).*(x2_id.^6) (x1_id.^5).*(x2_id.^5)];
phi_I_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3) X1(:).^7 X2(:).^7 (X1(:).^6).*X2(:) X1(:).*(X2(:).^6) (X1(:).^5).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^5) (X1(:).^4).*(X2(:).^3) (X1(:).^3).*(X2(:).^4) X1(:).^8 X2(:).^8 (X1(:).^7).*X2(:) X1(:).*(X2(:).^7) (X1(:).^6).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^6) (X1(:).^5).*(X2(:).^3) (X1(:).^3).*(X2(:).^5) (X1(:).^4).*(X2(:).^4) X1(:).^9 X2(:).^9 (X1(:).^8).*X2(:) X1(:).*(X2(:).^8) (X1(:).^7).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^7) (X1(:).^6).*(X2(:).^3) (X1(:).^3).*(X2(:).^6) (X1(:).^5).*(X2(:).^4) (X1(:).^4).*(X2(:).^5) X1(:).^10 X2(:).^10 (X1(:).^9).*X2(:) X1(:).*(X2(:).^9) (X1(:).^8).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^8) (X1(:).^7).*(X2(:).^3) (X1(:).^3).*(X2(:).^7) (X1(:).^6).*(X2(:).^4) (X1(:).^4).*(X2(:).^6) (X1(:).^5).*(X2(:).^5)];

[theta_I, std_theta_I, q_I, y_hat_I, epsilon_I, SSR_I, y_hat_I_ext, y_hat_I_ext_mat] = identificazioneModello(phi_I, phi_I_ext, X1, y_id_dt);

% Plot Dati + stima (decimo grado)
stampaModello('Modello polinomiale X grado',X1,X2,y_hat_I_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% Modello polinomiale di undicesimo grado
phi_L=[ones(n,1) x1_id x2_id x1_id.^2 x2_id.^2 x1_id.*x2_id x1_id.^3 x2_id.^3 (x1_id.^2).*x2_id x1_id.*(x2_id.^2) x1_id.^4 x2_id.^4 (x1_id.^2).*(x2_id.^2) (x1_id.^3).*x2_id x1_id.*(x2_id.^3) ...
     x1_id.^5 x2_id.^5 (x1_id.^4).*x2_id x1_id.*(x2_id.^4) (x1_id.^3).*(x2_id.^2) (x1_id.^2).*(x2_id.^3)...
     x1_id.^6 x2_id.^6 x1_id.^5.*x2_id x1_id.*(x2_id.^5) (x1_id.^4).*(x2_id.^2) (x1_id.^2).*(x2_id.^4) (x1_id.^3).*(x2_id.^3) x1_id.^7 x2_id.^7 x1_id.^6.*x2_id x1_id.*(x2_id.^6) (x1_id.^5).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^5) (x1_id.^4).*(x2_id.^3) (x1_id.^3).*(x2_id.^4) x1_id.^8 x2_id.^8 x1_id.^7.*x2_id x1_id.*(x2_id.^7) (x1_id.^6).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^6) (x1_id.^5).*(x2_id.^3) (x1_id.^3).*(x2_id.^5) (x1_id.^4).*(x2_id.^4) x1_id.^9 x2_id.^9 x1_id.^8.*x2_id x1_id.*(x2_id.^8) (x1_id.^7).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^7) (x1_id.^6).*(x2_id.^3) (x1_id.^3).*(x2_id.^6) (x1_id.^5).*(x2_id.^4) (x1_id.^4).*(x2_id.^5) x1_id.^10 x2_id.^10 x1_id.^9.*x2_id x1_id.*(x2_id.^9) (x1_id.^8).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^8) (x1_id.^7).*(x2_id.^3) (x1_id.^3).*(x2_id.^7) (x1_id.^6).*(x2_id.^4) (x1_id.^4).*(x2_id.^6) (x1_id.^5).*(x2_id.^5)  x1_id.^11 x2_id.^11 x1_id.^10.*x2_id x1_id.*(x2_id.^10) (x1_id.^9).*(x2_id.^2) ...
     (x1_id.^2).*(x2_id.^9) (x1_id.^8).*(x2_id.^3) (x1_id.^3).*(x2_id.^8) (x1_id.^7).*(x2_id.^4) (x1_id.^4).*(x2_id.^7) (x1_id.^6).*(x2_id.^5) (x1_id.^5).*(x2_id.^6)];
phi_L_ext = [ones(length(X1(:)),1) X1(:) X2(:) X1(:).^2 X2(:).^2 X1(:).*X2(:) X1(:).^3 X2(:).^3 (X1(:).^2).*X2(:) X1(:).*(X2(:).^2) X1(:).^4 X2(:).^4 ...
    (X1(:).^2).*(X2(:).^2) (X1(:).^3).*X2(:) X1(:).*(X2(:).^3) X1(:).^5 X2(:).^5 (X1(:).^4).*X2(:) X1(:).*(X2(:).^4) (X1(:).^3).*(X2(:).^2) (X1(:).^2).*(X2(:).^3)...
    X1(:).^6 X2(:).^6 (X1(:).^5).*X2(:) X1(:).*(X2(:).^5) (X1(:).^4).*(X2(:).^2) (X1(:).^2).*(X2(:).^4) (X1(:).^3).*(X2(:).^3) X1(:).^7 X2(:).^7 (X1(:).^6).*X2(:) X1(:).*(X2(:).^6) (X1(:).^5).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^5) (X1(:).^4).*(X2(:).^3) (X1(:).^3).*(X2(:).^4) X1(:).^8 X2(:).^8 (X1(:).^7).*X2(:) X1(:).*(X2(:).^7) (X1(:).^6).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^6) (X1(:).^5).*(X2(:).^3) (X1(:).^3).*(X2(:).^5) (X1(:).^4).*(X2(:).^4) X1(:).^9 X2(:).^9 (X1(:).^8).*X2(:) X1(:).*(X2(:).^8) (X1(:).^7).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^7) (X1(:).^6).*(X2(:).^3) (X1(:).^3).*(X2(:).^6) (X1(:).^5).*(X2(:).^4) (X1(:).^4).*(X2(:).^5) X1(:).^10 X2(:).^10 (X1(:).^9).*X2(:) X1(:).*(X2(:).^9) (X1(:).^8).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^8) (X1(:).^7).*(X2(:).^3) (X1(:).^3).*(X2(:).^7) (X1(:).^6).*(X2(:).^4) (X1(:).^4).*(X2(:).^6) (X1(:).^5).*(X2(:).^5) X1(:).^11 X2(:).^11 (X1(:).^10).*X2(:) X1(:).*(X2(:).^10) (X1(:).^9).*(X2(:).^2) ...
    (X1(:).^2).*(X2(:).^9) (X1(:).^8).*(X2(:).^3) (X1(:).^3).*(X2(:).^8) (X1(:).^7).*(X2(:).^4) (X1(:).^4).*(X2(:).^7) (X1(:).^6).*(X2(:).^5) (X1(:).^5).*(X2(:).^6)];

[theta_L, std_theta_L, q_L, y_hat_L, epsilon_L, SSR_L, y_hat_L_ext, y_hat_L_ext_mat] = identificazioneModello(phi_L, phi_L_ext, X1, y_id_dt);

% Plot Dati + stima (undici grado)
stampaModello('Modello polinomiale XI grado',X1,X2,y_hat_L_ext_mat+p, x1_id, x2_id, y_id_dt+p)

%% TEST F
alpha = 0.05;

% Polinomio quarto vs terzo
[f_alpha1,f1] = TestF(alpha,n,q_C,SSR_B, SSR_C);

% Polinomio quinto vs quarto
[f_alpha2,f2] = TestF(alpha,n,q_D,SSR_C, SSR_D);

% Polinomio sesto vs quinto
[f_alpha3,f3] = TestF(alpha,n,q_E,SSR_D, SSR_E);

% Polinomio settimo vs sesto
[f_alpha4,f4] = TestF(alpha,n,q_F,SSR_E, SSR_F);

% Polinomio ottavo vs settimo
[f_alpha5,f5] = TestF(alpha,n,q_G,SSR_F, SSR_G);

% Polinomio nono vs ottavo
[f_alpha6,f6] = TestF(alpha,n,q_H,SSR_G, SSR_H);

% Polinomio decimo vs nono
[f_alpha7,f7] = TestF(alpha,n,q_I,SSR_H, SSR_I);

% Polinomio undicesimo vs decimo
[f_alpha8,f8] = TestF(alpha,n,q_L,SSR_I, SSR_L);
%% FPE, AIC, MDL
%Terzo grado
[FPE3,AIC3,MDL3] = TestOggettivi(n, q_B, SSR_B);

%Quarto grado
[FPE4,AIC4,MDL4] = TestOggettivi(n, q_C, SSR_C);

%Quinto grado
[FPE5,AIC5,MDL5] = TestOggettivi(n, q_D, SSR_D);

%Sesto grado
[FPE6,AIC6,MDL6] = TestOggettivi(n, q_E, SSR_E);

%Settimo grado
[FPE7,AIC7,MDL7] = TestOggettivi(n, q_F, SSR_F);

%Ottavo grado
[FPE8,AIC8,MDL8] = TestOggettivi(n, q_G, SSR_G);

%Nono grado
[FPE9,AIC9,MDL9] = TestOggettivi(n, q_H, SSR_H);

%Decimo grado
[FPE10,AIC10,MDL10] = TestOggettivi(n, q_I, SSR_I);

%Undicesimo grado
[FPE11,AIC11,MDL11] = TestOggettivi(n, q_L, SSR_L);

%% CROSSVALIDAZIONE
figure
plot3(x1_id,x2_id,y_id_dt+p,'bo')
hold on
plot3(x1_val, x2_val, y_val_dt+p, 'rx');
hold on
mesh(X1, X2, y_hat_D_ext_mat+p)
grid on
title('Crossvalidazione')
xlabel('Giorno dell''anno')
ylabel('Ora del giorno')
zlabel('Consumo elettrico')
legend('dati di identificazione', 'dati di validazione')
colorbar
colormap('default')

%Terzo grado
phi_B_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x2_val.^3 (x1_val.^2).*x2_val];
[yhat3Val, epsilon3Val, SSR3Val] = crossvalidazioneModello(phi_B_Val, theta_B, y_val_dt);

%Quarto grado
phi_C_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x2_val.^3 (x1_val.^2).*x2_val x1_val.*(x2_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x2_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3)];
[yhat4Val, epsilon4Val, SSR4Val] = crossvalidazioneModello(phi_C_Val, theta_C, y_val_dt);

%Quinto grado
phi_D_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x2_val.^3 (x1_val.^2).*x2_val x1_val.*(x2_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x2_val.^2) (x1_val.^3).*x2_val x1_id.*(x2_val.^3) ...
     x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)];
[yhat5Val, epsilon5Val, SSR5Val] = crossvalidazioneModello(phi_D_Val, theta_D, y_val_dt);

%Sesto grado
phi_E_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3)];
[yhat6Val, epsilon6Val, SSR6Val] = crossvalidazioneModello(phi_E_Val, theta_E, y_val_dt);

%Settimo grado
phi_F_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3) x1_val.^7 x2_val.^7 x1_val.^6.*x2_val x1_val.*(x2_val.^6) (x1_val.^5).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^5) (x1_val.^4).*(x2_val.^3) (x1_val.^3).*(x2_val.^4)];
[yhat7Val, epsilon7Val, SSR7Val] = crossvalidazioneModello(phi_F_Val, theta_F, y_val_dt);

%Ottavo grado
phi_G_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3) x1_val.^7 x2_val.^7 x1_val.^6.*x2_val x1_val.*(x2_val.^6) (x1_val.^5).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^5) (x1_val.^4).*(x2_val.^3) (x1_val.^3).*(x2_val.^4) x1_val.^8 x2_val.^8 x1_val.^7.*x2_val x1_val.*(x2_val.^7) (x1_val.^6).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^6) (x1_val.^5).*(x2_val.^3) (x1_val.^3).*(x2_val.^5) (x1_val.^4).*(x2_val.^4)];
[yhat8Val, epsilon8Val, SSR8Val] = crossvalidazioneModello(phi_G_Val, theta_G, y_val_dt);

%Nono grado
phi_H_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3) x1_val.^7 x2_val.^7 x1_val.^6.*x2_val x1_val.*(x2_val.^6) (x1_val.^5).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^5) (x1_val.^4).*(x2_val.^3) (x1_val.^3).*(x2_val.^4) x1_val.^8 x2_val.^8 x1_val.^7.*x2_val x1_val.*(x2_val.^7) (x1_val.^6).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^6) (x1_val.^5).*(x2_val.^3) (x1_val.^3).*(x2_val.^5) (x1_val.^4).*(x2_val.^4) x1_val.^9 x2_val.^9 x1_val.^8.*x2_val x1_val.*(x2_val.^8) (x1_val.^7).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^7) (x1_val.^6).*(x2_val.^3) (x1_val.^3).*(x2_val.^6) (x1_val.^5).*(x2_val.^4) (x1_val.^4).*(x2_val.^5)];
[yhat9Val, epsilon9Val, SSR9Val] = crossvalidazioneModello(phi_H_Val, theta_H, y_val_dt);

%Decimo grado
phi_I_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3) x1_val.^7 x2_val.^7 x1_val.^6.*x2_val x1_val.*(x2_val.^6) (x1_val.^5).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^5) (x1_val.^4).*(x2_val.^3) (x1_val.^3).*(x2_val.^4) x1_val.^8 x2_val.^8 x1_val.^7.*x2_val x1_val.*(x2_val.^7) (x1_val.^6).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^6) (x1_val.^5).*(x2_val.^3) (x1_val.^3).*(x2_val.^5) (x1_val.^4).*(x2_val.^4) x1_val.^9 x2_val.^9 x1_val.^8.*x2_val x1_val.*(x2_val.^8) (x1_val.^7).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^7) (x1_val.^6).*(x2_val.^3) (x1_val.^3).*(x2_val.^6) (x1_val.^5).*(x2_val.^4) (x1_val.^4).*(x2_val.^5) x1_val.^10 x2_val.^10 x1_val.^9.*x2_val x1_val.*(x2_val.^9) (x1_val.^8).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^8) (x1_val.^7).*(x2_val.^3) (x1_val.^3).*(x2_val.^7) (x1_val.^6).*(x2_val.^4) (x1_val.^4).*(x2_val.^6) (x1_val.^5).*(x2_val.^5)];
[yhat10Val, epsilon10Val, SSR10Val] = crossvalidazioneModello(phi_I_Val, theta_I, y_val_dt);

%Undicesimo grado
phi_L_Val=[ones(n,1) x1_val x2_val x1_val.^2 x2_val.^2 x1_val.*x2_val x1_val.^3 x1_val.^3 (x1_val.^2).*x2_val x1_val.*(x1_val.^2) x1_val.^4 x2_val.^4 (x1_val.^2).*(x1_val.^2) (x1_val.^3).*x2_val x1_val.*(x2_val.^3) ...
     x1_val.^5 x2_val.^5 (x1_val.^4).*x2_val x1_val.*(x2_val.^4) (x1_val.^3).*(x2_val.^2) (x1_val.^2).*(x2_val.^3)...
     x1_val.^6 x2_val.^6 x1_val.^5.*x2_val x1_val.*(x2_val.^5) (x1_val.^4).*(x2_val.^2) (x1_val.^2).*(x2_val.^4) (x1_val.^3).*(x2_val.^3) x1_val.^7 x2_val.^7 x1_val.^6.*x2_val x1_val.*(x2_val.^6) (x1_val.^5).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^5) (x1_val.^4).*(x2_val.^3) (x1_val.^3).*(x2_val.^4) x1_val.^8 x2_val.^8 x1_val.^7.*x2_val x1_val.*(x2_val.^7) (x1_val.^6).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^6) (x1_val.^5).*(x2_val.^3) (x1_val.^3).*(x2_val.^5) (x1_val.^4).*(x2_val.^4) x1_val.^9 x2_val.^9 x1_val.^8.*x2_val x1_val.*(x2_val.^8) (x1_val.^7).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^7) (x1_val.^6).*(x2_val.^3) (x1_val.^3).*(x2_val.^6) (x1_val.^5).*(x2_val.^4) (x1_val.^4).*(x2_val.^5) x1_val.^10 x2_val.^10 x1_val.^9.*x2_val x1_val.*(x2_val.^9) (x1_val.^8).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^8) (x1_val.^7).*(x2_val.^3) (x1_val.^3).*(x2_val.^7) (x1_val.^6).*(x2_val.^4) (x1_val.^4).*(x2_val.^6) (x1_val.^5).*(x2_val.^5) x1_val.^11 x2_val.^11 x1_val.^10.*x2_val x1_val.*(x2_val.^10) (x1_val.^9).*(x2_val.^2) ...
     (x1_val.^2).*(x2_val.^9) (x1_val.^8).*(x2_val.^3) (x1_val.^3).*(x2_val.^8) (x1_val.^7).*(x2_val.^4) (x1_val.^4).*(x2_val.^7) (x1_val.^6).*(x2_val.^5) (x1_val.^6).*(x2_val.^5)];
[yhat11Val, epsilon11Val, SSR11Val] = crossvalidazioneModello(phi_L_Val, theta_L, y_val_dt);