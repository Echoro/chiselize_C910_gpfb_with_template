module gated_clk_cell(
  input   io_clk_in,
  output  io_clk_out
);
  assign io_clk_out = io_clk_in; // @[l1sm.scala 358:14]
endmodule
module tsm(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_yy_clk_en,
  input  [1:0]  io_cp0_yy_priv_mode,
  input         io_cpurst_b,
  input         io_entry_act_vld,
  input         io_entry_biu_pe_req_grnt,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input         io_entry_create_vld,
  input         io_entry_from_lfb_dcache_hit,
  input         io_entry_from_lfb_dcache_miss,
  input         io_entry_l1_biu_pe_req_set,
  input         io_entry_l1_mmu_pe_req_set,
  input         io_entry_l2_biu_pe_req_set,
  input         io_entry_l2_mmu_pe_req_set,
  input         io_entry_mmu_pe_req_grnt,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input  [10:0] io_entry_stride,
  input         io_entry_stride_neg,
  input         io_forever_cpuclk,
  input         io_pad_yy_icg_scan_en,
  input  [39:0] io_pipe_va,
  output        io_entry_biu_pe_req,
  output [1:0]  io_entry_biu_pe_req_src,
  output        io_entry_dcache_hit_pop_req,
  output [39:0] io_entry_inst_new_va,
  output        io_entry_mmu_pe_req,
  output [1:0]  io_entry_mmu_pe_req_src,
  output [1:0]  io_entry_priv_mode,
  output        io_entry_tsm_is_judge,
  output        io_entry_vld
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_io_clk_in; // @[tsm.scala 83:29]
  wire  gated_clk_cell_io_clk_out; // @[tsm.scala 83:29]
  wire  _T_2 = ~io_cpurst_b; // @[tsm.scala 94:57]
  reg [1:0] state; // @[tsm.scala 95:24]
  wire [20:0] _wire_entry_stride_ext_T_1 = io_entry_stride_neg ? 21'h1fffff : 21'h0; // @[Bitwise.scala 74:12]
  wire [39:0] wire_entry_stride_ext = {8'h0,_wire_entry_stride_ext_T_1,io_entry_stride}; // @[tsm.scala 189:122]
  wire [12:0] _GEN_19 = {{1'd0}, io_pipe_va[11:0]}; // @[tsm.scala 194:42]
  wire [12:0] wire_entry_sum_4k = _GEN_19 + wire_entry_stride_ext[12:0]; // @[tsm.scala 194:42]
  wire  wire_entry_inst_new_va_cross_4k = wire_entry_sum_4k[12]; // @[tsm.scala 196:57]
  wire [1:0] _GEN_2 = io_entry_reinit_vld ? 2'h2 : 2'h3; // @[tsm.scala 117:37 118:19 120:19]
  wire  wire_entry_pf_inst_vld_clk = gated_clk_cell_io_clk_out; // @[tsm.scala 71:18 85:30]
  reg [39:0] entry_inst_new_va; // @[tsm.scala 135:36]
  reg [1:0] entry_priv_mode; // @[tsm.scala 136:34]
  wire [39:0] _wire_entry_pipe_va_add_stride_T_1 = {8'h0,io_pipe_va[31:0]}; // @[tsm.scala 192:97]
  wire [39:0] _GEN_20 = {{8'd0}, wire_entry_stride_ext[31:0]}; // @[tsm.scala 192:125]
  wire [39:0] wire_entry_pipe_va_add_stride = _wire_entry_pipe_va_add_stride_T_1 + _GEN_20; // @[tsm.scala 192:125]
  wire [39:0] _entry_inst_new_va_T_2 = {8'h0,wire_entry_pipe_va_add_stride[31:0]}; // @[tsm.scala 138:82]
  reg  entry_already_dcache_hit; // @[tsm.scala 149:43]
  wire  _GEN_9 = io_entry_from_lfb_dcache_hit | entry_already_dcache_hit; // @[tsm.scala 152:45 153:32 149:43]
  reg  entry_biu_pe_req; // @[tsm.scala 161:35]
  reg [1:0] entry_biu_pe_req_src; // @[tsm.scala 162:39]
  wire  wire_entry_biu_pe_req_set = io_entry_l2_biu_pe_req_set | io_entry_l1_biu_pe_req_set; // @[tsm.scala 201:66]
  wire [1:0] wire_entry_biu_pe_req_set_src = {io_entry_l2_biu_pe_req_set,io_entry_l1_biu_pe_req_set}; // @[tsm.scala 202:64]
  wire [1:0] _entry_biu_pe_req_src_T = entry_biu_pe_req_src | wire_entry_biu_pe_req_set_src; // @[tsm.scala 168:52]
  wire  _GEN_11 = wire_entry_biu_pe_req_set | entry_biu_pe_req; // @[tsm.scala 166:49 167:24 161:35]
  reg  entry_mmu_pe_req; // @[tsm.scala 176:35]
  reg [1:0] entry_mmu_pe_req_src; // @[tsm.scala 177:39]
  wire  wire_entry_mmu_pe_req_set = io_entry_l2_mmu_pe_req_set | io_entry_l1_mmu_pe_req_set; // @[tsm.scala 206:66]
  wire [1:0] wire_entry_mmu_pe_req_set_src = {io_entry_l2_mmu_pe_req_set,io_entry_l1_mmu_pe_req_set}; // @[tsm.scala 207:64]
  wire [1:0] _entry_mmu_pe_req_src_T = entry_mmu_pe_req_src | wire_entry_mmu_pe_req_set_src; // @[tsm.scala 183:52]
  wire  _GEN_15 = wire_entry_mmu_pe_req_set | entry_mmu_pe_req; // @[tsm.scala 181:49 182:24 176:35]
  gated_clk_cell gated_clk_cell ( // @[tsm.scala 83:29]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  assign io_entry_biu_pe_req = entry_biu_pe_req; // @[tsm.scala 170:25]
  assign io_entry_biu_pe_req_src = entry_biu_pe_req_src; // @[tsm.scala 171:29]
  assign io_entry_dcache_hit_pop_req = entry_already_dcache_hit & io_entry_from_lfb_dcache_hit; // @[tsm.scala 155:68]
  assign io_entry_inst_new_va = entry_inst_new_va; // @[tsm.scala 141:26]
  assign io_entry_mmu_pe_req = entry_mmu_pe_req; // @[tsm.scala 185:25]
  assign io_entry_mmu_pe_req_src = entry_mmu_pe_req_src; // @[tsm.scala 186:29]
  assign io_entry_priv_mode = entry_priv_mode; // @[tsm.scala 142:24]
  assign io_entry_tsm_is_judge = state == 2'h3; // @[tsm.scala 129:43]
  assign io_entry_vld = state[1]; // @[tsm.scala 128:33]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[tsm.scala 84:24]
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 97:28]
      state <= 2'h0; // @[tsm.scala 98:13]
    end else if (io_entry_pop_vld) begin // @[tsm.scala 101:21]
      state <= 2'h0; // @[tsm.scala 103:37 104:19 106:19]
    end else if (2'h0 == state) begin // @[tsm.scala 101:21]
      if (io_entry_create_vld) begin // @[tsm.scala 110:94]
        state <= 2'h2; // @[tsm.scala 111:19]
      end else begin
        state <= 2'h0; // @[tsm.scala 113:19]
      end
    end else if (2'h2 == state) begin // @[tsm.scala 101:21]
      if (io_entry_act_vld & ~wire_entry_inst_new_va_cross_4k & ~io_entry_reinit_vld) begin
        state <= 2'h3;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h3 == state) begin // @[tsm.scala 100:13]
      state <= _GEN_2;
    end else begin
      state <= 2'h0;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 137:31]
      entry_inst_new_va <= 40'h0; // @[tsm.scala 138:25]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 135:36]
      entry_inst_new_va <= _entry_inst_new_va_T_2;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 137:31]
      entry_priv_mode <= 2'h0; // @[tsm.scala 139:23]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 136:34]
      entry_priv_mode <= io_cp0_yy_priv_mode;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 150:66]
      entry_already_dcache_hit <= 1'h0; // @[tsm.scala 151:32]
    end else if (io_entry_create_dp_vld | io_entry_from_lfb_dcache_miss) begin
      entry_already_dcache_hit <= 1'h0;
    end else begin
      entry_already_dcache_hit <= _GEN_9;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 163:55]
      entry_biu_pe_req <= 1'h0; // @[tsm.scala 164:24]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin
      entry_biu_pe_req <= 1'h0;
    end else begin
      entry_biu_pe_req <= _GEN_11;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 163:55]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 165:28]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin // @[tsm.scala 166:49]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 168:28]
    end else if (wire_entry_biu_pe_req_set) begin // @[tsm.scala 162:39]
      entry_biu_pe_req_src <= _entry_biu_pe_req_src_T;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 178:55]
      entry_mmu_pe_req <= 1'h0; // @[tsm.scala 179:24]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin
      entry_mmu_pe_req <= 1'h0;
    end else begin
      entry_mmu_pe_req <= _GEN_15;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 178:55]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 180:28]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin // @[tsm.scala 181:49]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 183:28]
    end else if (wire_entry_mmu_pe_req_set) begin // @[tsm.scala 177:39]
      entry_mmu_pe_req_src <= _entry_mmu_pe_req_src_T;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  entry_inst_new_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_priv_mode = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  entry_already_dcache_hit = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_biu_pe_req = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_biu_pe_req_src = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  entry_mmu_pe_req = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  entry_mmu_pe_req_src = _RAND_7[1:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_2) begin
    state = 2'h0;
  end
  if (_T_2) begin
    entry_inst_new_va = 40'h0;
  end
  if (_T_2) begin
    entry_priv_mode = 2'h0;
  end
  if (_T_2) begin
    entry_already_dcache_hit = 1'h0;
  end
  if (_T_2) begin
    entry_biu_pe_req = 1'h0;
  end
  if (_T_2) begin
    entry_biu_pe_req_src = 2'h0;
  end
  if (_T_2) begin
    entry_mmu_pe_req = 1'h0;
  end
  if (_T_2) begin
    entry_mmu_pe_req_src = 2'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
