package gpfb

import chisel3.{util, _}
import chisel3.util.Fill

class gpfbIO extends Bundle{
  val cp0_lsu_icg_en = Input(Bool())
  val cp0_lsu_pfu_mmu_dis = Input(Bool())
  val cp0_yy_clk_en = Input(Bool())
  val cp0_yy_priv_mode = Input(UInt(2.W))
  val cpurst_b = Input(Bool())
  val forever_cpuclk = Input(Clock())
  val ld_da_page_sec_ff = Input(Bool())
  val ld_da_page_share_ff = Input(Bool())
  val ld_da_pfu_act_vld = Input(Bool())
  val ld_da_pfu_pf_inst_vld = Input(Bool())
  val ld_da_pfu_va = Input(UInt(40.W))
  val ld_da_ppn_ff = Input(UInt(28.W))
  val lsu_pfu_l1_dist_sel = Input(UInt(4.W))
  val lsu_pfu_l2_dist_sel = Input(UInt(4.W))
  val pad_yy_icg_scan_en = Input(Bool())
  val pfu_biu_pe_req_sel_l1 = Input(Bool())
  val pfu_dcache_pref_en = Input(Bool())
  val pfu_get_page_sec = Input(Bool())
  val pfu_get_page_share = Input(Bool())
  val pfu_get_ppn = Input(UInt(28.W))
  val pfu_get_ppn_err = Input(Bool())
  val pfu_get_ppn_vld = Input(Bool())
  val pfu_gpfb_biu_pe_req_grnt = Input(Bool())
  val pfu_gpfb_from_lfb_dcache_hit = Input(Bool())
  val pfu_gpfb_from_lfb_dcache_miss = Input(Bool())
  val pfu_gpfb_mmu_pe_req_grnt = Input(Bool())
  val pfu_gsdb_gpfb_create_vld = Input(Bool())
  val pfu_gsdb_gpfb_pop_req = Input(Bool())
  val pfu_gsdb_stride = Input(UInt(11.W))
  val pfu_gsdb_stride_neg = Input(Bool())
  val pfu_gsdb_strideh_6to0 = Input(UInt(7.W))
  val pfu_l2_pref_en = Input(Bool())
  val pfu_mmu_pe_req_sel_l1 = Input(Bool())
  val pfu_pop_all_vld = Input(Bool())
  val pfu_gpfb_biu_pe_req = Output(Bool())
  val pfu_gpfb_biu_pe_req_src = Output(UInt(2.W))
  val pfu_gpfb_l1_page_sec = Output(Bool())
  val pfu_gpfb_l1_page_share = Output(Bool())
  val pfu_gpfb_l1_pf_addr = Output(UInt(40.W))
  val pfu_gpfb_l1_vpn = Output(UInt(28.W))
  val pfu_gpfb_l2_page_sec = Output(Bool())
  val pfu_gpfb_l2_page_share = Output(Bool())
  val pfu_gpfb_l2_pf_addr = Output(UInt(40.W))
  val pfu_gpfb_l2_vpn = Output(UInt(28.W))
  val pfu_gpfb_mmu_pe_req = Output(Bool())
  val pfu_gpfb_mmu_pe_req_src = Output(UInt(2.W))
  val pfu_gpfb_priv_mode = Output(UInt(2.W))
  val pfu_gpfb_vld = Output(Bool())


}
class gpfbwire extends Bundle{
  val pfb_gpfb_128strideh = UInt(40.W)
  val pfb_gpfb_32strideh = UInt(40.W)
  val pfu_gpfb_act_vld = Bool()
  val pfu_gpfb_clk = Clock()
  val pfu_gpfb_clk_en = Bool()
  val pfu_gpfb_create_clk = Clock()
  val pfu_gpfb_create_clk_en = Bool()
  val pfu_gpfb_create_dp_vld = Bool()
  val pfu_gpfb_create_gateclk_en = Bool()
  val pfu_gpfb_create_vld = Bool()
  val pfu_gpfb_dcache_hit_pop_req = Bool()
  val pfu_gpfb_inst_new_va = UInt(40.W)
  val pfu_gpfb_inst_new_va_too_far_l1_pf_va_set = Bool()
  val pfu_gpfb_l1_biu_pe_req_set = Bool()
  val pfu_gpfb_l1_cmp_va_vld = Bool()
  val pfu_gpfb_l1_dist_strideh = UInt(40.W)
  val pfu_gpfb_l1_mmu_pe_req_set = Bool()
  val pfu_gpfb_l1_pf_va = UInt(40.W)
  val pfu_gpfb_l1_pf_va_sub_inst_new_va = UInt(40.W)
  val pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set = Bool()
  val pfu_gpfb_l1sm_diff_sub_32strideh = UInt(40.W)
  val pfu_gpfb_l1sm_reinit_req = Bool()
  val pfu_gpfb_l1sm_va_can_cmp = Bool()
  val pfu_gpfb_l2_biu_pe_req_set = Bool()
  val pfu_gpfb_l2_cmp_va_vld = Bool()
  val pfu_gpfb_l2_dist_strideh = UInt(40.W)
  val pfu_gpfb_l2_mmu_pe_req_set = Bool()
  val pfu_gpfb_l2_pf_va_sub_l1_pf_va = UInt(40.W)
  val pfu_gpfb_l2sm_diff_sub_128strideh = UInt(40.W)
  val pfu_gpfb_l2sm_reinit_req = Bool()
  val pfu_gpfb_l2sm_va_can_cmp = Bool()
  val pfu_gpfb_pf_inst_vld = Bool()
  val pfu_gpfb_pop_vld = Bool()
  val pfu_gpfb_reinit_vld = Bool()
  val pfu_gpfb_stride = UInt(11.W)
  val pfu_gpfb_stride_neg = Bool()
  val pfu_gpfb_strideh = UInt(40.W)
  val pfu_gpfb_tsm_is_judge = Bool()
}
class gpfbreg extends Bundle{
  val pfu_gpfb_inst_new_va_too_far_l1_pf_va = UInt(1.W)
  val pfu_gpfb_l1_pf_va_too_far_l2_pf_va = UInt(1.W)
  val pfu_gpfb_strideh_6to0 = UInt(7.W)
}

