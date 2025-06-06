module kushal_0263(Multiplicand, Multiplier, Product); 
    input signed [5:0] Multiplicand, Multiplier; 
    output signed [11:0] Product; 
     
    wire signed [5:0] NegMultiplicand; 
    wire q_prev, q1, q2, q3, q4, q5, q6; 
    wire signed [5:0] Accumulator, Acc1, Acc2, Acc3, Acc4, Acc5, Acc6; 
    wire signed [5:0] Quot1, Quot2, Quot3, Quot4, Quot5, Quot6; 
    wire signed [5:0] Sum, Sum1, Sum2, Sum3, Sum4, Sum5; 
     
    assign q_prev = 1'b0; 
    assign Accumulator = 6'b000000; 
    assign NegMultiplicand = -Multiplicand; 
     
    assign Sum = (q_prev == 0 & Multiplier[0] == 1) ? Accumulator + NegMultiplicand : 
                 (q_prev == 1 & Multiplier[0] == 0) ? Accumulator + Multiplicand : Accumulator; 
     
    assign Acc1 = {Sum[5], Sum[5:1]}; 
    assign Quot1 = {Sum[0], Multiplier[5:1]}; 
    assign q1 = Multiplier[0]; 
     
    assign Sum1 = (q1 == 0 & Quot1[0] == 1) ? Acc1 + NegMultiplicand : 
                  (q1 == 1 & Quot1[0] == 0) ? Acc1 + Multiplicand : Acc1; 
    assign Acc2 = {Sum1[5], Sum1[5:1]}; 
    assign Quot2 = {Sum1[0], Quot1[5:1]}; 
    assign q2 = Quot1[0]; 
     
    assign Sum2 = (q2 == 0 & Quot2[0] == 1) ? Acc2 + NegMultiplicand : 
                  (q2 == 1 & Quot2[0] == 0) ? Acc2 + Multiplicand : Acc2; 
    assign Acc3 = {Sum2[5], Sum2[5:1]}; 
    assign Quot3 = {Sum2[0], Quot2[5:1]}; 
    assign q3 = Quot2[0]; 
     
    assign Sum3 = (q3 == 0 & Quot3[0] == 1) ? Acc3 + NegMultiplicand : 
                  (q3 == 1 & Quot3[0] == 0) ? Acc3 + Multiplicand : Acc3; 
    assign Acc4 = {Sum3[5], Sum3[5:1]}; 
    assign Quot4 = {Sum3[0], Quot3[5:1]}; 
    assign q4 = Quot3[0]; 
     
    assign Sum4 = (q4 == 0 & Quot4[0] == 1) ? Acc4 + NegMultiplicand : 
                  (q4 == 1 & Quot4[0] == 0) ? Acc4 + Multiplicand : Acc4; 
    assign Acc5 = {Sum4[5], Sum4[5:1]}; 
    assign Quot5 = {Sum4[0], Quot4[5:1]}; 
    assign q5 = Quot4[0]; 
     
    assign Sum5 = (q5 == 0 & Quot5[0] == 1) ? Acc5 + NegMultiplicand : 
                  (q5 == 1 & Quot5[0] == 0) ? Acc5 + Multiplicand : Acc5; 
    assign Acc6 = {Sum5[5], Sum5[5:1]}; 
    assign Quot6 = {Sum5[0], Quot5[5:1]}; 
    assign q6 = Quot5[0]; 
     
    assign Product = {Acc6, Quot6}; 
endmodule
