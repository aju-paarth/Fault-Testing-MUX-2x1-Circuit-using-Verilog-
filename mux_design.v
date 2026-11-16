// fault free mux
module mux_good(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(Y, H, J);
endmodule


// fault 1 : A stuck at 0
module mux_f1(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, 1'b0, G);
  and and2(J, B, S);
  or  or1(Y, H, J);
endmodule


// fault 2 : A stuck at 1
module mux_f2(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, 1'b1, G);
  and and2(J, B, S);
  or  or1(Y, H, J);
endmodule


// fault 3 : B stuck at 0
module mux_f3(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, 1'b0, S);
  or  or1(Y, H, J);
endmodule


// fault 4 : B stuck at 1
module mux_f4(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, 1'b1, S);
  or  or1(Y, H, J);
endmodule


// fault 5 : S stuck at 0
module mux_f5(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, 1'b0);
  and and1(H, A, G);
  and and2(J, B, 1'b0);
  or  or1(Y, H, J);
endmodule


// fault 6 : S stuck at 1
module mux_f6(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, 1'b1);
  and and1(H, A, G);
  and and2(J, B, 1'b1);
  or  or1(Y, H, J);
endmodule


// fault 7 : G stuck at 0
module mux_f7(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, 1'b0);
  and and2(J, B, S);
  or  or1(Y, H, J);
endmodule


// fault 8 : G stuck at 1
module mux_f8(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, 1'b1);
  and and2(J, B, S);
  or  or1(Y, H, J);
endmodule


// fault 9 : H stuck at 0
module mux_f9(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(Y, 1'b0, J);
endmodule


// fault 10 : H stuck at 1
module mux_f10(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(Y, 1'b1, J);
endmodule


// fault 11 : J stuck at 0
module mux_f11(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(Y, H, 1'b0);
endmodule


// fault 12 : J stuck at 1
module mux_f12(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(Y, H, 1'b1);
endmodule


// fault 13 : Y stuck at 0
module mux_f13(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J, YY;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(YY, H, J);
  buf buf1(Y, 1'b0);
endmodule


// fault 14 : Y stuck at 1
module mux_f14(A, B, S, Y);
  input A, B, S;
  output Y;
  wire G, H, J, YY;

  not not1(G, S);
  and and1(H, A, G);
  and and2(J, B, S);
  or  or1(YY, H, J);
  buf buf1(Y, 1'b1);
endmodule


// To check circuit 
module fault_check(A, B, S, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);
  input A, B, S;
  output yg;
  output d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14;
  output found;
  wire y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14;

  mux_good m0(A, B, S, yg);

  mux_f1  m1(A, B, S, y1);
  mux_f2  m2(A, B, S, y2);
  mux_f3  m3(A, B, S, y3);
  mux_f4  m4(A, B, S, y4);
  mux_f5  m5(A, B, S, y5);
  mux_f6  m6(A, B, S, y6);
  mux_f7  m7(A, B, S, y7);
  mux_f8  m8(A, B, S, y8);
  mux_f9  m9(A, B, S, y9);
  mux_f10 m10(A, B, S, y10);
  mux_f11 m11(A, B, S, y11);
  mux_f12 m12(A, B, S, y12);
  mux_f13 m13(A, B, S, y13);
  mux_f14 m14(A, B, S, y14);

  xor x1(d1, yg, y1);
  xor x2(d2, yg, y2);
  xor x3(d3, yg, y3);
  xor x4(d4, yg, y4);
  xor x5(d5, yg, y5);
  xor x6(d6, yg, y6);
  xor x7(d7, yg, y7);
  xor x8(d8, yg, y8);
  xor x9(d9, yg, y9);
  xor x10(d10, yg, y10);
  xor x11(d11, yg, y11);
  xor x12(d12, yg, y12);
  xor x13(d13, yg, y13);
  xor x14(d14, yg, y14);

  or o1(found, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14);
endmodule