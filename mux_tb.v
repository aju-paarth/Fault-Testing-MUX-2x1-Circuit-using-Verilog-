// testbench for 2x1 mux fault simulation

module mux_tb;
  reg A, B, S;
  wire yg;
  wire d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14;
  wire found;

  fault_check uut(A, B, S, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, mux_tb);

    $display("d = 1 means fault detected by this test vector");
    $display("");
    $display("vector  S A B | yg | d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 | found");

    S = 0; A = 0; B = 0; #10;
    $display("T0      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 0; A = 0; B = 1; #10;
    $display("T1      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 0; A = 1; B = 0; #10;
    $display("T2      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 0; A = 1; B = 1; #10;
    $display("T3      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 1; A = 0; B = 0; #10;
    $display("T4      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 1; A = 0; B = 1; #10;
    $display("T5      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 1; A = 1; B = 0; #10;
    $display("T6      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    S = 1; A = 1; B = 1; #10;
    $display("T7      %b %b %b | %b  | %b  %b  %b  %b  %b  %b  %b  %b  %b  %b   %b   %b   %b   %b   | %b", S, A, B, yg, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, found);

    $finish;
  end
endmodule