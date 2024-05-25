module gated_clk_cell(
  input   io_clk_in,
  output  io_clk_out
);
  assign io_clk_out = io_clk_in; // @[l1sm.scala 356:14]
endmodule
module l1sm(
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
  input  [39:0] io_entry_l1_dist_strideh,
  input         io_entry_mmu_pe_req,
  input         io_entry_mmu_pe_req_grnt,
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
  input         io_pfu_mmu_pe_req_sel_l1,
  output        io_entry_l1_biu_pe_req_set,
  output        io_entry_l1_cmp_va_vld,
  output        io_entry_l1_mmu_pe_req_set,
  output        io_entry_l1_page_sec,
  output        io_entry_l1_page_share,
  output [39:0] io_entry_l1_pf_addr,
  output [39:0] io_entry_l1_pf_va,
  output [39:0] io_entry_l1_pf_va_sub_inst_new_va,
  output [27:0] io_entry_l1_vpn,
  output        io_entry_l1sm_reinit_req,
  output        io_entry_l1sm_va_can_cmp
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
  wire  gated_clk_cell_io_clk_in; // @[l1sm.scala 124:50]
  wire  gated_clk_cell_io_clk_out; // @[l1sm.scala 124:50]
  wire  gated_clk_cell_1_io_clk_in; // @[l1sm.scala 124:50]
  wire  gated_clk_cell_1_io_clk_out; // @[l1sm.scala 124:50]
  wire  _T_23 = ~io_cpurst_b; // @[l1sm.scala 221:51]
  wire  _T_24 = ~io_cpurst_b; // @[l1sm.scala 221:72]
  reg [2:0] state; // @[l1sm.scala 222:24]
  wire  wire_entry_l1_pf_addr_init_vld = state == 3'h0 & io_entry_tsm_is_judge; // @[l1sm.scala 297:93]
  wire  _wire_entry_l1_pf_va_add_gateclk_en_T_1 = state == 3'h1; // @[l1sm.scala 301:66]
  wire  _wire_entry_l1_pf_ppn_clk_en_T = wire_entry_l1_pf_addr_init_vld & io_pfu_dcache_pref_en; // @[l1sm.scala 122:65]
  wire  wire_entry_l1_pf_ppn_up_vld = state == 3'h6 & io_pfu_get_ppn_vld; // @[l1sm.scala 327:88]
  wire  gated_clk_inst_0_clk_out = gated_clk_cell_io_clk_out; // @[l1sm.scala 124:{31,31}]
  reg [39:0] entry_l1_pf_va; // @[l1sm.scala 146:29]
  wire [39:0] _entry_l1_pf_va_T_2 = {entry_l1_pf_va[39:32],32'h0}; // @[l1sm.scala 148:76]
  wire [39:0] _entry_l1_pf_va_T_5 = {entry_l1_pf_va[39:32],io_entry_inst_new_va[31:0]}; // @[l1sm.scala 150:76]
  wire [31:0] _wire_entry_l1_pf_va_add_strideh_T_4 = io_entry_l1_pf_va[31:0] + io_entry_strideh[31:0]; // @[l1sm.scala 302:148]
  wire [38:0] _wire_entry_l1_pf_va_add_strideh_T_5 = {7'h0,_wire_entry_l1_pf_va_add_strideh_T_4}; // @[l1sm.scala 302:112]
  wire [39:0] wire_entry_l1_pf_va_add_strideh = {{1'd0}, _wire_entry_l1_pf_va_add_strideh_T_5}; // @[l1sm.scala 114:18 302:35]
  wire [39:0] _entry_l1_pf_va_T_8 = {entry_l1_pf_va[39:32],wire_entry_l1_pf_va_add_strideh[31:0]}; // @[l1sm.scala 152:76]
  wire  wire_entry_l1_biu_pe_req_grnt = io_pfu_biu_pe_req_sel_l1 & io_entry_biu_pe_req_grnt; // @[l1sm.scala 315:61]
  wire  wire_entry_l1_pf_va_add_vld = _wire_entry_l1_pf_va_add_gateclk_en_T_1 | wire_entry_l1_biu_pe_req_grnt; // @[l1sm.scala 300:89]
  wire [26:0] _io_entry_l1_vpn_T_2 = {7'h0,entry_l1_pf_va[31:12]}; // @[l1sm.scala 156:85]
  wire  gated_clk_inst_1_clk_out = gated_clk_cell_1_io_clk_out; // @[l1sm.scala 124:{31,31}]
  reg [27:0] entry_l1_pf_ppn; // @[l1sm.scala 163:30]
  reg  entry_l1_page_sec; // @[l1sm.scala 164:32]
  reg  entry_l1_page_share; // @[l1sm.scala 165:34]
  wire [27:0] _entry_l1_pf_ppn_T_2 = {entry_l1_pf_ppn[27:20],20'h0}; // @[l1sm.scala 168:97]
  wire [27:0] _entry_l1_pf_ppn_T_5 = {entry_l1_pf_ppn[27:20],io_ld_da_ppn_ff[19:0]}; // @[l1sm.scala 173:97]
  wire [27:0] _entry_l1_pf_ppn_T_8 = {entry_l1_pf_ppn[27:20],io_pfu_get_ppn[19:0]}; // @[l1sm.scala 179:97]
  wire [38:0] _io_entry_l1_pf_addr_T_4 = {7'h0,entry_l1_pf_ppn[19:0],io_entry_l1_pf_va[11:0]}; // @[l1sm.scala 185:125]
  reg  entry_l1_cmp_va_vld; // @[l1sm.scala 194:38]
  wire  _T_16 = io_entry_create_dp_vld | io_entry_reinit_vld; // @[l1sm.scala 195:40]
  wire  _T_18 = wire_entry_l1_pf_va_add_vld | io_entry_pf_inst_vld & io_entry_l1sm_va_can_cmp; // @[l1sm.scala 197:44]
  wire [12:0] _wire_entry_l1_pf_va_sum_4k_T_1 = {1'h0,io_entry_l1_pf_va[11:0]}; // @[Cat.scala 31:58]
  wire [12:0] wire_entry_l1_pf_va_sum_4k = _wire_entry_l1_pf_va_sum_4k_T_1 + io_entry_strideh[12:0]; // @[l1sm.scala 303:75]
  wire  wire_entry_l1_pf_va_cross_4k = wire_entry_l1_pf_va_sum_4k[12]; // @[l1sm.scala 305:66]
  wire  _T_36 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k; // @[l1sm.scala 242:42]
  wire [2:0] _GEN_15 = _T_36 ? 3'h5 : 3'h4; // @[l1sm.scala 244:87 245:17 247:17]
  wire [2:0] _GEN_16 = wire_entry_l1_pf_va_add_vld & wire_entry_l1_pf_va_cross_4k & io_cp0_lsu_pfu_mmu_dis ? 3'h7 :
    _GEN_15; // @[l1sm.scala 242:115 243:17]
  wire [2:0] _GEN_17 = io_entry_l1_mmu_pe_req_set ? 3'h6 : 3'h5; // @[l1sm.scala 251:48 252:17 254:17]
  wire [2:0] _GEN_18 = io_pfu_get_ppn_vld & io_pfu_get_ppn_err ? 3'h7 : 3'h6; // @[l1sm.scala 260:69 261:17 263:17]
  wire [2:0] _GEN_19 = io_pfu_get_ppn_vld & ~io_pfu_get_ppn_err ? 3'h4 : _GEN_18; // @[l1sm.scala 258:64 259:17]
  wire [2:0] _GEN_20 = io_entry_reinit_vld ? 3'h0 : 3'h7; // @[l1sm.scala 267:42 268:17 270:17]
  wire [2:0] _GEN_21 = 3'h7 == state ? _GEN_20 : 3'h0; // @[l1sm.scala 228:11 229:18]
  wire [2:0] _GEN_22 = 3'h6 == state ? _GEN_19 : _GEN_21; // @[l1sm.scala 229:18]
  wire [2:0] _GEN_23 = 3'h5 == state ? _GEN_17 : _GEN_22; // @[l1sm.scala 229:18]
  reg  entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 281:53]
  wire  wire_entry_l1_pf_va_eq_inst_new_va = ~(|io_entry_l1_pf_va_sub_inst_new_va[31:0]); // @[l1sm.scala 334:41]
  wire  wire_entry_inst_new_va_surpass_l1_pf_va_set = (io_entry_stride_neg ^ io_entry_l1_pf_va_sub_inst_new_va[31]) & ~
    wire_entry_l1_pf_va_eq_inst_new_va; // @[l1sm.scala 335:127]
  wire  wire_entry_l1_biu_pe_req = io_entry_biu_pe_req & io_entry_biu_pe_req_src[0]; // @[l1sm.scala 312:56]
  wire  wire_entry_l1_mmu_pe_req = io_entry_mmu_pe_req & io_entry_mmu_pe_req_src[0]; // @[l1sm.scala 321:56]
  wire [31:0] _io_entry_l1_pf_va_sub_inst_new_va_T_4 = io_entry_l1_pf_va[31:0] - io_entry_inst_new_va[31:0]; // @[l1sm.scala 332:153]
  wire [38:0] _io_entry_l1_pf_va_sub_inst_new_va_T_5 = {7'h0,_io_entry_l1_pf_va_sub_inst_new_va_T_4}; // @[l1sm.scala 332:117]
  gated_clk_cell gated_clk_cell ( // @[l1sm.scala 124:50]
    .io_clk_in(gated_clk_cell_io_clk_in),
    .io_clk_out(gated_clk_cell_io_clk_out)
  );
  gated_clk_cell gated_clk_cell_1 ( // @[l1sm.scala 124:50]
    .io_clk_in(gated_clk_cell_1_io_clk_in),
    .io_clk_out(gated_clk_cell_1_io_clk_out)
  );
  assign io_entry_l1_biu_pe_req_set = state == 3'h4 & ~wire_entry_l1_biu_pe_req; // @[l1sm.scala 290:119]
  assign io_entry_l1_cmp_va_vld = entry_l1_cmp_va_vld; // @[l1sm.scala 202:28]
  assign io_entry_l1_mmu_pe_req_set = state == 3'h5 & ~wire_entry_l1_mmu_pe_req; // @[l1sm.scala 322:86]
  assign io_entry_l1_page_sec = entry_l1_page_sec; // @[l1sm.scala 187:26]
  assign io_entry_l1_page_share = entry_l1_page_share; // @[l1sm.scala 188:28]
  assign io_entry_l1_pf_addr = {{1'd0}, _io_entry_l1_pf_addr_T_4}; // @[l1sm.scala 185:26]
  assign io_entry_l1_pf_va = entry_l1_pf_va; // @[l1sm.scala 155:23]
  assign io_entry_l1_pf_va_sub_inst_new_va = {{1'd0}, _io_entry_l1_pf_va_sub_inst_new_va_T_5}; // @[l1sm.scala 332:38]
  assign io_entry_l1_vpn = {{1'd0}, _io_entry_l1_vpn_T_2}; // @[l1sm.scala 156:21]
  assign io_entry_l1sm_reinit_req = io_entry_l1sm_va_can_cmp & entry_inst_new_va_surpass_l1_pf_va; // @[l1sm.scala 291:59]
  assign io_entry_l1sm_va_can_cmp = state[2]; // @[l1sm.scala 295:52]
  assign gated_clk_cell_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 124:31 126:30]
  assign gated_clk_cell_1_io_clk_in = io_forever_cpuclk; // @[l1sm.scala 124:31 126:30]
  always @(posedge gated_clk_inst_0_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 147:30]
      entry_l1_pf_va <= _entry_l1_pf_va_T_2; // @[l1sm.scala 148:22]
    end else if (wire_entry_l1_pf_addr_init_vld) begin // @[l1sm.scala 149:47]
      entry_l1_pf_va <= _entry_l1_pf_va_T_5; // @[l1sm.scala 150:22]
    end else if (wire_entry_l1_pf_va_add_vld) begin // @[l1sm.scala 151:45]
      entry_l1_pf_va <= _entry_l1_pf_va_T_8; // @[l1sm.scala 152:22]
    end
  end
  always @(posedge gated_clk_inst_1_clk_out) begin
    if (_T_23) begin // @[l1sm.scala 167:30]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_2; // @[l1sm.scala 168:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 171:73]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_5; // @[l1sm.scala 173:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 177:44]
      entry_l1_pf_ppn <= _entry_l1_pf_ppn_T_8; // @[l1sm.scala 179:38]
    end
    if (_T_23) begin // @[l1sm.scala 167:30]
      entry_l1_page_sec <= 1'h0; // @[l1sm.scala 169:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 171:73]
      entry_l1_page_sec <= io_ld_da_page_sec_ff; // @[l1sm.scala 174:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 177:44]
      entry_l1_page_sec <= io_pfu_get_page_sec; // @[l1sm.scala 180:38]
    end
    if (_T_23) begin // @[l1sm.scala 167:30]
      entry_l1_page_share <= 1'h0; // @[l1sm.scala 170:38]
    end else if (_wire_entry_l1_pf_ppn_clk_en_T) begin // @[l1sm.scala 171:73]
      entry_l1_page_share <= io_ld_da_page_share_ff; // @[l1sm.scala 175:38]
    end else if (wire_entry_l1_pf_ppn_up_vld) begin // @[l1sm.scala 177:44]
      entry_l1_page_share <= io_pfu_get_page_share; // @[l1sm.scala 181:38]
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 225:75]
      state <= 3'h0; // @[l1sm.scala 226:11]
    end else if (io_entry_pop_vld | io_entry_reinit_vld | ~io_pfu_dcache_pref_en) begin // @[l1sm.scala 229:18]
      state <= 3'h0;
    end else if (3'h0 == state) begin // @[l1sm.scala 229:18]
      state <= {{2'd0}, _wire_entry_l1_pf_ppn_clk_en_T}; // @[l1sm.scala 239:15]
    end else if (3'h1 == state) begin // @[l1sm.scala 229:18]
      state <= 3'h4;
    end else if (3'h4 == state) begin
      state <= _GEN_16;
    end else begin
      state <= _GEN_23;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 195:70]
      entry_l1_cmp_va_vld <= 1'h0; // @[l1sm.scala 196:27]
    end else if (io_entry_create_dp_vld | io_entry_reinit_vld) begin
      entry_l1_cmp_va_vld <= 1'h0;
    end else begin
      entry_l1_cmp_va_vld <= _T_18;
    end
  end
  always @(posedge io_entry_clk or posedge _T_24) begin
    if (_T_24) begin // @[l1sm.scala 284:71]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h1; // @[l1sm.scala 286:42]
    end else if (_T_16) begin // @[l1sm.scala 287:68]
      entry_inst_new_va_surpass_l1_pf_va <= 1'h0; // @[l1sm.scala 288:42]
    end else if (io_entry_l1_cmp_va_vld & io_entry_l1sm_va_can_cmp) begin // @[l1sm.scala 281:53]
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