class gpfb (PA_WIDTH:Int)extends RawModule{
  val io = IO(new gpfbIO)
  val wire = Wire(new gpfbwire)
  val reg = new gpfbreg

  wire.pfu_gpfb_clk_en  := io.pfu_gpfb_vld || wire.pfu_gpfb_create_gateclk_en;
  //例化两个gated_clk
  //例化gated_clk
  val gated_clk_inst = VecInit(Seq.fill(2)(Module(new gated_clk_cell).io))
  for(i <- 0 to 1 ){
    gated_clk_inst(i).clk_in := io.forever_cpuclk
    gated_clk_inst(i).external_en := "b0".U(1.W)
    gated_clk_inst(i).global_en := io.cp0_yy_clk_en

    gated_clk_inst(i).module_en := io.cp0_lsu_icg_en
    gated_clk_inst(i).pad_yy_icg_scan_en := io.pad_yy_icg_scan_en
    if(i == 0){
      wire.pfu_gpfb_clk := gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_gpfb_clk_en
    }else{
      wire.pfu_gpfb_create_clk :=gated_clk_inst(i).clk_out
      gated_clk_inst(i).local_en := wire.pfu_gpfb_create_clk_en
    }
  }

  //                 Register

  //| stride | stride_be_cache_line |
  //some compare info
  wire.pfu_gpfb_stride := io.pfu_gsdb_stride(10,0)
  wire.pfu_gpfb_stride_neg    := io.pfu_gsdb_stride_neg

  withClockAndReset(wire.pfu_gpfb_clk,(!io.cpurst_b.asBool).asAsyncReset){
    val pfu_gpfb_strideh_6to0 = RegInit(reg.pfu_gpfb_strideh_6to0,"b0".U(reg.pfu_gpfb_strideh_6to0.getWidth.W))
    val pfu_gpfb_inst_new_va_too_far_l1_pf_va = RegInit(reg.pfu_gpfb_inst_new_va_too_far_l1_pf_va,"b0".U(reg.pfu_gpfb_inst_new_va_too_far_l1_pf_va.getWidth.W))
    val pfu_gpfb_l1_pf_va_too_far_l2_pf_va = RegInit(reg.pfu_gpfb_l1_pf_va_too_far_l2_pf_va,"b0".U(reg.pfu_gpfb_l1_pf_va_too_far_l2_pf_va.getWidth.W))

    when(wire.pfu_gpfb_create_dp_vld){
      pfu_gpfb_strideh_6to0 := io.pfu_gsdb_strideh_6to0
    }

    when(wire.pfu_gpfb_create_dp_vld ||  wire.pfu_gpfb_reinit_vld){
      pfu_gpfb_inst_new_va_too_far_l1_pf_va  :=  "b0".U
      pfu_gpfb_l1_pf_va_too_far_l2_pf_va := "b0".U
    }.otherwise{
      when(wire.pfu_gpfb_l1_cmp_va_vld && wire.pfu_gpfb_l1sm_va_can_cmp){
        pfu_gpfb_inst_new_va_too_far_l1_pf_va := wire.pfu_gpfb_inst_new_va_too_far_l1_pf_va_set
      }
      when(wire.pfu_gpfb_l2_cmp_va_vld &&  wire.pfu_gpfb_l2sm_va_can_cmp){
        pfu_gpfb_l1_pf_va_too_far_l2_pf_va := wire.pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set
      }
    }
    wire.pfu_gpfb_pop_vld := io.pfu_pop_all_vld || io.pfu_gpfb_vld &&  ( wire.pfu_gpfb_dcache_hit_pop_req ||  pfu_gpfb_inst_new_va_too_far_l1_pf_va.asBool ||  pfu_gpfb_l1_pf_va_too_far_l2_pf_va.asBool ||  io.pfu_gsdb_gpfb_pop_req)
    wire.pfu_gpfb_strideh := "b0".U((wire.pfu_gpfb_strideh.getWidth-PA_WIDTH).W)  ## Fill(PA_WIDTH-11,wire.pfu_gpfb_stride_neg) ## wire.pfu_gpfb_stride(10,7) ## pfu_gpfb_strideh_6to0(6,0)

  }

