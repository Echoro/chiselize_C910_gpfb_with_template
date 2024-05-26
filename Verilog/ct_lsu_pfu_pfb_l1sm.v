module gated_clk_cell(
  input   io_clk_in,
  output  io_clk_out
);
  assign io_clk_out = io_clk_in; // @[l1sm.scala 412:14]
endmodule
module ct_lsu_pfu_pfb_l1sm(
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
