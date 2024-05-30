module ct_lsu_pfu_pfb_tsm_tmp(
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
  wire  gated_clk_cell_clk_in; // @[tsm.scala 28:29]
  wire  gated_clk_cell_global_en; // @[tsm.scala 28:29]
  wire  gated_clk_cell_module_en; // @[tsm.scala 28:29]
  wire  gated_clk_cell_local_en; // @[tsm.scala 28:29]
  wire  gated_clk_cell_external_en; // @[tsm.scala 28:29]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[tsm.scala 28:29]
  wire  gated_clk_cell_clk_out; // @[tsm.scala 28:29]
  wire  _T_2 = ~io_cpurst_b; // @[tsm.scala 39:57]
  reg [1:0] state; // @[tsm.scala 40:24]
  wire [20:0] _wire_entry_stride_ext_T_1 = io_entry_stride_neg ? 21'h1fffff : 21'h0; // @[Bitwise.scala 74:12]
  wire [39:0] wire_entry_stride_ext = {8'h0,_wire_entry_stride_ext_T_1,io_entry_stride}; // @[tsm.scala 134:124]
  wire [12:0] _GEN_19 = {{1'd0}, io_pipe_va[11:0]}; // @[tsm.scala 139:42]
  wire [12:0] wire_entry_sum_4k = _GEN_19 + wire_entry_stride_ext[12:0]; // @[tsm.scala 139:42]
  wire  wire_entry_inst_new_va_cross_4k = wire_entry_sum_4k[12]; // @[tsm.scala 141:57]
  wire [1:0] _GEN_2 = io_entry_reinit_vld ? 2'h2 : 2'h3; // @[tsm.scala 62:37 63:19 65:19]
  wire  wire_entry_pf_inst_vld_clk = gated_clk_cell_clk_out; // @[tsm.scala 16:18 30:30]
  reg [39:0] entry_inst_new_va; // @[tsm.scala 80:36]
  reg [1:0] entry_priv_mode; // @[tsm.scala 81:34]
  wire [39:0] _wire_entry_pipe_va_add_stride_T_1 = {8'h0,io_pipe_va[31:0]}; // @[tsm.scala 137:98]
  wire [39:0] _GEN_20 = {{8'd0}, wire_entry_stride_ext[31:0]}; // @[tsm.scala 137:127]
  wire [39:0] wire_entry_pipe_va_add_stride = _wire_entry_pipe_va_add_stride_T_1 + _GEN_20; // @[tsm.scala 137:127]
  wire [39:0] _entry_inst_new_va_T_2 = {8'h0,wire_entry_pipe_va_add_stride[31:0]}; // @[tsm.scala 83:82]
  reg  entry_already_dcache_hit; // @[tsm.scala 94:43]
  wire  _GEN_9 = io_entry_from_lfb_dcache_hit | entry_already_dcache_hit; // @[tsm.scala 97:45 98:32 94:43]
  reg  entry_biu_pe_req; // @[tsm.scala 106:35]
  reg [1:0] entry_biu_pe_req_src; // @[tsm.scala 107:39]
  wire  wire_entry_biu_pe_req_set = io_entry_l2_biu_pe_req_set | io_entry_l1_biu_pe_req_set; // @[tsm.scala 146:66]
  wire [1:0] wire_entry_biu_pe_req_set_src = {io_entry_l2_biu_pe_req_set,io_entry_l1_biu_pe_req_set}; // @[tsm.scala 147:64]
  wire [1:0] _entry_biu_pe_req_src_T = entry_biu_pe_req_src | wire_entry_biu_pe_req_set_src; // @[tsm.scala 113:52]
  wire  _GEN_11 = wire_entry_biu_pe_req_set | entry_biu_pe_req; // @[tsm.scala 111:49 112:24 106:35]
  reg  entry_mmu_pe_req; // @[tsm.scala 121:35]
  reg [1:0] entry_mmu_pe_req_src; // @[tsm.scala 122:39]
  wire  wire_entry_mmu_pe_req_set = io_entry_l2_mmu_pe_req_set | io_entry_l1_mmu_pe_req_set; // @[tsm.scala 151:66]
  wire [1:0] wire_entry_mmu_pe_req_set_src = {io_entry_l2_mmu_pe_req_set,io_entry_l1_mmu_pe_req_set}; // @[tsm.scala 152:64]
  wire [1:0] _entry_mmu_pe_req_src_T = entry_mmu_pe_req_src | wire_entry_mmu_pe_req_set_src; // @[tsm.scala 128:52]
  wire  _GEN_15 = wire_entry_mmu_pe_req_set | entry_mmu_pe_req; // @[tsm.scala 126:49 127:24 121:35]
  gated_clk_cell gated_clk_cell ( // @[tsm.scala 28:29]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  assign io_entry_biu_pe_req = entry_biu_pe_req; // @[tsm.scala 115:25]
  assign io_entry_biu_pe_req_src = entry_biu_pe_req_src; // @[tsm.scala 116:29]
  assign io_entry_dcache_hit_pop_req = entry_already_dcache_hit & io_entry_from_lfb_dcache_hit; // @[tsm.scala 100:68]
  assign io_entry_inst_new_va = entry_inst_new_va; // @[tsm.scala 86:26]
  assign io_entry_mmu_pe_req = entry_mmu_pe_req; // @[tsm.scala 130:25]
  assign io_entry_mmu_pe_req_src = entry_mmu_pe_req_src; // @[tsm.scala 131:29]
  assign io_entry_priv_mode = entry_priv_mode; // @[tsm.scala 87:24]
  assign io_entry_tsm_is_judge = state == 2'h3; // @[tsm.scala 74:43]
  assign io_entry_vld = state[1]; // @[tsm.scala 73:33]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[tsm.scala 29:24]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[tsm.scala 32:27]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[tsm.scala 34:27]
  assign gated_clk_cell_local_en = io_entry_vld & io_entry_pf_inst_vld; // @[tsm.scala 26:49]
  assign gated_clk_cell_external_en = 1'h0; // @[tsm.scala 31:29]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[tsm.scala 35:36]
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 42:28]
      state <= 2'h0; // @[tsm.scala 43:13]
    end else if (io_entry_pop_vld) begin // @[tsm.scala 46:21]
      state <= 2'h0; // @[tsm.scala 48:37 49:19 51:19]
    end else if (2'h0 == state) begin // @[tsm.scala 46:21]
      if (io_entry_create_vld) begin // @[tsm.scala 55:94]
        state <= 2'h2; // @[tsm.scala 56:19]
      end else begin
        state <= 2'h0; // @[tsm.scala 58:19]
      end
    end else if (2'h2 == state) begin // @[tsm.scala 46:21]
      if (io_entry_act_vld & ~wire_entry_inst_new_va_cross_4k & ~io_entry_reinit_vld) begin
        state <= 2'h3;
      end else begin
        state <= 2'h2;
      end
    end else if (2'h3 == state) begin // @[tsm.scala 45:13]
      state <= _GEN_2;
    end else begin
      state <= 2'h0;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 82:31]
      entry_inst_new_va <= 40'h0; // @[tsm.scala 83:25]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 80:36]
      entry_inst_new_va <= _entry_inst_new_va_T_2;
    end
  end
  always @(posedge wire_entry_pf_inst_vld_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 82:31]
      entry_priv_mode <= 2'h0; // @[tsm.scala 84:23]
    end else if (io_entry_pf_inst_vld) begin // @[tsm.scala 81:34]
      entry_priv_mode <= io_cp0_yy_priv_mode;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 95:66]
      entry_already_dcache_hit <= 1'h0; // @[tsm.scala 96:32]
    end else if (io_entry_create_dp_vld | io_entry_from_lfb_dcache_miss) begin
      entry_already_dcache_hit <= 1'h0;
    end else begin
      entry_already_dcache_hit <= _GEN_9;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 108:55]
      entry_biu_pe_req <= 1'h0; // @[tsm.scala 109:24]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin
      entry_biu_pe_req <= 1'h0;
    end else begin
      entry_biu_pe_req <= _GEN_11;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 108:55]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 110:28]
    end else if (io_entry_pop_vld | io_entry_biu_pe_req_grnt) begin // @[tsm.scala 111:49]
      entry_biu_pe_req_src <= 2'h0; // @[tsm.scala 113:28]
    end else if (wire_entry_biu_pe_req_set) begin // @[tsm.scala 107:39]
      entry_biu_pe_req_src <= _entry_biu_pe_req_src_T;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 123:55]
      entry_mmu_pe_req <= 1'h0; // @[tsm.scala 124:24]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin
      entry_mmu_pe_req <= 1'h0;
    end else begin
      entry_mmu_pe_req <= _GEN_15;
    end
  end
  always @(posedge io_entry_clk or posedge _T_2) begin
    if (_T_2) begin // @[tsm.scala 123:55]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 125:28]
    end else if (io_entry_pop_vld | io_entry_mmu_pe_req_grnt) begin // @[tsm.scala 126:49]
      entry_mmu_pe_req_src <= 2'h0; // @[tsm.scala 128:28]
    end else if (wire_entry_mmu_pe_req_set) begin // @[tsm.scala 122:39]
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
module ct_lsu_pfu_pfb_l1sm_tmp(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
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
  input         io_pad_yy_icg_scan_en,
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
  wire  gated_clk_cell_clk_in; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_global_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_module_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_local_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_external_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_clk_out; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_clk_in; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_global_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_module_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_local_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_external_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_clk_out; // @[l1sm.scala 59:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 163:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 163:72]
  reg [2:0] state; // @[l1sm.scala 164:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge; // @[l1sm.scala 240:95]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 249:66]
  wire  wire_entry_l1_pf_va_add_gateclk_en = state == 3'h1 | io_entry_biu_pe_req_grnt; // @[l1sm.scala 249:96]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 57:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 289:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_clk_out; // @[l1sm.scala 59:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 81:29]
  wire [39:0] _entry_l1_pf_va_T_2 = {entry_l1_pf_va[39:32],32'h0}; // @[l1sm.scala 83:79]
  wire [39:0] _entry_l1_pf_va_T_5 = {entry_l1_pf_va[39:32],io_entry_inst_new_va[31:0]}; // @[l1sm.scala 85:79]
  wire [31:0] _wire_entry_l1_pf_va_add_strideh_T_4 = io_entry_l1_pf_va[31:0] + io_entry_strideh[31:0]; // @[l1sm.scala 251:150]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = {8'h0,_wire_entry_l1_pf_va_add_strideh_T_4}; // @[l1sm.scala 251:110]
  wire [39:0] _entry_l1_pf_va_T_8 = {entry_l1_pf_va[39:32],wire_entry_l1_pf_va_add_strideh[31:0]}; // @[l1sm.scala 87:79]
  wire  wire_entry_l1_biu_pe_req_grnt = io_pfu_biu_pe_req_sel_l1 & io_entry_biu_pe_req_grnt; // @[l1sm.scala 268:61]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 248:89]
  wire [26:0] _io_entry_l1_vpn_T_2 = {7'h0,entry_l1_pf_va[31:12]}; // @[l1sm.scala 94:92]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_clk_out; // @[l1sm.scala 59:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 101:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 102:32]
  reg  entry_l1_page_share; // @[l1sm.scala 103:34]
  wire [27:0] _entry_l1_pf_ppn_T_2 = {entry_l1_pf_ppn[27:20],20'h0}; // @[l1sm.scala 106:97]
  wire [27:0] _entry_l1_pf_ppn_T_5 = {entry_l1_pf_ppn[27:20],io_ld_da_ppn_ff[19:0]}; // @[l1sm.scala 111:97]
  wire [27:0] _entry_l1_pf_ppn_T_8 = {entry_l1_pf_ppn[27:20],io_pfu_get_ppn[19:0]}; // @[l1sm.scala 117:97]
  wire [27:0] _io_entry_l1_pf_addr_T_2 = {8'h0,entry_l1_pf_ppn[19:0]}; // @[l1sm.scala 124:89]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 136:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 137:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 139:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,io_entry_l1_pf_va[11:0]}; // @[Cat.scala 31:58]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 252:81]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 258:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 184:42]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 186:87 187:17 189:17]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 184:115 185:17]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 193:48 194:17 196:17]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 202:69 203:17 205:17]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 200:64 201:17]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 209:42 210:17 212:17]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 170:11 171:18]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 171:18]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 171:18]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 223:53]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va[31:0]); // @[l1sm.scala 303:43]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[31]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 304:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[0]; // @[l1sm.scala 265:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[0]; // @[l1sm.scala 276:56]
  wire [31:0] _io_entry_l1_pf_va_sub_inst_new_va_T_4 = io_entry_l1_pf_va[31:0] - io_entry_inst_new_va[31:0]; // @[l1sm.scala 295:155]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 59:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 59:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 232:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 144:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 278:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 129:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 130:28]
  assign io_entry_l1_pf_addr = {_io_entry_l1_pf_addr_T_2,io_entry_l1_pf_va[11:0]}; // @[l1sm.scala 124:123]
  assign io_entry_l1_pf_va_sub_inst_new_va = {8'h0,_io_entry_l1_pf_va_sub_inst_new_va_T_4}; // @[l1sm.scala 295:115]
  assign io_entry_l1_vpn = {{1'd0}, _io_entry_l1_vpn_T_2}; // @[l1sm.scala 94:21]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 233:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 237:52]
  assign io_entry_l1_pf_va = entry_l1_pf_va; // @[l1sm.scala 90:29]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[l1sm.scala 59:31 61:30]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 59:31 63:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 59:31 65:33]
  assign gated_clk_cell_local_en = wire_entry_l1_pf_addr_init_vld | wire_entry_l1_pf_va_add_gateclk_en; // @[l1sm.scala 55:64]
  assign gated_clk_cell_external_en = 1'h0; // @[l1sm.scala 59:31 62:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 59:31 66:42]
  assign gated_clk_cell_1_clk_in = io_forever_cpuclk; // @[l1sm.scala 59:31 61:30]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 59:31 63:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 59:31 65:33]
  assign gated_clk_cell_1_local_en = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en |
    wire_entry_l1_pf_ppn_up_vld; // @[l1sm.scala 57:90]
  assign gated_clk_cell_1_external_en = 1'h0; // @[l1sm.scala 59:31 62:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 59:31 66:42]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 82:31]
      entry_l1_pf_va <= _entry_l1_pf_va_T_2; // @[l1sm.scala 83:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 84:48]
      entry_l1_pf_va <= _entry_l1_pf_va_T_5; // @[l1sm.scala 85:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 86:45]
      entry_l1_pf_va <= _entry_l1_pf_va_T_8; // @[l1sm.scala 87:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_2; // @[l1sm.scala 106:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_5; // @[l1sm.scala 111:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_8; // @[l1sm.scala 117:38]
    end
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 107:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 112:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 118:38]
    end
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 108:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 113:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 119:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 167:75]
      state <= 3'h0; // @[l1sm.scala 168:11]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 171:18]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 171:18]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 181:15]
    end else if (3'h1 == state) begin // @[l1sm.scala 171:18]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 137:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 138:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 226:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 228:42]
    end else if (_T_16) begin // @[l1sm.scala 229:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 230:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 223:53]
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
module ct_lsu_pfu_pfb_l2sm_tmp(
  input         io_cp0_lsu_icg_en,
  input         io_cp0_lsu_pfu_mmu_dis,
  input         io_cp0_yy_clk_en,
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
  input         io_pad_yy_icg_scan_en,
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
  wire  gated_clk_cell_clk_in; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_global_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_module_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_local_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_external_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_clk_out; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_clk_in; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_global_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_module_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_local_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_external_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[l1sm.scala 59:50]
  wire  gated_clk_cell_1_clk_out; // @[l1sm.scala 59:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 163:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 163:72]
  reg [2:0] state; // @[l1sm.scala 164:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge & io_pfu_dcache_pref_en; // @[l1sm.scala 242:127]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 249:66]
  wire  wire_entry_l1_pf_va_add_gateclk_en = state == 3'h1 | io_entry_biu_pe_req_grnt; // @[l1sm.scala 249:96]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 57:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 289:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_clk_out; // @[l1sm.scala 59:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 81:29]
  wire [39:0] _entry_l1_pf_va_T_2 = {entry_l1_pf_va[39:32],32'h0}; // @[l1sm.scala 83:79]
  wire [39:0] _entry_l1_pf_va_T_5 = {entry_l1_pf_va[39:32],io_entry_inst_new_va[31:0]}; // @[l1sm.scala 85:79]
  wire [31:0] _wire_entry_l1_pf_va_add_strideh_T_4 = entry_l1_pf_va[31:0] + io_entry_strideh[31:0]; // @[l1sm.scala 254:152]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = {8'h0,_wire_entry_l1_pf_va_add_strideh_T_4}; // @[l1sm.scala 254:110]
  wire [39:0] _entry_l1_pf_va_T_8 = {entry_l1_pf_va[39:32],wire_entry_l1_pf_va_add_strideh[31:0]}; // @[l1sm.scala 87:79]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va[31:0]); // @[l1sm.scala 303:43]
  wire  wire_entry_l1_biu_pe_req_grnt = (~io_pfu_biu_pe_req_sel_l1 | wire_entry_l1_pf_va_eq_inst_new_va) &
    io_entry_biu_pe_req_grnt; // @[l1sm.scala 270:102]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 248:89]
  wire [26:0] _io_entry_l1_vpn_T_2 = {7'h0,entry_l1_pf_va[31:12]}; // @[l1sm.scala 94:92]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_clk_out; // @[l1sm.scala 59:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 101:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 102:32]
  reg  entry_l1_page_share; // @[l1sm.scala 103:34]
  wire [27:0] _entry_l1_pf_ppn_T_2 = {entry_l1_pf_ppn[27:20],20'h0}; // @[l1sm.scala 106:97]
  wire [27:0] _entry_l1_pf_ppn_T_5 = {entry_l1_pf_ppn[27:20],io_ld_da_ppn_ff[19:0]}; // @[l1sm.scala 111:97]
  wire [27:0] _entry_l1_pf_ppn_T_8 = {entry_l1_pf_ppn[27:20],io_pfu_get_ppn[19:0]}; // @[l1sm.scala 117:97]
  wire [27:0] _io_entry_l1_pf_addr_T_2 = {8'h0,entry_l1_pf_ppn[19:0]}; // @[l1sm.scala 126:89]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 136:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 137:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 139:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,entry_l1_pf_va[11:0]}; // @[Cat.scala 31:58]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 255:83]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 258:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 184:42]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 186:87 187:17 189:17]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 184:115 185:17]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 193:48 194:17 196:17]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 202:69 203:17 205:17]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 200:64 201:17]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 209:42 210:17 212:17]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 170:11 171:18]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 171:18]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 171:18]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 223:53]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[31]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 304:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[1]; // @[l1sm.scala 265:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[1]; // @[l1sm.scala 276:56]
  wire [31:0] _io_entry_l1_pf_va_sub_inst_new_va_T_4 = entry_l1_pf_va[31:0] - io_entry_l1_pf_va_t[31:0]; // @[l1sm.scala 297:157]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 59:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 59:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 232:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 144:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 278:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 129:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 130:28]
  assign io_entry_l1_pf_addr = {_io_entry_l1_pf_addr_T_2,entry_l1_pf_va[11:0]}; // @[l1sm.scala 126:123]
  assign io_entry_l1_pf_va_sub_inst_new_va = {8'h0,_io_entry_l1_pf_va_sub_inst_new_va_T_4}; // @[l1sm.scala 297:115]
  assign io_entry_l1_vpn = {{1'd0}, _io_entry_l1_vpn_T_2}; // @[l1sm.scala 94:21]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 233:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 237:52]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[l1sm.scala 59:31 61:30]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 59:31 63:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 59:31 65:33]
  assign gated_clk_cell_local_en = wire_entry_l1_pf_addr_init_vld | wire_entry_l1_pf_va_add_gateclk_en; // @[l1sm.scala 55:64]
  assign gated_clk_cell_external_en = 1'h0; // @[l1sm.scala 59:31 62:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 59:31 66:42]
  assign gated_clk_cell_1_clk_in = io_forever_cpuclk; // @[l1sm.scala 59:31 61:30]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[l1sm.scala 59:31 63:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[l1sm.scala 59:31 65:33]
  assign gated_clk_cell_1_local_en = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en |
    wire_entry_l1_pf_ppn_up_vld; // @[l1sm.scala 57:90]
  assign gated_clk_cell_1_external_en = 1'h0; // @[l1sm.scala 59:31 62:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[l1sm.scala 59:31 66:42]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 82:31]
      entry_l1_pf_va <= _entry_l1_pf_va_T_2; // @[l1sm.scala 83:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 84:48]
      entry_l1_pf_va <= _entry_l1_pf_va_T_5; // @[l1sm.scala 85:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 86:45]
      entry_l1_pf_va <= _entry_l1_pf_va_T_8; // @[l1sm.scala 87:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_2; // @[l1sm.scala 106:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_5; // @[l1sm.scala 111:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_8; // @[l1sm.scala 117:38]
    end
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 107:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 112:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 118:38]
    end
    if (_T_23) begin // @[l1sm.scala 105:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 108:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 109:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 113:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 115:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 119:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 167:75]
      state <= 3'h0; // @[l1sm.scala 168:11]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 171:18]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 171:18]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 181:15]
    end else if (3'h1 == state) begin // @[l1sm.scala 171:18]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 137:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 138:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 226:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 228:42]
    end else if (_T_16) begin // @[l1sm.scala 229:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 230:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 223:53]
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
module ct_lsu_pfu_gpfb_tmp(
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
  wire  gated_clk_cell_clk_in; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_global_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_module_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_local_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_external_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_pad_yy_icg_scan_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_clk_out; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_clk_in; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_global_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_module_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_local_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_external_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_pad_yy_icg_scan_en; // @[gpfb.scala 29:50]
  wire  gated_clk_cell_1_clk_out; // @[gpfb.scala 29:50]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en; // @[gpfb.scala 92:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld; // @[gpfb.scala 92:27]
  wire [10:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en; // @[gpfb.scala 92:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[gpfb.scala 92:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req; // @[gpfb.scala 92:27]
  wire [39:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[gpfb.scala 92:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[gpfb.scala 92:27]
  wire [1:0] ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld; // @[gpfb.scala 92:27]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt; // @[gpfb.scala 129:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld; // @[gpfb.scala 129:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req; // @[gpfb.scala 129:32]
  wire [1:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg; // @[gpfb.scala 129:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff; // @[gpfb.scala 129:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share; // @[gpfb.scala 129:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_cmp_va_vld; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share; // @[gpfb.scala 129:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr; // @[gpfb.scala 129:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 129:32]
  wire [27:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 129:32]
  wire [39:0] ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va; // @[gpfb.scala 129:32]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt; // @[gpfb.scala 129:64]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld; // @[gpfb.scala 129:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req; // @[gpfb.scala 129:64]
  wire [1:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg; // @[gpfb.scala 129:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff; // @[gpfb.scala 129:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share; // @[gpfb.scala 129:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_cmp_va_vld; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share; // @[gpfb.scala 129:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr; // @[gpfb.scala 129:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 129:64]
  wire [27:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req; // @[gpfb.scala 129:64]
  wire  ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 129:64]
  wire [39:0] ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t; // @[gpfb.scala 129:64]
  wire  _T_2 = ~io_cpurst_b; // @[gpfb.scala 52:68]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_clk_out; // @[gpfb.scala 29:{31,31}]
  reg [6:0] pfu_gpfb_strideh_6to0; // @[gpfb.scala 53:40]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_clk_out; // @[gpfb.scala 29:{31,31}]
  reg  pfu_gpfb_inst_new_va_too_far_l1_pf_va; // @[gpfb.scala 63:56]
  reg  pfu_gpfb_l1_pf_va_too_far_l2_pf_va; // @[gpfb.scala 64:53]
  wire  wire_pfu_gpfb_l1sm_reinit_req = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req; // @[gpfb.scala 20:18 169:37]
  wire  wire_pfu_gpfb_l2sm_reinit_req = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req; // @[gpfb.scala 20:18 185:37]
  wire  wire_pfu_gpfb_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 238:69]
  wire  wire_pfu_gpfb_l1_cmp_va_vld = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_cmp_va_vld; // @[gpfb.scala 20:18 173:35]
  wire  wire_pfu_gpfb_l1sm_va_can_cmp = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 20:18 170:37]
  wire [39:0] wire_pfu_gpfb_l1_pf_va_sub_inst_new_va = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 20:18 178:46]
  wire [39:0] _wire_pfu_gpfb_l1sm_diff_sub_32strideh_T_2 = {8'h0,wire_pfu_gpfb_l1_pf_va_sub_inst_new_va[31:0]}; // @[gpfb.scala 226:116]
  wire [20:0] _wire_pfu_gpfb_strideh_T_1 = io_pfu_gsdb_stride_neg ? 21'h1fffff : 21'h0; // @[Bitwise.scala 74:12]
  wire [32:0] _wire_pfu_gpfb_strideh_T_4 = {8'h0,_wire_pfu_gpfb_strideh_T_1,io_pfu_gsdb_stride[10:7]}; // @[gpfb.scala 82:129]
  wire [39:0] wire_pfu_gpfb_strideh = {8'h0,_wire_pfu_gpfb_strideh_T_1,io_pfu_gsdb_stride[10:7],pfu_gpfb_strideh_6to0}; // @[gpfb.scala 82:159]
  wire [39:0] wire_pfb_gpfb_32strideh = {8'h0,wire_pfu_gpfb_strideh[26:0],5'h0}; // @[gpfb.scala 222:132]
  wire [39:0] _GEN_5 = {{8'd0}, wire_pfb_gpfb_32strideh[31:0]}; // @[gpfb.scala 226:172]
  wire [39:0] wire_pfu_gpfb_l1sm_diff_sub_32strideh = _wire_pfu_gpfb_l1sm_diff_sub_32strideh_T_2 - _GEN_5; // @[gpfb.scala 226:172]
  wire  wire_pfu_gpfb_inst_new_va_too_far_l1_pf_va_set = io_pfu_gsdb_stride_neg == wire_pfu_gpfb_l1sm_diff_sub_32strideh
    [31]; // @[gpfb.scala 228:77]
  wire  wire_pfu_gpfb_l2_cmp_va_vld = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_cmp_va_vld; // @[gpfb.scala 20:18 189:35]
  wire  wire_pfu_gpfb_l2sm_va_can_cmp = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_va_can_cmp; // @[gpfb.scala 20:18 186:37]
  wire [39:0] wire_pfu_gpfb_l2_pf_va_sub_l1_pf_va = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_sub_inst_new_va; // @[gpfb.scala 20:18 194:43]
  wire [39:0] _wire_pfu_gpfb_l2sm_diff_sub_128strideh_T_2 = {8'h0,wire_pfu_gpfb_l2_pf_va_sub_l1_pf_va[31:0]}; // @[gpfb.scala 231:118]
  wire [39:0] wire_pfb_gpfb_128strideh = {8'h0,wire_pfu_gpfb_strideh[24:0],7'h0}; // @[gpfb.scala 223:133]
  wire [39:0] _GEN_6 = {{8'd0}, wire_pfb_gpfb_128strideh[31:0]}; // @[gpfb.scala 231:171]
  wire [39:0] wire_pfu_gpfb_l2sm_diff_sub_128strideh = _wire_pfu_gpfb_l2sm_diff_sub_128strideh_T_2 - _GEN_6; // @[gpfb.scala 231:171]
  wire  wire_pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set = io_pfu_gsdb_stride_neg == wire_pfu_gpfb_l2sm_diff_sub_128strideh[
    31]; // @[gpfb.scala 233:73]
  wire  wire_pfu_gpfb_dcache_hit_pop_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req; // @[gpfb.scala 20:18 104:39]
  wire  _wire_pfu_gpfb_pop_vld_T_1 = wire_pfu_gpfb_dcache_hit_pop_req | pfu_gpfb_inst_new_va_too_far_l1_pf_va; // @[gpfb.scala 79:7]
  wire  _wire_pfu_gpfb_pop_vld_T_3 = _wire_pfu_gpfb_pop_vld_T_1 | pfu_gpfb_l1_pf_va_too_far_l2_pf_va; // @[gpfb.scala 80:7]
  wire  _wire_pfu_gpfb_pop_vld_T_4 = _wire_pfu_gpfb_pop_vld_T_3 | io_pfu_gsdb_gpfb_pop_req; // @[gpfb.scala 81:7]
  gated_clk_cell gated_clk_cell ( // @[gpfb.scala 29:50]
    .clk_in(gated_clk_cell_clk_in),
    .global_en(gated_clk_cell_global_en),
    .module_en(gated_clk_cell_module_en),
    .local_en(gated_clk_cell_local_en),
    .external_en(gated_clk_cell_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[gpfb.scala 29:50]
    .clk_in(gated_clk_cell_1_clk_in),
    .global_en(gated_clk_cell_1_global_en),
    .module_en(gated_clk_cell_1_module_en),
    .local_en(gated_clk_cell_1_local_en),
    .external_en(gated_clk_cell_1_external_en),
    .pad_yy_icg_scan_en(gated_clk_cell_1_pad_yy_icg_scan_en),
    .clk_out(gated_clk_cell_1_clk_out)
  );
  ct_lsu_pfu_pfb_tsm_tmp ct_lsu_pfu_pfb_tsm_tmp ( // @[gpfb.scala 92:27]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en),
    .io_cp0_yy_priv_mode(ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode),
    .io_cpurst_b(ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b),
    .io_entry_act_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_clk(ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld),
    .io_entry_create_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld),
    .io_entry_from_lfb_dcache_hit(ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit),
    .io_entry_from_lfb_dcache_miss(ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l2_biu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set),
    .io_entry_l2_mmu_pe_req_set(ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set),
    .io_entry_mmu_pe_req_grnt(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld),
    .io_entry_stride(ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en),
    .io_pipe_va(ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src),
    .io_entry_dcache_hit_pop_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_dcache_hit_pop_req),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_priv_mode(ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge),
    .io_entry_vld(ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld)
  );
  ct_lsu_pfu_pfb_l1sm_tmp ct_lsu_pfu_pfb_l1sm_tmp ( // @[gpfb.scala 129:32]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va(ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va)
  );
  ct_lsu_pfu_pfb_l2sm_tmp ct_lsu_pfu_pfb_l2sm_tmp ( // @[gpfb.scala 129:64]
    .io_cp0_lsu_icg_en(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en),
    .io_cp0_lsu_pfu_mmu_dis(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis),
    .io_cp0_yy_clk_en(ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en),
    .io_cpurst_b(ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b),
    .io_entry_biu_pe_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req),
    .io_entry_biu_pe_req_grnt(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt),
    .io_entry_biu_pe_req_src(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src),
    .io_entry_clk(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk),
    .io_entry_create_dp_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld),
    .io_entry_inst_new_va(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va),
    .io_entry_mmu_pe_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req),
    .io_entry_mmu_pe_req_src(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src),
    .io_entry_pf_inst_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld),
    .io_entry_pop_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld),
    .io_entry_reinit_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld),
    .io_entry_stride_neg(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg),
    .io_entry_strideh(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh),
    .io_entry_tsm_is_judge(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge),
    .io_forever_cpuclk(ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk),
    .io_ld_da_page_sec_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff),
    .io_ld_da_page_share_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff),
    .io_ld_da_ppn_ff(ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff),
    .io_pad_yy_icg_scan_en(ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en),
    .io_pfu_biu_pe_req_sel_l1(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1),
    .io_pfu_dcache_pref_en(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en),
    .io_pfu_get_page_sec(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec),
    .io_pfu_get_page_share(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share),
    .io_pfu_get_ppn(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn),
    .io_pfu_get_ppn_err(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err),
    .io_pfu_get_ppn_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld),
    .io_entry_l1_biu_pe_req_set(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set),
    .io_entry_l1_cmp_va_vld(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_cmp_va_vld),
    .io_entry_l1_mmu_pe_req_set(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set),
    .io_entry_l1_page_sec(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec),
    .io_entry_l1_page_share(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share),
    .io_entry_l1_pf_addr(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr),
    .io_entry_l1_pf_va_sub_inst_new_va(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_sub_inst_new_va),
    .io_entry_l1_vpn(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn),
    .io_entry_l1sm_reinit_req(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_reinit_req),
    .io_entry_l1sm_va_can_cmp(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1sm_va_can_cmp),
    .io_entry_l1_pf_va_t(ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t)
  );
  assign io_pfu_gpfb_biu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req; // @[gpfb.scala 98:39]
  assign io_pfu_gpfb_biu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_src; // @[gpfb.scala 100:39]
  assign io_pfu_gpfb_l1_page_sec = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_sec; // @[gpfb.scala 175:31]
  assign io_pfu_gpfb_l1_page_share = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_page_share; // @[gpfb.scala 176:33]
  assign io_pfu_gpfb_l1_pf_addr = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_addr; // @[gpfb.scala 177:30]
  assign io_pfu_gpfb_l1_vpn = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_vpn; // @[gpfb.scala 179:26]
  assign io_pfu_gpfb_l2_page_sec = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_sec; // @[gpfb.scala 191:31]
  assign io_pfu_gpfb_l2_page_share = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_page_share; // @[gpfb.scala 192:33]
  assign io_pfu_gpfb_l2_pf_addr = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_addr; // @[gpfb.scala 193:30]
  assign io_pfu_gpfb_l2_vpn = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_vpn; // @[gpfb.scala 195:26]
  assign io_pfu_gpfb_mmu_pe_req = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req; // @[gpfb.scala 112:39]
  assign io_pfu_gpfb_mmu_pe_req_src = ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_src; // @[gpfb.scala 114:39]
  assign io_pfu_gpfb_priv_mode = ct_lsu_pfu_pfb_tsm_tmp_io_entry_priv_mode; // @[gpfb.scala 117:39]
  assign io_pfu_gpfb_vld = ct_lsu_pfu_pfb_tsm_tmp_io_entry_vld; // @[gpfb.scala 122:39]
  assign gated_clk_cell_clk_in = io_forever_cpuclk; // @[gpfb.scala 29:31 31:30]
  assign gated_clk_cell_global_en = io_cp0_yy_clk_en; // @[gpfb.scala 29:31 33:33]
  assign gated_clk_cell_module_en = io_cp0_lsu_icg_en; // @[gpfb.scala 29:31 35:33]
  assign gated_clk_cell_local_en = io_pfu_gpfb_vld | io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 25:44]
  assign gated_clk_cell_external_en = 1'h0; // @[gpfb.scala 29:31 32:35]
  assign gated_clk_cell_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gpfb.scala 29:31 36:42]
  assign gated_clk_cell_1_clk_in = io_forever_cpuclk; // @[gpfb.scala 29:31 31:30]
  assign gated_clk_cell_1_global_en = io_cp0_yy_clk_en; // @[gpfb.scala 29:31 33:33]
  assign gated_clk_cell_1_module_en = io_cp0_lsu_icg_en; // @[gpfb.scala 29:31 35:33]
  assign gated_clk_cell_1_local_en = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 20:18 245:35]
  assign gated_clk_cell_1_external_en = 1'h0; // @[gpfb.scala 29:31 32:35]
  assign gated_clk_cell_1_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gpfb.scala 29:31 36:42]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[gpfb.scala 93:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[gpfb.scala 94:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cp0_yy_priv_mode = io_cp0_yy_priv_mode; // @[gpfb.scala 95:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 96:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_act_vld = io_pfu_gpfb_vld & io_ld_da_pfu_act_vld; // @[gpfb.scala 87:45]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 99:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[gpfb.scala 29:{31,31}]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 20:18 244:35]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_create_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 20:18 243:35]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_hit = io_pfu_gpfb_from_lfb_dcache_hit; // @[gpfb.scala 105:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_from_lfb_dcache_miss = io_pfu_gpfb_from_lfb_dcache_miss; // @[gpfb.scala 106:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_biu_pe_req_set = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 20:18 172:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l1_mmu_pe_req_set = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 20:18 174:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_biu_pe_req_set = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_biu_pe_req_set; // @[gpfb.scala 20:18 188:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_l2_mmu_pe_req_set = ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_mmu_pe_req_set; // @[gpfb.scala 20:18 190:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_mmu_pe_req_grnt = io_pfu_gpfb_mmu_pe_req_grnt; // @[gpfb.scala 113:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 86:49]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 78:50]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 238:69]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride = io_pfu_gsdb_stride; // @[gpfb.scala 47:45]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 20:18 48:31]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 123:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gpfb.scala 124:39]
  assign ct_lsu_pfu_pfb_tsm_tmp_io_pipe_va = io_ld_da_pfu_va; // @[gpfb.scala 125:39]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[gpfb.scala 131:27]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 132:32]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[gpfb.scala 133:26]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 134:21]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req = io_pfu_gpfb_biu_pe_req; // @[gpfb.scala 135:29]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 136:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_biu_pe_req_src = io_pfu_gpfb_biu_pe_req_src; // @[gpfb.scala 137:33]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[gpfb.scala 29:{31,31}]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 20:18 244:35]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[gpfb.scala 20:18 107:39]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req = io_pfu_gpfb_mmu_pe_req; // @[gpfb.scala 140:29]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_mmu_pe_req_src = io_pfu_gpfb_mmu_pe_req_src; // @[gpfb.scala 142:33]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 86:49]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 78:50]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 238:69]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 20:18 48:31]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_strideh = {_wire_pfu_gpfb_strideh_T_4,pfu_gpfb_strideh_6to0}; // @[gpfb.scala 82:159]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[gpfb.scala 20:18 121:39]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 149:27]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_sec_ff = io_ld_da_page_sec_ff; // @[gpfb.scala 150:30]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_page_share_ff = io_ld_da_page_share_ff; // @[gpfb.scala 151:32]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_ld_da_ppn_ff = io_ld_da_ppn_ff; // @[gpfb.scala 152:25]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gpfb.scala 153:31]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 154:34]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_dcache_pref_en = io_pfu_dcache_pref_en; // @[gpfb.scala 165:33]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[gpfb.scala 155:29]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_page_share = io_pfu_get_page_share; // @[gpfb.scala 156:31]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn = io_pfu_get_ppn; // @[gpfb.scala 157:24]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[gpfb.scala 158:28]
  assign ct_lsu_pfu_pfb_l1sm_tmp_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[gpfb.scala 159:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_icg_en = io_cp0_lsu_icg_en; // @[gpfb.scala 131:27]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_lsu_pfu_mmu_dis = io_cp0_lsu_pfu_mmu_dis; // @[gpfb.scala 132:32]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cp0_yy_clk_en = io_cp0_yy_clk_en; // @[gpfb.scala 133:26]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_cpurst_b = io_cpurst_b; // @[gpfb.scala 134:21]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req = io_pfu_gpfb_biu_pe_req; // @[gpfb.scala 135:29]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_grnt = io_pfu_gpfb_biu_pe_req_grnt; // @[gpfb.scala 136:34]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_biu_pe_req_src = io_pfu_gpfb_biu_pe_req_src; // @[gpfb.scala 137:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_clk = gated_clk_cell_clk_out; // @[gpfb.scala 29:{31,31}]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_create_dp_vld = io_pfu_gsdb_gpfb_create_vld; // @[gpfb.scala 20:18 244:35]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_inst_new_va = ct_lsu_pfu_pfb_tsm_tmp_io_entry_inst_new_va; // @[gpfb.scala 20:18 107:39]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req = io_pfu_gpfb_mmu_pe_req; // @[gpfb.scala 140:29]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_mmu_pe_req_src = io_pfu_gpfb_mmu_pe_req_src; // @[gpfb.scala 142:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pf_inst_vld = io_pfu_gpfb_vld & io_ld_da_pfu_pf_inst_vld; // @[gpfb.scala 86:49]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_pop_vld = io_pfu_pop_all_vld | io_pfu_gpfb_vld & _wire_pfu_gpfb_pop_vld_T_4; // @[gpfb.scala 78:50]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_reinit_vld = wire_pfu_gpfb_l1sm_reinit_req | wire_pfu_gpfb_l2sm_reinit_req; // @[gpfb.scala 238:69]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_stride_neg = io_pfu_gsdb_stride_neg; // @[gpfb.scala 20:18 48:31]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_strideh = {_wire_pfu_gpfb_strideh_T_4,pfu_gpfb_strideh_6to0}; // @[gpfb.scala 82:159]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_tsm_is_judge = ct_lsu_pfu_pfb_tsm_tmp_io_entry_tsm_is_judge; // @[gpfb.scala 20:18 121:39]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_forever_cpuclk = io_forever_cpuclk; // @[gpfb.scala 149:27]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_sec_ff = io_ld_da_page_sec_ff; // @[gpfb.scala 150:30]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_page_share_ff = io_ld_da_page_share_ff; // @[gpfb.scala 151:32]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_ld_da_ppn_ff = io_ld_da_ppn_ff; // @[gpfb.scala 152:25]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pad_yy_icg_scan_en = io_pad_yy_icg_scan_en; // @[gpfb.scala 153:31]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_biu_pe_req_sel_l1 = io_pfu_biu_pe_req_sel_l1; // @[gpfb.scala 154:34]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_dcache_pref_en = io_pfu_l2_pref_en; // @[gpfb.scala 181:33]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_sec = io_pfu_get_page_sec; // @[gpfb.scala 155:29]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_page_share = io_pfu_get_page_share; // @[gpfb.scala 156:31]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn = io_pfu_get_ppn; // @[gpfb.scala 157:24]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_err = io_pfu_get_ppn_err; // @[gpfb.scala 158:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_pfu_get_ppn_vld = io_pfu_get_ppn_vld; // @[gpfb.scala 159:28]
  assign ct_lsu_pfu_pfb_l2sm_tmp_io_entry_l1_pf_va_t = ct_lsu_pfu_pfb_l1sm_tmp_io_entry_l1_pf_va; // @[gpfb.scala 20:18 167:30]
  always @(posedge gated_clk_inst_1_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 55:38]
      pfu_gpfb_strideh_6to0 <= 7'h0; // @[gpfb.scala 56:29]
    end else if (io_pfu_gsdb_gpfb_create_vld) begin // @[gpfb.scala 53:40]
      pfu_gpfb_strideh_6to0 <= io_pfu_gsdb_strideh_6to0;
    end
  end
  always @(posedge gated_clk_inst_0_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 67:67]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= 1'h0; // @[gpfb.scala 68:46]
    end else if (io_pfu_gsdb_gpfb_create_vld | wire_pfu_gpfb_reinit_vld) begin // @[gpfb.scala 71:73]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= 1'h0; // @[gpfb.scala 72:47]
    end else if (wire_pfu_gpfb_l1_cmp_va_vld & wire_pfu_gpfb_l1sm_va_can_cmp) begin // @[gpfb.scala 63:56]
      pfu_gpfb_inst_new_va_too_far_l1_pf_va <= wire_pfu_gpfb_inst_new_va_too_far_l1_pf_va_set;
    end
  end
  always @(posedge gated_clk_inst_0_clk_out or posedge _T_2) begin
    if (_T_2) begin // @[gpfb.scala 67:67]
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va <= 1'h0; // @[gpfb.scala 69:42]
    end else if (io_pfu_gsdb_gpfb_create_vld | wire_pfu_gpfb_reinit_vld) begin // @[gpfb.scala 74:74]
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va <= 1'h0; // @[gpfb.scala 75:44]
    end else if (wire_pfu_gpfb_l2_cmp_va_vld & wire_pfu_gpfb_l2sm_va_can_cmp) begin // @[gpfb.scala 64:53]
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
