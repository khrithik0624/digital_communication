function result = cdma_rx(spread_Xk,N)

hadamardMatrix = hadamard(N);
Xk =  zeros(1,N);

for i=1:N
    Xk(i) = (1/N)*dot(conj(spread_Xk),hadamardMatrix(i,:));
end

result = Xk;