  //                Generate pf_inst_vld signal
   wire.pfu_gpfb_pf_inst_vld := io.pfu_gpfb_vld && io.ld_da_pfu_pf_inst_vld
   wire.pfu_gpfb_act_vld := io.pfu_gpfb_vld && io.ld_da_pfu_act_vld

  //                Instance state machine
  //l1sm
  //l2sm
  //tsm

  //                Generate some compare info

  //------------------generate strideh------------------------


  wire.pfu_gpfb_l1_dist_strideh(PA_WIDTH-1,0)  := (Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel[3]) & (wire.pfu_gpfb_strideh(PA_WIDTH-5,0) ## "b0".U(4.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(2)) & (wire.pfu_gpfb_strideh(PA_WIDTH-4,0) ## "b0".U(3.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(1)) & (wire.pfu_gpfb_strideh(PA_WIDTH-3,0) ## "b0".U(2.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l1_dist_sel(0)) & (wire.pfu_gpfb_strideh(PA_WIDTH-2,0) ## "b0".U(1.W)))

  wire.pfu_gpfb_l2_dist_strideh(PA_WIDTH-1,0)  := (Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel[3]) & (wire.pfu_gpfb_strideh(PA_WIDTH-7,0) ## "b0".U(6.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(2)) & (wire.pfu_gpfb_strideh(PA_WIDTH-6,0) ## "b0".U(5.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(1)) & (wire.pfu_gpfb_strideh(PA_WIDTH-5,0) ## "b0".U(4.W))
    | Fill(PA_WIDTH,io.lsu_pfu_l2_dist_sel(0)) & (wire.pfu_gpfb_strideh(PA_WIDTH-4,0) ## "b0".U(3.W)))
  
  wire.pfb_gpfb_32strideh(PA_WIDTH-1,0)       := wire.pfu_gpfb_strideh(PA_WIDTH-6,0) ## "b0".U(5.W)
  wire.pfb_gpfb_128strideh(PA_WIDTH-1,0)       := wire.pfu_gpfb_strideh(PA_WIDTH-8,0) ## "b0".U(7.W)

//-----------------generate l1 too far----------------------
wire.pfu_gpfb_l1sm_diff_sub_32strideh(PA_WIDTH-1,0)  := wire.pfu_gpfb_l1_pf_va_sub_inst_new_va(PA_WIDTH-1,0) - wire.pfb_gpfb_32strideh(PA_WIDTH-1,0)

wire.pfu_gpfb_inst_new_va_too_far_l1_pf_va_set  := wire.pfu_gpfb_stride_neg ===  wire.pfu_gpfb_l1sm_diff_sub_32strideh(PA_WIDTH-1)

//-----------------generate l2 too far----------------------
wire.pfu_gpfb_l2sm_diff_sub_128strideh(PA_WIDTH-1,0)  := wire.pfu_gpfb_l2_pf_va_sub_l1_pf_va(PA_WIDTH-1,0) - wire.pfb_gpfb_128strideh(PA_WIDTH-1,0)

wire.pfu_gpfb_l1_pf_va_too_far_l2_pf_va_set := wire.pfu_gpfb_stride_neg ===  wire.pfu_gpfb_l2sm_diff_sub_128strideh(PA_WIDTH-1)

//==========================================================
//              Generate pop/reinit signal
//==========================================================
wire.pfu_gpfb_reinit_vld          := wire.pfu_gpfb_l1sm_reinit_req  ||  wire.pfu_gpfb_l2sm_reinit_req

//==========================================================
//                Generate create signal
//==========================================================
wire.pfu_gpfb_create_vld          := io.pfu_gsdb_gpfb_create_vld
wire.pfu_gpfb_create_dp_vld       := io.pfu_gsdb_gpfb_create_vld
wire.pfu_gpfb_create_gateclk_en   := io.pfu_gsdb_gpfb_create_vld
}