%% ETAPA 3
%Codigo

clear
clc

disp('Modelos de Particulas')
disp('1. Suben, estabilizacion sin oscilacion')
disp('2. Suben, se estabilizan oscilando')
disp('3. Lanzadas, caen estabilizandose')
opcion = input('Ingrese la opción deseada: ');

for particula = 1:10
    m = (randi([1 1000]))/1000;
    vi = randi([0 10]);
    yi = randi([0 10]);
    ti = 0;
    h = 0.001;
    n = 0;
    vf = [vi];
    yf = [yi];
    tf = [ti];

    if opcion == 1
	    disp('Una disculpa, ni idea cómo sacar esta:(')
        break
    elseif opcion == 2
	    b = 0.1;
    elseif opcion == 3
        b = 5;
    end

    v = @(vi,yi,ti) ((h)/m)*((10-100*yi)-(b*vi)-(9.8*m)) + vi;

    fprintf('La masa inicial del objeto %d es %f \n', particula, m)
    fprintf('La velocidad inicial del objeto %d es %f \n', particula, vi)
    fprintf('La posición inical del objeto %d es %f \n', particula, yi)

    while (n <= 7500)
		n = n + 1;
		tsig = ti + h;
		z = v(vi,yi,ti);
		vsig = z;
		ysig = yi + h * z;
		vf = [vf, vi];
		yf = [yf, yi];
        tf = [tf,ti];
		vi = vsig;
		yi = ysig;
		ti = tsig;
    end
    
    tiledlayout(2,1)
    nexttile
    plot(tf,yf)
    xlabel('Time [s]')
    ylabel('Position [m]')
    title('Plot Position vs Time')
    
    nexttile
    plot(tf,vf)
    xlabel('Time [s]')
    ylabel('Speed [m/s]')
    
    title('Plot Speed vs Time')
    pause(3)
end