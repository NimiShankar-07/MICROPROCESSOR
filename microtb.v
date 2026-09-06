module microprocessor_tb;
    reg clk;
    reg reset;
     wire halted;
 microprocessor m1(.clk(clk),.reset(reset),.halted(halted));
    always #1 clk = ~clk;
    initial
    begin
      clk = 0;
      reset = 1;
      #10;
     reset = 0;
        m1.data_memory[8'h10] = 8'd20;
        m1.data_memory[8'h11] = 8'd10;
         //LOAD R0, 10H
        m1.instruction_memory[0] = 8'h01;
        m1.instruction_memory[1] = 8'b00;
        m1.instruction_memory[2] = 8'h10;
         // LOAD R1, 11H
        m1.instruction_memory[3] = 8'h01;
        m1.instruction_memory[4] = 8'b01;
        m1.instruction_memory[5] = 8'h11;
         // ADD R0, R1
        m1.instruction_memory[6] = 8'h03;
        m1.instruction_memory[7] = 8'b00;
        m1.instruction_memory[8] = 8'b01;
         // STORE R0, 20H
        m1.instruction_memory[9]  = 8'h02;
        m1.instruction_memory[10] = 8'b00;
        m1.instruction_memory[11] = 8'h20;
        // HALT
        m1.instruction_memory[12] = 8'hFF;

        #150;
        $display("R0 = %d", m1.R0);
        $display("R1 = %d", m1.R1);
        $display("Memory[20H] = %d", m1.data_memory[8'h20]);
        
        $stop;
    end

endmodule
