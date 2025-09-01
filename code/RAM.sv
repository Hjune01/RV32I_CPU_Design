`timescale 1ns / 1ps

module RAM (
    input  logic        clk,
    input  logic        we,
    input  logic [31:0] instrCode,
    input  logic [31:0] addr,
    input  logic [31:0] wData,
    output logic [31:0] rData
);
    logic [31:0] mem[0:2**6-1];  // 0x00 ~ 0x0f => 0x10 * 4 => 0x40

    wire [2:0] func3 = instrCode[14:12];

    always_ff @(posedge clk) begin
        if (we) begin
            case (func3)
                3'b000: begin  //SB
                    case (addr[1:0])
                        2'b00: mem[addr[31:2]][7:0] <= wData[7:0];
                        2'b01: mem[addr[31:2]][15:8] <= wData[7:0];
                        2'b10: mem[addr[31:2]][23:16] <= wData[7:0];
                        2'b11: mem[addr[31:2]][31:24] <= wData[7:0];
                    endcase
                end
                3'b001: begin  //SH
                    case (addr[1:0])
                        2'b00: mem[addr[31:2]][15:0] <= wData[15:0];
                        2'b10: mem[addr[31:2]][31:16] <= wData[15:0];
                    endcase
                end
                default: mem[addr[31:2]] <= wData;
            endcase
        end
    end

    always_comb begin
        rData = mem[addr[31:2]];
        case (func3)
            3'b000: begin  //LB
                case (addr[1:0])
                    2'b00:
                    rData = {{24{mem[addr[31:2]][7]}}, mem[addr[31:2]][7:0]};
                    2'b01:
                    rData = {{24{mem[addr[31:2]][15]}}, mem[addr[31:2]][15:8]};
                    2'b10:
                    rData = {{24{mem[addr[31:2]][23]}}, mem[addr[31:2]][23:16]};
                    2'b11:
                    rData = {{24{mem[addr[31:2]][31]}}, mem[addr[31:2]][31:24]};
                endcase
            end
            3'b001: begin  //LH
                case (addr[1:0])
                    2'b00:
                    rData = {{16{mem[addr[31:2]][15]}}, mem[addr[31:2]][15:0]};
                    2'b10:
                    rData = {{16{mem[addr[31:2]][31]}}, mem[addr[31:2]][31:16]};
                endcase
            end
            3'b010: rData = mem[addr[31:2]];  //LW
            3'b100: begin  //LBU
                case (addr[1:0])
                    2'b00:
                    rData = {24'b0, mem[addr[31:2]][7:0]};
                    2'b01:
                    rData = {24'b0, mem[addr[31:2]][15:8]};
                    2'b10:
                    rData = {24'b0, mem[addr[31:2]][23:16]};
                    2'b11:
                    rData = {24'b0, mem[addr[31:2]][31:24]};
                endcase
            end
            3'b101: begin
                case (addr[1:0])
                    2'b00:
                    rData = {16'b0, mem[addr[31:2]][15:0]};
                    2'b10:
                    rData = {16'b0, mem[addr[31:2]][31:16]};
                endcase
            end
        endcase
    end

endmodule
