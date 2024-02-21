%ofdm_qpsk demodulation

function result = demod_ofdm(yt,N,hc,constellation)

Yk = (1/sqrt(N))*fft(yt,N);

% subplot(2,1,1);
% scatter(real(Yk),imag(Yk),'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5);
% title(['Received symobols for ' num2str(hc)]);
% xlabel('Real axis');
% ylabel('Imag axis');
% xL = xlim;
% yL = ylim;
% line([0 0], yL,'Color','red','LineStyle','--');  %x-axis
% line(xL, [0 0],'Color','red','LineStyle','--');  %y-axis
% grid on
% grid minor


Hk = (1/sqrt(N))*fft(hc,N);
% subplot(2,1,2);
% stem(abs(Hk),'MarkerFaceColor',[0 .7 .7],...
%               'LineWidth',1.5);
% title(['Channel coefficientss ' num2str(hc)]);
% xlabel('Real axis');
% ylabel('Imag axis');
% xL = xlim;
% yL = ylim;
% line([0 0], yL,'Color','red','LineStyle','--');  %x-axis
% line(xL, [0 0],'Color','red','LineStyle','--');  %y-axis
% grid on
% grid minor

Xk_Rx = zeros(1,N);

for k=1:N
    metric = inf;
    ind = 0;
    for j=1:2:7
        current = abs(Yk(k)-complex(cos(j*pi/4),sin(j*pi/4))*Hk(k));
        if( current < metric )
            metric = current;
            ind = j;
        end
    end
    Xk_Rx(k) = constellation(floor(ind/2)+1);
end



result =Xk_Rx;