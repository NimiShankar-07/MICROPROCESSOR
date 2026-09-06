module microprocessor(input clk,reset,output reg halted);
    reg[7:0] R0, R1, R2, R3;
    reg [7:0] PC;
    reg [7:0] IR;
    reg [7:0]instruction_memory[0:255];
    reg[7:0]data_memory[0:255];
    reg[7:0]opcode;
    reg[1:0]reg1;
    reg[1:0]reg2;
    reg[7:0]address;
    parameter NOP =8'h00;
    parameter LOAD  = 8'h01;
    parameter STORE = 8'h02;
    parameter ADD   = 8'h03;
    parameter SUB   = 8'h04;
    parameter AND_OP = 8'h05;
    parameter OR_OP  = 8'h06;
    parameter MOV   = 8'h07;
    parameter JMP   = 8'h08;
    parameter HALT  = 8'hFF;
    
    function[7:0]read_reg;
        input[1:0]sel;
        begin
            case(sel)
                2'b00: read_reg = R0;
                2'b01: read_reg = R1;
                2'b10: read_reg = R2;
                2'b11: read_reg = R3;
            endcase
        end
    endfunction
    
   task write_reg;
        input[1:0] sel;
        input[7:0] value;

        begin
            case(sel)
                2'b00: R0 = value;
                2'b01: R1 = value;
                2'b10: R2 = value;
                2'b11: R3 = value;
            endcase
         end
    endtask
    
    always @(posedge clk or posedge reset) 
    begin

        if(reset) 
        begin
            PC     <= 8'h00;
            IR     <= 8'h00;
            R0     <= 8'h00;
            R1     <= 8'h00;
            R2     <= 8'h00;
            R3     <= 8'h00;

            halted <= 1'b0;

        end

        else if (!halted) 
        begin
            IR <= instruction_memory[PC];
            opcode = instruction_memory[PC];
            case(opcode)
            NOP: 
            begin
                    PC <= PC + 1;
            end
            LOAD:
            begin
                  reg1   = instruction_memory[PC + 1][1:0];
                  address = instruction_memory[PC + 2];
                  write_reg(reg1, data_memory[address]);
                  PC <= PC + 3;
            end
            STORE:
            begin
                reg1   = instruction_memory[PC + 1][1:0];
                address = instruction_memory[PC + 2];
                data_memory[address] <= read_reg(reg1);
                PC <= PC + 3;
             end
             ADD:
             begin

                    reg1 = instruction_memory[PC + 1][1:0];
                    reg2 = instruction_memory[PC + 2][1:0];

                    write_reg(reg1,read_reg(reg1) + read_reg(reg2));
                    PC <= PC + 3;
                     end
                SUB: 
                begin
                    reg1 = instruction_memory[PC + 1][1:0];
                    reg2 = instruction_memory[PC + 2][1:0];
                    write_reg(reg1,read_reg(reg1) - read_reg(reg2));
                     PC <= PC + 3;
                     end
                AND_OP:
                begin
                    reg1 = instruction_memory[PC + 1][1:0];
                    reg2 = instruction_memory[PC + 2][1:0];
                    write_reg(reg1,read_reg(reg1) & read_reg(reg2));
                        PC <= PC + 3;

                end
                OR_OP:
                 begin
                    reg1 = instruction_memory[PC + 1][1:0];
                    reg2 = instruction_memory[PC + 2][1:0];
                    write_reg(reg1,read_reg(reg1) | read_reg(reg2));
                    PC <= PC + 3;
                 end
                MOV: 
                begin
                    reg1 = instruction_memory[PC + 1][1:0];
                    reg2 = instruction_memory[PC + 2][1:0];
                    write_reg(reg1,read_reg(reg2));
                    PC <= PC + 3;
                end
                JMP:
                begin
                   address = instruction_memory[PC + 1];
                   PC <= address;

                end
                HALT:
                 begin
                   halted <= 1'b1;
                end
                default:
                 begin
                  PC <= PC + 1;
                 end
                endcase
        end

    end

endmodule

