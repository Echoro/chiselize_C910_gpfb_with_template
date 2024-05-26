module gated_clk_cell(
  input   io_clk_in,
  output  io_clk_out
);
  assign io_clk_out = io_clk_in; // @[l1sm.scala 412:14]
endmodule
module ct_lsu_pfu_pfb_tsm(
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
  wire  gated_clk_cell_io_clk_in; // @[tsm.scala 86:29]
  wire  gated_clk_cell_io_clk_out; // @[tsm.scala 86:29]
  wire  _T_2 = ~io_cpurst_b; // @[tsm.scala 97:57]
  reg [1:0] state; // @[tsm.scala 98:24]
  wire [20:0] _wire_entry_stride_ext_T_1 = io_entry_stride_neg ? 21'h1fffff : 21'h0; // @[Bitwise.scala 74:12]
  wire [39:0] wire_entry_stride_ext = {8'h0,_wire_entry_stride_ext_T_1,io_entry_stride}; // @[tsm.scala 192:122]
  wire [12:0] _GEN_19 = {{1'd0}, io_pipe_va[11:0]}; // @[tsm.scala 197:42]
  wire [12:0] wire_entry_sum_4k = _GEN_19 + wire_entry_stride_ext[12:0]; // @[tsm.scala 197:42]
  wire  wire_entry_inst_new_va_cross_4k = wire_entry_sum_4k[12]; // @[tsm.scala 199:57]
  wire [1:0] _GEN_2 = io_entry_reinit_vld ? 2'h2 : 2'h3; // @[tsm.scala 120:37 121:19 123:19]
  wire  wire_entry_pf_inst_vld_clk = gated_clk_cell_io_clk_out; // @[tsm.scala 74:18 88:30]
  reg [39:0] entry_inst_new_va; // @[tsm.scala 138:36]
  reg [1:0] entry_priv_mode; // @[tsm.scala 139:34]
  wire [39:0] _wire_entry_pipe_va_add_stride_T_1 = {8'h0,io_pipe_va[31:0]}; // @[tsm.scala 195:97]
  wire [39:0] _GEN_20 = {{8'd0}, wire_entry_stride_ext[31:0]}; // @[tsm.scala 195:125]
  wire [39:0] wire_entry_pipe_va_add_stride = _wire_entry_pipe_va_add_stride_T_1 + _GEN_20; // @[tsm.scala 195:125]
  wire [39:0] _entry_inst_new_va_T_2 = {8'h0,wire_entry_pipe_va_add_stride[31:0]}; // @[tsm.scala 141:82]
  reg  entry_already_dcache_hit; // @[tsm.scala 152:43]
  wire  _GEN_9 = io_entry_from_lfb_dcache_hit | entry_already_dcache_hit; // @[tsm.scala 155:45 156:32 152:43]
  reg  entry_biu_pe_req; // @[tsm.scala 164:35]
  reg [1:0] entry_biu_pe_req_src; // @[tsm.scala 165:39]
  wire  wire_entry_biu_pe_req_set = io_entry_l2_biu_pe_req_set | io_entry_l1_biu_pe_req_set; // @[tsm.scala 204:66]
  wire [1:0] wire_entry_biu_pe_req_set_src = {io_entry_l2_biu_pe_req_set,io_entry_l1_biu_pe_req_set}; // @[tsm.scala 205:64]
  wire [1:0] _entry_biu_pe_req_src_T = entry_biu_pe_req_src | wire_entry_biu_pe_req_set_src; // @[tsm.scala 171:52]
  wire  _GEN_11 = wire_entry_biu_pe_req_set | entry_biu_pe_req; // @[tsm.scala 169:49 170:24 164:35]
  reg  entry_mmu_pe_req; // @[tsm.scala 179:35]
  reg [1:0] entry_mmu_pe_req_src; // @[tsm.scala 180:39]
  wire  wire_entry_mmu_pe_req_set = io_entry_l2_mmu_pe_req_set | io_entry_l1_mmu_pe_req_set; // @[tsm.scala 209:66]
  wire [1:0] wire_entry_mmu_pe_req_set_src = {io_entry_l2_mmu_pe_req_set,io_entry_l1_mmu_pe_req_set}; // @[tsm.scala 210:64]
  wire [1:0] _entry_mmu_pe_req_src_T = entry_mmu_pe_req_src | wire_entry_mmu_pe_req_set_src; // @[tsm.scala 186:52]
  wire  _GEN_15 = wire_entry_mmu_pe_req_set | entry_mmu_pe_req; // @[tsm.scala 184:49 185:24 179:35]
  gated_clk_cell gated_clk_cell ( // @[tsm.scala 86:29]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  assign io_entry_biu_pe_req = entry_biu_pe_req; // @[tsm.scala 173:25]
  assign io_entry_biu_pe_req_src = entry_biu_pe_req_src; // @[tsm.scala 174:29]
  assign io_entry_dcache_hit_pop_req = entry_already_dcache_hit & io_entry_from_lfb_dcache_hit; // @[tsm.scala 158:68]
  assign io_entry_inst_new_va = entry_inst_new_va; // @[tsm.scala 144:26]
  assign io_entry_mmu_pe_req = entry_mmu_pe_req; // @[tsm.scala 188:25]
  assign io_entry_mmu_pe_req_src = entry_mmu_pe_req_src; // @[tsm.scala 189:29]
  assign io_entry_priv_mode = entry_priv_mode; // @[tsm.scala 145:24]
  assign io_entry_tsm_is_judge = state == 2'h3; // @[tsm.scala 132:43]
  assign io_entry_vld = state[1]; // @[tsm.scala 131:33]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[tsm.scala 87:24]
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 100:28]
      state <= 2'h0; // @[tsm.scala 101:13]
    end else if (io_entry_pop_vld) begin // @[tsm.scala 104:21]
      state <= 2'h0; // @[tsm.scala 106:37 107:19 109:19]
    end else if (2'h0 == state) begin // @[tsm.scala 104:21]
      if (io_entry_create_vld) begin // @[tsm.scala 113:94]
        state <= 2'h2; // @[tsm.scala 114:19]
      end else begin
        state <= 2'h0; // @[tsm.scala 116:19]
      end
    end else if (2'h2 == state) begin // @[tsm.scala 104:21]
      if (io_entry_act_vld & ~wire_entry_inst_new_va_cross_4k & ~io_entry_reinit_vld) begin
        state <= 2'h3;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h3 == state) begin // @[tsm.scala 103:13]
      state <= _GEN_2;
    end else begin
      state <= 2'h0;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 140:31]
      entry_inst_new_va <= 40'h0; // @[tsm.scala 141:25]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 138:36]
      entry_inst_new_va <= _entry_inst_new_va_T_2;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 140:31]
      entry_priv_mode <= 2'h0; // @[tsm.scala 142:23]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 139:34]
      entry_priv_mode <= io_cp0_yy_priv_mode;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 153:66]
      entry_already_dcache_hit <= 1'h0; // @[tsm.scala 154:32]
    end else if (io_entry_create_dp_vld | io_entry_from_lfb_dcache_miss) begin
      entry_already_dcache_hit <= 1'h0;
    end else begin
      entry_already_dcache_hit <= _GEN_9;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 166:55]
      entry_biu_pe_req <= 1'h0; // @[tsm.scala 167:24]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin
      entry_biu_pe_req <= 1'h0;
    end else begin
      entry_biu_pe_req <= _GEN_11;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 166:55]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 168:28]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin // @[tsm.scala 169:49]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 171:28]
    end else if (wire_entry_biu_pe_req_set) begin // @[tsm.scala 165:39]
      entry_biu_pe_req_src <= _entry_biu_pe_req_src_T;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 181:55]
      entry_mmu_pe_req <= 1'h0; // @[tsm.scala 182:24]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin
      entry_mmu_pe_req <= 1'h0;
    end else begin
      entry_mmu_pe_req <= _GEN_15;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 181:55]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 183:28]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin // @[tsm.scala 184:49]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 186:28]
    end else if (wire_entry_mmu_pe_req_set) begin // @[tsm.scala 180:39]
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
module ct_lsu_pfu_pfb_l1sm(
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cpurst_b,
  input         io_entry_biu_pe_req,
  input         io_entry_biu_pe_req_grnt,
  input  [1:0]  io_entry_biu_pe_req_src,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input  [39:0] io_entry_inst_new_va,
  input         io_entry_mmu_pe_req,
  input  [1:0]  io_entry_mmu_pe_req_src,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input         io_entry_stride_neg,
  input  [39:0] io_entry_strideh,
  input         io_entry_tsm_is_judge,
  input         io_forever_cpuclk,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input  [27:0] io_ld_da_ppn_ff,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  output        io_entry_l1_biu_pe_req_set,
  output        io_entry_l1_cmp_va_vld,
  output        io_entry_l1_mmu_pe_req_set,
  output        io_entry_l1_page_sec,
  output        io_entry_l1_page_share,
  output [39:0] io_entry_l1_pf_addr,
  output [39:0] io_entry_l1_pf_va_sub_inst_new_va,
  output [27:0] io_entry_l1_vpn,
  output        io_entry_l1sm_reinit_req,
  output        io_entry_l1sm_va_can_cmp,
  output [39:0] io_entry_l1_pf_va
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_io_clk_in; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_io_clk_out; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_1_io_clk_in; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_1_io_clk_out; // @[l1sm.scala 146:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 250:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 250:72]
  reg [2:0] state; // @[l1sm.scala 251:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge; // @[l1sm.scala 327:95]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 336:66]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 144:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 376:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_io_clk_out; // @[l1sm.scala 146:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 168:29]
  wire [39:0] _entry_l1_pf_va_T_2 = {entry_l1_pf_va[39:32],32'h0}; // @[l1sm.scala 170:79]
  wire [39:0] _entry_l1_pf_va_T_5 = {entry_l1_pf_va[39:32],io_entry_inst_new_va[31:0]}; // @[l1sm.scala 172:79]
  wire [31:0] _wire_entry_l1_pf_va_add_strideh_T_4 = io_entry_l1_pf_va[31:0] + io_entry_strideh[31:0]; // @[l1sm.scala 338:150]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = {8'h0,_wire_entry_l1_pf_va_add_strideh_T_4}; // @[l1sm.scala 338:110]
  wire [39:0] _entry_l1_pf_va_T_8 = {entry_l1_pf_va[39:32],wire_entry_l1_pf_va_add_strideh[31:0]}; // @[l1sm.scala 174:79]
  wire  wire_entry_l1_biu_pe_req_grnt = io_pfu_biu_pe_req_sel_l1 & io_entry_biu_pe_req_grnt; // @[l1sm.scala 355:61]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 335:89]
  wire [26:0] _io_entry_l1_vpn_T_2 = {7'h0,entry_l1_pf_va[31:12]}; // @[l1sm.scala 181:92]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_io_clk_out; // @[l1sm.scala 146:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 188:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 189:32]
  reg  entry_l1_page_share; // @[l1sm.scala 190:34]
  wire [27:0] _entry_l1_pf_ppn_T_2 = {entry_l1_pf_ppn[27:20],20'h0}; // @[l1sm.scala 193:97]
  wire [27:0] _entry_l1_pf_ppn_T_5 = {entry_l1_pf_ppn[27:20],io_ld_da_ppn_ff[19:0]}; // @[l1sm.scala 198:97]
  wire [27:0] _entry_l1_pf_ppn_T_8 = {entry_l1_pf_ppn[27:20],io_pfu_get_ppn[19:0]}; // @[l1sm.scala 204:97]
  wire [27:0] _io_entry_l1_pf_addr_T_2 = {8'h0,entry_l1_pf_ppn[19:0]}; // @[l1sm.scala 211:89]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 223:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 224:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 226:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,io_entry_l1_pf_va[11:0]}; // @[Cat.scala 31:58]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 339:81]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 345:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 271:42]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 273:87 274:17 276:17]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 271:115 272:17]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 280:48 281:17 283:17]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 289:69 290:17 292:17]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 287:64 288:17]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 296:42 297:17 299:17]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 257:11 258:18]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 258:18]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 258:18]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 310:53]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va[31:0]); // @[l1sm.scala 390:43]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[31]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 391:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[0]; // @[l1sm.scala 352:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[0]; // @[l1sm.scala 363:56]
  wire [31:0] _io_entry_l1_pf_va_sub_inst_new_va_T_4 = io_entry_l1_pf_va[31:0] - io_entry_inst_new_va[31:0]; // @[l1sm.scala 382:155]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 146:50]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 146:50]
    .io_clk_in(gated_clk_cell_1_io_clk_in),
    .io_clk_out(gated_clk_cell_1_io_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 319:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 231:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 365:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 216:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 217:28]
  assign io_entry_l1_pf_addr = {_io_entry_l1_pf_addr_T_2,io_entry_l1_pf_va[11:0]}; // @[l1sm.scala 211:123]
  assign io_entry_l1_pf_va_sub_inst_new_va = {8'h0,_io_entry_l1_pf_va_sub_inst_new_va_T_4}; // @[l1sm.scala 382:115]
  assign io_entry_l1_vpn = {{1'd0}, _io_entry_l1_vpn_T_2}; // @[l1sm.scala 181:21]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 320:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 324:52]
  assign io_entry_l1_pf_va = entry_l1_pf_va; // @[l1sm.scala 177:29]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 146:31 148:30]
  assign gated_clk_cell_1_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 146:31 148:30]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 169:31]
      entry_l1_pf_va <= _entry_l1_pf_va_T_2; // @[l1sm.scala 170:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 171:48]
      entry_l1_pf_va <= _entry_l1_pf_va_T_5; // @[l1sm.scala 172:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 173:45]
      entry_l1_pf_va <= _entry_l1_pf_va_T_8; // @[l1sm.scala 174:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_2; // @[l1sm.scala 193:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_5; // @[l1sm.scala 198:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_8; // @[l1sm.scala 204:38]
    end
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 194:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 199:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 205:38]
    end
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 195:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 200:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 206:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 254:75]
      state <= 3'h0; // @[l1sm.scala 255:11]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 258:18]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 258:18]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 268:15]
    end else if (3'h1 == state) begin // @[l1sm.scala 258:18]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 224:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 225:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 313:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 315:42]
    end else if (_T_16) begin // @[l1sm.scala 316:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 317:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 310:53]
      entry_inst_new_va_surpass_l1_pf_va <= wire_entry_inst_new_va_surpass_l1_pf_va_set;
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
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  entry_l1_pf_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_l1_pf_ppn = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  entry_l1_page_sec = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_l1_page_share = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_l1_cmp_va_vld = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entry_inst_new_va_surpass_l1_pf_va = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_24) begin
    state = 3'h0;
  end
  if (_T_24) begin
    entry_l1_cmp_va_vld = 1'h0;
  end
  if (_T_24) begin
    entry_inst_new_va_surpass_l1_pf_va = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ct_lsu_pfu_pfb_l2sm(
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cpurst_b,
  input         io_entry_biu_pe_req,
  input         io_entry_biu_pe_req_grnt,
  input  [1:0]  io_entry_biu_pe_req_src,
  input         io_entry_clk,
  input         io_entry_create_dp_vld,
  input  [39:0] io_entry_inst_new_va,
  input         io_entry_mmu_pe_req,
  input  [1:0]  io_entry_mmu_pe_req_src,
  input         io_entry_pf_inst_vld,
  input         io_entry_pop_vld,
  input         io_entry_reinit_vld,
  input         io_entry_stride_neg,
  input  [39:0] io_entry_strideh,
  input         io_entry_tsm_is_judge,
  input         io_forever_cpuclk,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input  [27:0] io_ld_da_ppn_ff,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  output        io_entry_l1_biu_pe_req_set,
  output        io_entry_l1_cmp_va_vld,
  output        io_entry_l1_mmu_pe_req_set,
  output        io_entry_l1_page_sec,
  output        io_entry_l1_page_share,
  output [39:0] io_entry_l1_pf_addr,
  output [39:0] io_entry_l1_pf_va_sub_inst_new_va,
  output [27:0] io_entry_l1_vpn,
  output        io_entry_l1sm_reinit_req,
  output        io_entry_l1sm_va_can_cmp,
  input  [39:0] io_entry_l1_pf_va_t
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_io_clk_in; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_io_clk_out; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_1_io_clk_in; // @[l1sm.scala 146:50]
  wire  gated_clk_cell_1_io_clk_out; // @[l1sm.scala 146:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 250:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 250:72]
  reg [2:0] state; // @[l1sm.scala 251:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge & io_pfu_dcache_pref_en; // @[l1sm.scala 329:127]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 336:66]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 144:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 376:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_io_clk_out; // @[l1sm.scala 146:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 168:29]
  wire [39:0] _entry_l1_pf_va_T_2 = {entry_l1_pf_va[39:32],32'h0}; // @[l1sm.scala 170:79]
  wire [39:0] _entry_l1_pf_va_T_5 = {entry_l1_pf_va[39:32],io_entry_inst_new_va[31:0]}; // @[l1sm.scala 172:79]
  wire [31:0] _wire_entry_l1_pf_va_add_strideh_T_4 = entry_l1_pf_va[31:0] + io_entry_strideh[31:0]; // @[l1sm.scala 341:152]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = {8'h0,_wire_entry_l1_pf_va_add_strideh_T_4}; // @[l1sm.scala 341:110]
  wire [39:0] _entry_l1_pf_va_T_8 = {entry_l1_pf_va[39:32],wire_entry_l1_pf_va_add_strideh[31:0]}; // @[l1sm.scala 174:79]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va[31:0]); // @[l1sm.scala 390:43]
  wire  wire_entry_l1_biu_pe_req_grnt = (~io_pfu_biu_pe_req_sel_l1 | wire_entry_l1_pf_va_eq_inst_new_va) &
    io_entry_biu_pe_req_grnt; // @[l1sm.scala 357:102]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 335:89]
  wire [26:0] _io_entry_l1_vpn_T_2 = {7'h0,entry_l1_pf_va[31:12]}; // @[l1sm.scala 181:92]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_io_clk_out; // @[l1sm.scala 146:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 188:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 189:32]
  reg  entry_l1_page_share; // @[l1sm.scala 190:34]
  wire [27:0] _entry_l1_pf_ppn_T_2 = {entry_l1_pf_ppn[27:20],20'h0}; // @[l1sm.scala 193:97]
  wire [27:0] _entry_l1_pf_ppn_T_5 = {entry_l1_pf_ppn[27:20],io_ld_da_ppn_ff[19:0]}; // @[l1sm.scala 198:97]
  wire [27:0] _entry_l1_pf_ppn_T_8 = {entry_l1_pf_ppn[27:20],io_pfu_get_ppn[19:0]}; // @[l1sm.scala 204:97]
  wire [27:0] _io_entry_l1_pf_addr_T_2 = {8'h0,entry_l1_pf_ppn[19:0]}; // @[l1sm.scala 213:89]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 223:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 224:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 226:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,entry_l1_pf_va[11:0]}; // @[Cat.scala 31:58]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 342:83]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 345:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 271:42]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 273:87 274:17 276:17]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 271:115 272:17]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 280:48 281:17 283:17]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 289:69 290:17 292:17]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 287:64 288:17]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 296:42 297:17 299:17]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 257:11 258:18]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 258:18]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 258:18]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 310:53]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[31]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 391:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[1]; // @[l1sm.scala 352:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[1]; // @[l1sm.scala 363:56]
  wire [31:0] _io_entry_l1_pf_va_sub_inst_new_va_T_4 = entry_l1_pf_va[31:0] - io_entry_l1_pf_va_t[31:0]; // @[l1sm.scala 384:157]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 146:50]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 146:50]
    .io_clk_in(gated_clk_cell_1_io_clk_in),
    .io_clk_out(gated_clk_cell_1_io_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 319:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 231:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 365:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 216:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 217:28]
  assign io_entry_l1_pf_addr = {_io_entry_l1_pf_addr_T_2,entry_l1_pf_va[11:0]}; // @[l1sm.scala 213:123]
  assign io_entry_l1_pf_va_sub_inst_new_va = {8'h0,_io_entry_l1_pf_va_sub_inst_new_va_T_4}; // @[l1sm.scala 384:115]
  assign io_entry_l1_vpn = {{1'd0}, _io_entry_l1_vpn_T_2}; // @[l1sm.scala 181:21]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 320:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 324:52]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 146:31 148:30]
  assign gated_clk_cell_1_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 146:31 148:30]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 169:31]
      entry_l1_pf_va <= _entry_l1_pf_va_T_2; // @[l1sm.scala 170:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 171:48]
      entry_l1_pf_va <= _entry_l1_pf_va_T_5; // @[l1sm.scala 172:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 173:45]
      entry_l1_pf_va <= _entry_l1_pf_va_T_8; // @[l1sm.scala 174:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_2; // @[l1sm.scala 193:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_5; // @[l1sm.scala 198:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_8; // @[l1sm.scala 204:38]
    end
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 194:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 199:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 205:38]
    end
    if (_T_23) begin // @[l1sm.scala 192:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 195:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 196:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 200:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 202:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 206:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 254:75]
      state <= 3'h0; // @[l1sm.scala 255:11]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 258:18]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 258:18]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 268:15]
    end else if (3'h1 == state) begin // @[l1sm.scala 258:18]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 224:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 225:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 313:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 315:42]
    end else if (_T_16) begin // @[l1sm.scala 316:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 317:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 310:53]
      entry_inst_new_va_surpass_l1_pf_va <= wire_entry_inst_new_va_surpass_l1_pf_va_set;
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
  state = _RAND_0[2:0];
  _RAND_1 = {2{`RANDOM}};
  entry_l1_pf_va = _RAND_1[39:0];
  _RAND_2 = {1{`RANDOM}};
  entry_l1_pf_ppn = _RAND_2[27:0];
  _RAND_3 = {1{`RANDOM}};
  entry_l1_page_sec = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  entry_l1_page_share = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  entry_l1_cmp_va_vld = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  entry_inst_new_va_surpass_l1_pf_va = _RAND_6[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_24) begin
    state = 3'h0;
  end
  if (_T_24) begin
    entry_l1_cmp_va_vld = 1'h0;
  end
  if (_T_24) begin
    entry_inst_new_va_surpass_l1_pf_va = 1'h1;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module gpfb(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
  input  [1:0]  io_cp0_yy_priv_mode,
  input         io_cpurst_b,
  input         io_forever_cpuclk,
  input         io_ld_da_page_sec_ff,
  input         io_ld_da_page_share_ff,
  input         io_ld_da_pfu_act_vld,
  input         io_ld_da_pfu_pf_inst_vld,
  input  [39:0] io_ld_da_pfu_va,
  input  [27:0] io_ld_da_ppn_ff,
  input  [3:0]  io_lsu_pfu_l1_dist_sel,
  input  [3:0]  io_lsu_pfu_l2_dist_sel,
  input         io_pad_yy_icg_scan_en,
  input         io_pfu_biu_pe_req_sel_l1,
  input         io_pfu_dcache_pref_en,
  input         io_pfu_get_page_sec,
  input         io_pfu_get_page_share,
  input  [27:0] io_pfu_get_ppn,
  input         io_pfu_get_ppn_err,
  input         io_pfu_get_ppn_vld,
  input         io_pfu_gpfb_biu_pe_req_grnt,
  input         io_pfu_gpfb_from_lfb_dcache_hit,
  input         io_pfu_gpfb_from_lfb_dcache_miss,
  input         io_pfu_gpfb_mmu_pe_req_grnt,
  input         io_pfu_gsdb_gpfb_create_vld,
  input         io_pfu_gsdb_gpfb_pop_req,
  input  [10:0] io_pfu_gsdb_stride,
  input         io_pfu_gsdb_stride_neg,
  input  [6:0]  io_pfu_gsdb_strideh_6to0,
  input         io_pfu_l2_pref_en,
  input         io_pfu_mmu_pe_req_sel_l1,
  input         io_pfu_pop_all_vld,
  output        io_pfu_gpfb_biu_pe_req,
  output [1:0]  io_pfu_gpfb_biu_pe_req_src,
  output        io_pfu_gpfb_l1_page_sec,
  output        io_pfu_gpfb_l1_page_share,
  output [39:0] io_pfu_gpfb_l1_pf_addr,
  output [27:0] io_pfu_gpfb_l1_vpn,
  output        io_pfu_gpfb_l2_page_sec,
  output        io_pfu_gpfb_l2_page_share,
  output [39:0] io_pfu_gpfb_l2_pf_addr,
  output [27:0] io_pfu_gpfb_l2_vpn,
  output        io_pfu_gpfb_mmu_pe_req,
  output [1:0]  io_pfu_gpfb_mmu_pe_req_src,
  output [1:0]  io_pfu_gpfb_priv_mode,
  output        io_pfu_gpfb_vld
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  gated_clk_cell_io_clk_in; // @[gpfb.scala 113:50]
  wire  gated_clk_cell_io_clk_out; // @[gpfb.scala 113:50]
  wire  gated_clk_cell_1_io_clk_in; // @[gpfb.scala 113:50]
  wire  gated_clk_cell_1_io_clk_out; // @[gpfb.scala 113:50]
  wire [1:0] ct_lsu_pfu_pfb_tsm_io_cp0_yy_priv_mode; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_cpurst_b; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_act_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_grnt; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_clk; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_create_dp_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_create_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_hit; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_miss; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_l2_biu_pe_req_set; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_l2_mmu_pe_req_set; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_grnt; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_pf_inst_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_pop_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_reinit_vld; // @[gpfb.scala 176:27]
  wire [10:0] ct_lsu_pfu_pfb_tsm_io_entry_stride; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_stride_neg; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_forever_cpuclk; // @[gpfb.scala 176:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_io_pipe_va; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req; // @[gpfb.scala 176:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_src; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_dcache_hit_pop_req; // @[gpfb.scala 176:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_io_entry_inst_new_va; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req; // @[gpfb.scala 176:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_src; // @[gpfb.scala 176:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_io_entry_priv_mode; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_tsm_is_judge; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_tsm_io_entry_vld; // @[gpfb.scala 176:27]
  wire  ct_lsu_pfu_pfb_l1sm_io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_cpurst_b; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_grnt; // @[gpfb.scala 213:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_src; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_clk; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_create_dp_vld; // @[gpfb.scala 213:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_io_entry_inst_new_va; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req; // @[gpfb.scala 213:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req_src; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_pf_inst_vld; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_pop_vld; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_reinit_vld; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_stride_neg; // @[gpfb.scala 213:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_io_entry_strideh; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_tsm_is_judge; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_forever_cpuclk; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_ld_da_page_sec_ff; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_ld_da_page_share_ff; // @[gpfb.scala 213:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_io_ld_da_ppn_ff; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_dcache_pref_en; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_sec; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_share; // @[gpfb.scala 213:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_err; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_vld; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1_cmp_va_vld; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_sec; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_share; // @[gpfb.scala 213:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_addr; // @[gpfb.scala 213:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 213:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_io_entry_l1_vpn; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_reinit_req; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 213:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va; // @[gpfb.scala 213:32]
  wire  ct_lsu_pfu_pfb_l2sm_io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_cpurst_b; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_grnt; // @[gpfb.scala 213:64]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_src; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_clk; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_create_dp_vld; // @[gpfb.scala 213:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_io_entry_inst_new_va; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req; // @[gpfb.scala 213:64]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req_src; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_pf_inst_vld; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_pop_vld; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_reinit_vld; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_stride_neg; // @[gpfb.scala 213:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_io_entry_strideh; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_tsm_is_judge; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_forever_cpuclk; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_ld_da_page_sec_ff; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_ld_da_page_share_ff; // @[gpfb.scala 213:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_io_ld_da_ppn_ff; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_dcache_pref_en; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_sec; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_share; // @[gpfb.scala 213:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_err; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_vld; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1_cmp_va_vld; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_sec; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_share; // @[gpfb.scala 213:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_addr; // @[gpfb.scala 213:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 213:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_io_entry_l1_vpn; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_reinit_req; // @[gpfb.scala 213:64]
  wire  ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 213:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_t; // @[gpfb.scala 213:64]
  wire  _T_2 = ~io_cpurst_b; // @[gpfb.scala 136:68]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_io_clk_out; // @[gpfb.scala 113:{31,31}]
  reg [6:0] pfu_gpfb_strideh_6to0; // @[gpfb.scala 137:40]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_io_clk_out; // @[gpfb.scala 113:{31,31}]
  reg  pfu_gpfb_inst_new_va_too_far_l1_pf_va; // @[gpfb.scala 147:56]
  reg  pfu_gpfb_l1_pf_va_too_far_l2_pf_va; // @[gpfb.scala 148:53]
  wire  wire_pfu_gpfb_l1sm_reinit_req = ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_reinit_req; // @[gpfb.scala 106:18 358:37]
  wire  wire_pfu_gpfb_l2sm_reinit_req = ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_reinit_req; // @[gpfb.scala 106:18 374:37]
  wire  wire_pfu_gpfb_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 429:69]
  wire  wire_pfu_gpfb_l1_cmp_va_vld = ct_lsu_pfu_pfb_l1sm_io_entry_l1_cmp_va_vld; // @[gpfb.scala 106:18 362:35]
  wire  wire_pfu_gpfb_l1sm_va_can_cmp = ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 106:18 359:37]
  wire [39:0] wire_pfu_gpfb_l1_pf_va_sub_inst_new_va = ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 106:18 367:46]
  wire [39:0] _wire_pfu_gpfb_l1sm_diff_sub_32strideh_T_2 = {8'h0,wire_pfu_gpfb_l1_pf_va_sub_inst_new_va[31:0]}; // @[gpfb.scala 417:116]
  wire [20:0] _wire_pfu_gpfb_strideh_T_1 = io_pfu_gsdb_stride_neg ? 21'h1fffff : 21'h0; // @[Bitwise.scala 74:12]
  wire [32:0] _wire_pfu_gpfb_strideh_T_4 = {8'h0,_wire_pfu_gpfb_strideh_T_1,io_pfu_gsdb_stride[10:7]}; // @[gpfb.scala 166:129]
  wire [39:0] wire_pfu_gpfb_strideh = {8'h0,_wire_pfu_gpfb_strideh_T_1,io_pfu_gsdb_stride[10:7],pfu_gpfb_strideh_6to0}; // @[gpfb.scala 166:159]
  wire [39:0] wire_pfb_gpfb_32strideh = {8'h0,wire_pfu_gpfb_strideh[26:0],5'h0}; // @[gpfb.scala 413:132]
  wire [39:0] _GEN_5 = {{8'd0}, wire_pfb_gpfb_32strideh[31:0]}; // @[gpfb.scala 417:172]
  wire [39:0] wire_pfu_gpfb_l1sm_diff_sub_32strideh = _wire_pfu_gpfb_l1sm_diff_sub_32strideh_T_2 - _GEN_5; // @[gpfb.scala 417:172]
  wire  wire_pfu_gpfb_inst_new_va_too_far_l1_pf_va_set = io_pfu_gsdb_stride_neg == wire_pfu_gpfb_l1sm_diff_sub_32strideh
    [31]; // @[gpfb.scala 419:77]
  wire  wire_pfu_gpfb_l2_cmp_va_vld = ct_lsu_pfu_pfb_l2sm_io_entry_l1_cmp_va_vld; // @[gpfb.scala 106:18 378:35]
  wire  wire_pfu_gpfb_l2sm_va_can_cmp = ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 106:18 375:37]
  wire [39:0] wire_pfu_gpfb_l2_pf_va_sub_l1_pf_va = ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 106:18 383:43]
  wire [39:0] _wire_pfu_gpfb_l2sm_diff_sub_128strideh_T_2 = {8'h0,wire_pfu_gpfb_l2_pf_va_sub_l1_pf_va[31:0]}; // @[gpfb.scala 422:118]
  wire [39:0] wire_pfb_gpfb_128strideh = {8'h0,wire_pfu_gpfb_strideh[24:0],7'h0}; // @[gpfb.scala 414:133]
  wire [39:0] _GEN_6 = {{8'd0}, wire_pfb_gpfb_128strideh[31:0]}; // @[gpfb.scala 422:171]
  wire [39:0] wire_pfu_gpfb_l2sm_diff_sub_128strideh = _wire_pfu_gpfb_l2sm_diff_sub_128strideh_T_2 - _GEN_6; // @[gpfb.scala 422:171]
  wire  wire_pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set = io_pfu_gsdb_stride_neg == wire_pfu_gpfb_l2sm_diff_sub_128strideh[
    31]; // @[gpfb.scala 424:73]
  wire  wire_pfu_gpfb_dcache_hit_pop_req = ct_lsu_pfu_pfb_tsm_io_entry_dcache_hit_pop_req; // @[gpfb.scala 106:18 188:39]
  wire  _wire_pfu_gpfb_pop_vld_T_1 = wire_pfu_gpfb_dcache_hit_pop_req | pfu_gpfb_inst_new_va_too_far_l1_pf_va; // @[gpfb.scala 163:7]
  wire  _wire_pfu_gpfb_pop_vld_T_3 = _wire_pfu_gpfb_pop_vld_T_1 | pfu_gpfb_l1_pf_va_too_far_l2_pf_va; // @[gpfb.scala 164:7]
  wire  _wire_pfu_gpfb_pop_vld_T_4 = _wire_pfu_gpfb_pop_vld_T_3 | io_pfu_gsdb_gpfb_pop_req; // @[gpfb.scala 165:7]
  gated_clk_cell gated_clk_cell ( // @[gpfb.scala 113:50]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[gpfb.scala 113:50]
    .io_clk_in(gated_clk_cell_1_io_clk_in),
    .io_clk_out(gated_clk_cell_1_io_clk_out)
  );
  ct_lsu_pfu_pfb_tsm ct_lsu_pfu_pfb_tsm ( // @[gpfb.scala 176:27]
    .io_cp0_yy_priv_mode(ct_lsu_pfu_pfb_tsm_io_cp0_yy_priv_mode),
    .io_cpurst_b(ct_lsu_pfu_pfb_tsm_io_cpurst_b),
    .io_entry_act_vld(ct_lsu_pfu_pfb_tsm_io_entry_act_vld),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_grnt),
    .io_entry_clk(ct_lsu_pfu_pfb_tsm_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_tsm_io_entry_create_dp_vld),
    .io_entry_create_vld(ct_lsu_pfu_pfb_tsm_io_entry_create_vld),
    .io_entry_from_lfb_dcache_hit(ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_hit),
    .io_entry_from_lfb_dcache_miss(ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_miss),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_io_entry_l1_mmu_pe_req_set),
    .io_entry_l2_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_io_entry_l2_biu_pe_req_set),
    .io_entry_l2_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_io_entry_l2_mmu_pe_req_set),
    .io_entry_mmu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_grnt),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_tsm_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_tsm_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_tsm_io_entry_reinit_vld),
    .io_entry_stride(ct_lsu_pfu_pfb_tsm_io_entry_stride),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_tsm_io_entry_stride_neg),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_tsm_io_forever_cpuclk),
    .io_pipe_va(ct_lsu_pfu_pfb_tsm_io_pipe_va),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_src),
    .io_entry_dcache_hit_pop_req(ct_lsu_pfu_pfb_tsm_io_entry_dcache_hit_pop_req),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_tsm_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_src),
    .io_entry_priv_mode(ct_lsu_pfu_pfb_tsm_io_entry_priv_mode),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_tsm_io_entry_tsm_is_judge),
    .io_entry_vld(ct_lsu_pfu_pfb_tsm_io_entry_vld)
  );
  ct_lsu_pfu_pfb_l1sm ct_lsu_pfu_pfb_l1sm ( // @[gpfb.scala 213:32]
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l1sm_io_cp0_lsu_pfu_mmu_dis),
    .io_cpurst_b(ct_lsu_pfu_pfb_l1sm_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l1sm_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l1sm_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l1sm_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l1sm_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l1sm_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l1sm_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l1sm_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l1sm_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l1sm_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l1sm_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l1sm_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l1sm_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l1sm_io_ld_da_ppn_ff),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l1sm_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l1sm_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l1sm_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l1sm_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l1sm_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l1sm_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l1sm_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va(ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va)
  );
  ct_lsu_pfu_pfb_l2sm ct_lsu_pfu_pfb_l2sm ( // @[gpfb.scala 213:64]
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l2sm_io_cp0_lsu_pfu_mmu_dis),
    .io_cpurst_b(ct_lsu_pfu_pfb_l2sm_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l2sm_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l2sm_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l2sm_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l2sm_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l2sm_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l2sm_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l2sm_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l2sm_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l2sm_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l2sm_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l2sm_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l2sm_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l2sm_io_ld_da_ppn_ff),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l2sm_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l2sm_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l2sm_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l2sm_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l2sm_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l2sm_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l2sm_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va_t(ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_t)
  );
  assign io_pfu_gpfb_biu_pe_req = ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req; // @[gpfb.scala 182:39]
  assign io_pfu_gpfb_biu_pe_req_src = ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_src; // @[gpfb.scala 184:39]
  assign io_pfu_gpfb_l1_page_sec = ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_sec; // @[gpfb.scala 364:31]
  assign io_pfu_gpfb_l1_page_share = ct_lsu_pfu_pfb_l1sm_io_entry_l1_page_share; // @[gpfb.scala 365:33]
  assign io_pfu_gpfb_l1_pf_addr = ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_addr; // @[gpfb.scala 366:30]
  assign io_pfu_gpfb_l1_vpn = ct_lsu_pfu_pfb_l1sm_io_entry_l1_vpn; // @[gpfb.scala 368:26]
  assign io_pfu_gpfb_l2_page_sec = ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_sec; // @[gpfb.scala 380:31]
  assign io_pfu_gpfb_l2_page_share = ct_lsu_pfu_pfb_l2sm_io_entry_l1_page_share; // @[gpfb.scala 381:33]
  assign io_pfu_gpfb_l2_pf_addr = ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_addr; // @[gpfb.scala 382:30]
  assign io_pfu_gpfb_l2_vpn = ct_lsu_pfu_pfb_l2sm_io_entry_l1_vpn; // @[gpfb.scala 384:26]
  assign io_pfu_gpfb_mmu_pe_req = ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req; // @[gpfb.scala 196:39]
  assign io_pfu_gpfb_mmu_pe_req_src = ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_src; // @[gpfb.scala 198:39]
  assign io_pfu_gpfb_priv_mode = ct_lsu_pfu_pfb_tsm_io_entry_priv_mode; // @[gpfb.scala 201:39]
  assign io_pfu_gpfb_vld = ct_lsu_pfu_pfb_tsm_io_entry_vld; // @[gpfb.scala 206:39]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[gpfb.scala 113:31 115:30]
  assign gated_clk_cell_1_io_clk_in = io_forever_cpuclk; // @[gpfb.scala 113:31 115:30]
  assign ct_lsu_pfu_pfb_tsm_io_cp0_yy_priv_mode = io_cp0_yy_priv_mode; // @[gpfb.scala 179:39]
  assign ct_lsu_pfu_pfb_tsm_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 180:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_act_vld = io_pfu_gpfb_vld & io_ld_da_pfu_act_vld; // @[gpfb.scala 171:45]
  assign ct_lsu_pfu_pfb_tsm_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 183:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_clk = gated_clk_cell_io_clk_out; // @[gpfb.scala 113:{31,31}]
  assign ct_lsu_pfu_pfb_tsm_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 106:18 435:35]
  assign ct_lsu_pfu_pfb_tsm_io_entry_create_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 106:18 434:35]
  assign ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_hit = io_pfu_gpfb_from_lfb_dcache_hit; // @[gpfb.scala 189:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_from_lfb_dcache_miss = io_pfu_gpfb_from_lfb_dcache_miss; // @[gpfb.scala 190:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_l1_biu_pe_req_set = ct_lsu_pfu_pfb_l1sm_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 106:18 361:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_l1_mmu_pe_req_set = ct_lsu_pfu_pfb_l1sm_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 106:18 363:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_l2_biu_pe_req_set = ct_lsu_pfu_pfb_l2sm_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 106:18 377:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_l2_mmu_pe_req_set = ct_lsu_pfu_pfb_l2sm_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 106:18 379:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_mmu_pe_req_grnt = io_pfu_gpfb_mmu_pe_req_grnt; // @[gpfb.scala 197:39]
  assign ct_lsu_pfu_pfb_tsm_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 170:49]
  assign ct_lsu_pfu_pfb_tsm_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 162:50]
  assign ct_lsu_pfu_pfb_tsm_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 429:69]
  assign ct_lsu_pfu_pfb_tsm_io_entry_stride = io_pfu_gsdb_stride; // @[gpfb.scala 131:45]
  assign ct_lsu_pfu_pfb_tsm_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 106:18 132:31]
  assign ct_lsu_pfu_pfb_tsm_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 207:39]
  assign ct_lsu_pfu_pfb_tsm_io_pipe_va = io_ld_da_pfu_va; // @[gpfb.scala 209:39]
  assign ct_lsu_pfu_pfb_l1sm_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 321:32]
  assign ct_lsu_pfu_pfb_l1sm_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 323:21]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req = io_pfu_gpfb_biu_pe_req; // @[gpfb.scala 324:29]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 325:34]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_biu_pe_req_src = io_pfu_gpfb_biu_pe_req_src; // @[gpfb.scala 326:33]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_clk = gated_clk_cell_io_clk_out; // @[gpfb.scala 113:{31,31}]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 106:18 435:35]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_io_entry_inst_new_va; // @[gpfb.scala 106:18 191:39]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req = io_pfu_gpfb_mmu_pe_req; // @[gpfb.scala 329:29]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_mmu_pe_req_src = io_pfu_gpfb_mmu_pe_req_src; // @[gpfb.scala 331:33]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 170:49]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 162:50]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 429:69]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 106:18 132:31]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_strideh = {_wire_pfu_gpfb_strideh_T_4,pfu_gpfb_strideh_6to0}; // @[gpfb.scala 166:159]
  assign ct_lsu_pfu_pfb_l1sm_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_io_entry_tsm_is_judge; // @[gpfb.scala 106:18 205:39]
  assign ct_lsu_pfu_pfb_l1sm_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 338:27]
  assign ct_lsu_pfu_pfb_l1sm_io_ld_da_page_sec_ff = io_ld_da_page_sec_ff; // @[gpfb.scala 339:30]
  assign ct_lsu_pfu_pfb_l1sm_io_ld_da_page_share_ff = io_ld_da_page_share_ff; // @[gpfb.scala 340:32]
  assign ct_lsu_pfu_pfb_l1sm_io_ld_da_ppn_ff = io_ld_da_ppn_ff; // @[gpfb.scala 341:25]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 343:34]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_dcache_pref_en = io_pfu_dcache_pref_en; // @[gpfb.scala 354:33]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[gpfb.scala 344:29]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_get_page_share = io_pfu_get_page_share; // @[gpfb.scala 345:31]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn = io_pfu_get_ppn; // @[gpfb.scala 346:24]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[gpfb.scala 347:28]
  assign ct_lsu_pfu_pfb_l1sm_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[gpfb.scala 348:28]
  assign ct_lsu_pfu_pfb_l2sm_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 321:32]
  assign ct_lsu_pfu_pfb_l2sm_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 323:21]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req = io_pfu_gpfb_biu_pe_req; // @[gpfb.scala 324:29]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 325:34]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_biu_pe_req_src = io_pfu_gpfb_biu_pe_req_src; // @[gpfb.scala 326:33]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_clk = gated_clk_cell_io_clk_out; // @[gpfb.scala 113:{31,31}]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 106:18 435:35]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_io_entry_inst_new_va; // @[gpfb.scala 106:18 191:39]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req = io_pfu_gpfb_mmu_pe_req; // @[gpfb.scala 329:29]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_mmu_pe_req_src = io_pfu_gpfb_mmu_pe_req_src; // @[gpfb.scala 331:33]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 170:49]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 162:50]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 429:69]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 106:18 132:31]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_strideh = {_wire_pfu_gpfb_strideh_T_4,pfu_gpfb_strideh_6to0}; // @[gpfb.scala 166:159]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_io_entry_tsm_is_judge; // @[gpfb.scala 106:18 205:39]
  assign ct_lsu_pfu_pfb_l2sm_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 338:27]
  assign ct_lsu_pfu_pfb_l2sm_io_ld_da_page_sec_ff = io_ld_da_page_sec_ff; // @[gpfb.scala 339:30]
  assign ct_lsu_pfu_pfb_l2sm_io_ld_da_page_share_ff = io_ld_da_page_share_ff; // @[gpfb.scala 340:32]
  assign ct_lsu_pfu_pfb_l2sm_io_ld_da_ppn_ff = io_ld_da_ppn_ff; // @[gpfb.scala 341:25]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 343:34]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_dcache_pref_en = io_pfu_l2_pref_en; // @[gpfb.scala 370:33]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[gpfb.scala 344:29]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_get_page_share = io_pfu_get_page_share; // @[gpfb.scala 345:31]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn = io_pfu_get_ppn; // @[gpfb.scala 346:24]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[gpfb.scala 347:28]
  assign ct_lsu_pfu_pfb_l2sm_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[gpfb.scala 348:28]
  assign ct_lsu_pfu_pfb_l2sm_io_entry_l1_pf_va_t = ct_lsu_pfu_pfb_l1sm_io_entry_l1_pf_va; // @[gpfb.scala 106:18 356:30]
  always @(posedge gated_clk_inst_1_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 139:38]
      pfu_gpfb_strideh_6to0 <= 7'h0; // @[gpfb.scala 140:29]
    end else if (io_pfu_gsdb_gpfb_create_vld) begin // @[gpfb.scala 137:40]
      pfu_gpfb_strideh_6to0 <= io_pfu_gsdb_strideh_6to0;
    end
  end
  always @(posedge gated_clk_inst_0_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 151:67]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= 1'h0; // @[gpfb.scala 152:46]
    end else if (io_pfu_gsdb_gpfb_create_vld | wire_pfu_gpfb_reinit_vld) begin // @[gpfb.scala 155:73]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= 1'h0; // @[gpfb.scala 156:47]
    end else if (wire_pfu_gpfb_l1_cmp_va_vld & wire_pfu_gpfb_l1sm_va_can_cmp) begin // @[gpfb.scala 147:56]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= wire_pfu_gpfb_inst_new_va_too_far_l1_pf_va_set;
    end
  end
  always @(posedge gated_clk_inst_0_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 151:67]
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va <= 1'h0; // @[gpfb.scala 153:42]
    end else if (io_pfu_gsdb_gpfb_create_vld | wire_pfu_gpfb_reinit_vld) begin // @[gpfb.scala 158:74]
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va <= 1'h0; // @[gpfb.scala 159:44]
    end else if (wire_pfu_gpfb_l2_cmp_va_vld & wire_pfu_gpfb_l2sm_va_can_cmp) begin // @[gpfb.scala 148:53]
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va <= wire_pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set;
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
  pfu_gpfb_strideh_6to0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  pfu_gpfb_inst_new_va_too_far_l1_pf_va = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  pfu_gpfb_l1_pf_va_too_far_l2_pf_va = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  if (_T_2) begin
    pfu_gpfb_strideh_6to0 = 7'h0;
  end
  if (_T_2) begin
    pfu_gpfb_inst_new_va_too_far_l1_pf_va = 1'h0;
  end
  if (_T_2) begin
    pfu_gpfb_l1_pf_va_too_far_l2_pf_va = 1'h0;
  end
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
