function result = dqpsk(Xk_rx)

bit_seq = zeros(1,2*length(Xk_rx));
for k=1:length(Xk_rx)
    if Xk_rx(k)==complex(cos(pi/4),sin(pi/4))
        bit_seq(2*k-1)=0;
        bit_seq(2*k)=0;
    elseif Xk_rx(k)==complex(cos(3*pi/4),sin(3*pi/4))
        bit_seq(2*k-1)=0;
        bit_seq(2*k)=1;
    elseif Xk_rx(k)==complex(cos(5*pi/4),sin(5*pi/4))
        bit_seq(2*k-1)=1;
        bit_seq(2*k)=1;
    else
        bit_seq(2*k-1)=1;
        bit_seq(2*k)=0;
    end
end

result = bit_seq;
    


