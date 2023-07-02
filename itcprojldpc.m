% Generator Matrix
G = [1 0 0 1 1 0 1 0 0 0; 0 0 0 1 1 1 0 1 0 0; 0 0 1 1 1 0 0 0 1 0; 0 1 0 1 1 0 0 0 0 1];
Gt=G.';
for i=1:4
    for j=1:6
        p(i,j)= G(i,j);%because G=[p:I]
        end
        end
        % Make Identity Matrix
for i=1:6
    for j=1:6
        if i==j 
            I(i,j)=1;
        else
            I(i,j)=0;
end
end
end
H = [I,p.'];%Parity-Check Metrix
Ht= H.';
%Choose LDPC or Hamming Encoding
F = menu('Choose an Encoding method','1.Hamming Code','2.LDPC');
if F==1
    %choose your choice either encoding or decoding
    B= menu('Choose your Choice','1.Encoding','2.Decoding');
    if B==1
    %Hamming Encoding
    m=input('enter message(4 bits) string: \n');
    b=[m]*[p];%Parity bits
    for i=1:length(b)
        if rem(b(i),2)==1
           b(i)=1;
        else b(i)=0;
        end
    end
    Encoded_Message=[b,m] %Encoded Message
    end
if B==2 
 %Hamming Decoding
code=input('enter received message (10 bits) string: \n');
s=[code]*Ht; %Syndrome

for i=1:length(s)
if rem(s(i),2)==1;
    s(i)=1;
else 
    s(i)=0;
end
end
%Error detection and correction using Syndrome
if s==[0 0 0 0 0 0]%no error
Error_Free_Received_msg=code;
Decoded_msg=code(7:10);
end
if s==H(1:6,1).' %error at 1st bit
    code(1)=xor(code(1),1);
end
if s==H(1:6,2).' %error at 2nd bit
    code(2)=xor(code(2),1);
end
if s==H(1:6,3).' %error at 3rd bit
    code(3)=xor(code(3),1);
end
if s==H(1:6,4).' %error at 4th bit
    code(4)=xor(code(4),1);
end
if s==H(1:6,5).' %error at 5th bit
    code(5)=xor(code(5),1);
end
if s==H(1:6,6).' %error at 6th bit
    code(6)=xor(code(6),1);
end
if s==H(1:6,7).' %error at 7th bit
    code(7)=xor(code(7),1);
end
if s==H(1:6,8).' %error at 8th bit
    code(8)=xor(code(8),1);
end
if s==H(1:6,9).' %error at 9th bit
    code(9)=xor(code(9),1);
end
if s==H(1:6,10).' %error at 10th bit
    code(10)=xor(code(10),1);
end
Error_Free_Received_msg=code;%Received bits after error correction
Decoded_msg=code(7:10)%Decoded Message
end
end
%end
if F==2 %choose your choice - encoding or decoding
    B= menu('Choose your Choice','1.Encoding','2.Decoding');
if B==1%LDPC Encoding
    m=input('enter message(4-bit) string: \n');
    mt=m.';
    Encoded_Message=Gt*mt;
    for i=1:length(Encoded_Message)
        if rem(Encoded_Message(i),2)==1;
            Encoded_Message(i)=1;
        else Encoded_Message(i)=0;
        end
    end
    Encoded_Message.'
end
if B==2%LDPC Decoding
    y=input('enter received message(10 bits) string: \n');
    Decoded_Message=[G*y.'].'%Decoded message
    sum=0;
    for i=1:length(Decoded_Message)
        sum=sum+Decoded_Message(i);
    end
    %set threshold value
    th=sum/length(Decoded_Message)
    for i=1:length(Decoded_Message)
        if Decoded_Message(i)>=th
            Decoded_Message(i)=1;
        else
            Decoded_Message(i)=0;
        end
    end
    Decoded_Message; %Decoded message
end
end    