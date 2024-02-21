function result =  compare_bits(bit_seq,rx_bit_seq,bit_len)

errors = 0;
for i=1:bit_len
    if bit_seq(i) ~= rx_bit_seq(i)
        errors = errors +1;
    end
end

result = errors;
