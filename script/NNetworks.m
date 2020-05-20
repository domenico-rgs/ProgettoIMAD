clear
clc
close all

load_dataset

%% Neural Network MLP
setdemorandstream(491218342)
x = {x1_id';x2_id'};
t = y_id';
net = feedforwardnet([20 18 15]);
net.name='Skynet';
net.numInputs = 2;
net.numLayers = 4;
net.trainParam.max_fail = 10;
net.inputConnect = [1 1; 0 0; 0 0; 0 0];
net = configure(net,x);
[net, tr] = train(net,x,t);
nntraintool

% Validazione
validation=[x1_val x2_val];
y = net(validation');
mse=mean((y_val-y').^2);

figure
plot3(x1_val,x2_val,y+m,'rx')
hold on
plot3(x1_val, x2_val, y_val+trend_2, 'bo');
grid on
title('Validazione rete MLP')
xlabel('Giorno dell''anno')
ylabel('Ora del giorno')
zlabel('Consumo elettrico')
legend('dati della rete', 'dati da validare')

% Giorno a caso
data = [x1_val(385:1:408) x2_ext]; % giorno 201
carico = net(data');
figure
plot(x2_ext, carico+m, '-m')
hold on
plot(x2_ext, y_val(385:1:408)+m, '-b')
grid on
title('Validazione giorno 201')
legend('previsione','effettivo')

%% Neural Network RB
net = newrb(x,t,0.0,3,300);
net.name='Will';
y = sim(net,validation');

% Validazione
figure
plot3(x1_val,x2_val,y+m,'rx')
hold on
plot3(x1_val, x2_val, y_val+trend_2, 'bo');
grid on
title('Validazione rete RB')
xlabel('Giorno dell''anno')
ylabel('Ora del giorno')
zlabel('Consumo elettrico')
legend('dati della rete', 'dati da validare')

% Giorno a caso
data = [x1_val(385:1:408) x2_ext]; % giorno 201
carico = sim(net,data');
figure
plot(x2_ext, carico+m, '-m')
hold on
plot(x2_ext, y_val(385:1:408)+m, '-b')
grid on
title('Validazione giorno 201')
legend('previsione','effettivo')