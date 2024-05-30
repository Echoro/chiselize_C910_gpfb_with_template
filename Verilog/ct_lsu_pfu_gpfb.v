module ct_lsu_pfu_gpfb (
  cp0_lsu_icg_en,
  cp0_lsu_pfu_mmu_dis,
  cp0_yy_clk_en,
  cp0_yy_priv_mode,
  cpurst_b,
  forever_cpuclk,
  ld_da_page_sec_ff,
  ld_da_page_share_ff,
  ld_da_pfu_act_vld,
  ld_da_pfu_pf_inst_vld,
  ld_da_pfu_va,
  ld_da_ppn_ff,
  lsu_pfu_l1_dist_sel,
  lsu_pfu_l2_dist_sel,
  pad_yy_icg_scan_en,
  pfu_biu_pe_req_sel_l1,
  pfu_dcache_pref_en,
  pfu_get_page_sec,
  pfu_get_page_share,
  pfu_get_ppn,
  pfu_get_ppn_err,
  pfu_get_ppn_vld,
  pfu_gpfb_biu_pe_req,
  pfu_gpfb_biu_pe_req_grnt,
  pfu_gpfb_biu_pe_req_src,
  pfu_gpfb_from_lfb_dcache_hit,
  pfu_gpfb_from_lfb_dcache_miss,
  pfu_gpfb_l1_page_sec,
  pfu_gpfb_l1_page_share,
  pfu_gpfb_l1_pf_addr,
  pfu_gpfb_l1_vpn,
  pfu_gpfb_l2_page_sec,
  pfu_gpfb_l2_page_share,
  pfu_gpfb_l2_pf_addr,
  pfu_gpfb_l2_vpn,
  pfu_gpfb_mmu_pe_req,
  pfu_gpfb_mmu_pe_req_grnt,
  pfu_gpfb_mmu_pe_req_src,
  pfu_gpfb_priv_mode,
  pfu_gpfb_vld,
  pfu_gsdb_gpfb_create_vld,
  pfu_gsdb_gpfb_pop_req,
  pfu_gsdb_stride,
  pfu_gsdb_stride_neg,
  pfu_gsdb_strideh_6to0,
  pfu_l2_pref_en,
  pfu_mmu_pe_req_sel_l1,
  pfu_pop_all_vld
);
input           cp0_lsu_icg_en;                           
input           cp0_lsu_pfu_mmu_dis;                      
input           cp0_yy_clk_en;                            
input   [1 :0]  cp0_yy_priv_mode;                         
input           cpurst_b;                                 
input           forever_cpuclk;                           
input           ld_da_page_sec_ff;                        
input           ld_da_page_share_ff;                      
input           ld_da_pfu_act_vld;                        
input           ld_da_pfu_pf_inst_vld;                    
input   [39:0]  ld_da_pfu_va;                             
input   [27:0]  ld_da_ppn_ff;                             
input   [3 :0]  lsu_pfu_l1_dist_sel;                      
input   [3 :0]  lsu_pfu_l2_dist_sel;                      
input           pad_yy_icg_scan_en;                       
input           pfu_biu_pe_req_sel_l1;                    
input           pfu_dcache_pref_en;                       
input           pfu_get_page_sec;                         
input           pfu_get_page_share;                       
input   [27:0]  pfu_get_ppn;                              
input           pfu_get_ppn_err;                          
input           pfu_get_ppn_vld;                          
input           pfu_gpfb_biu_pe_req_grnt;                 
input           pfu_gpfb_from_lfb_dcache_hit;             
input           pfu_gpfb_from_lfb_dcache_miss;            
input           pfu_gpfb_mmu_pe_req_grnt;                 
input           pfu_gsdb_gpfb_create_vld;                 
input           pfu_gsdb_gpfb_pop_req;                    
input   [10:0]  pfu_gsdb_stride;                          
input           pfu_gsdb_stride_neg;                      
input   [6 :0]  pfu_gsdb_strideh_6to0;                    
input           pfu_l2_pref_en;                           
input           pfu_mmu_pe_req_sel_l1;                    
input           pfu_pop_all_vld;                          
output          pfu_gpfb_biu_pe_req;                      
output  [1 :0]  pfu_gpfb_biu_pe_req_src;                  
output          pfu_gpfb_l1_page_sec;                     
output          pfu_gpfb_l1_page_share;                   
output  [39:0]  pfu_gpfb_l1_pf_addr;                      
output  [27:0]  pfu_gpfb_l1_vpn;                          
output          pfu_gpfb_l2_page_sec;                     
output          pfu_gpfb_l2_page_share;                   
output  [39:0]  pfu_gpfb_l2_pf_addr;                      
output  [27:0]  pfu_gpfb_l2_vpn;                          
output          pfu_gpfb_mmu_pe_req;                      
output  [1 :0]  pfu_gpfb_mmu_pe_req_src;                  
output  [1 :0]  pfu_gpfb_priv_mode;                       
output          pfu_gpfb_vld;             


ct_lsu_pfu_gpfb_t gpfb_test(
.io_cp0_lsu_icg_en(cp0_lsu_icg_en),
.io_cp0_lsu_pfu_mmu_dis(cp0_lsu_pfu_mmu_dis),
.io_cp0_yy_clk_en(cp0_yy_clk_en),
.io_cp0_yy_priv_mode(cp0_yy_priv_mode),
.io_cpurst_b(cpurst_b),
.io_forever_cpuclk(forever_cpuclk),
.io_ld_da_page_sec_ff(ld_da_page_sec_ff),
.io_ld_da_page_share_ff(ld_da_page_share_ff),
.io_ld_da_pfu_act_vld(ld_da_pfu_act_vld),
.io_ld_da_pfu_pf_inst_vld(ld_da_pfu_pf_inst_vld),
.io_ld_da_pfu_va(ld_da_pfu_va),
.io_ld_da_ppn_ff(ld_da_ppn_ff),
.io_lsu_pfu_l1_dist_sel(lsu_pfu_l1_dist_sel),
.io_lsu_pfu_l2_dist_sel(lsu_pfu_l2_dist_sel),
.io_pad_yy_icg_scan_en(pad_yy_icg_scan_en),
.io_pfu_biu_pe_req_sel_l1(pfu_biu_pe_req_sel_l1),
.io_pfu_dcache_pref_en(pfu_dcache_pref_en),
.io_pfu_get_page_sec(pfu_get_page_sec),
.io_pfu_get_page_share(pfu_get_page_share),
.io_pfu_get_ppn(pfu_get_ppn),
.io_pfu_get_ppn_err(pfu_get_ppn_err),
.io_pfu_get_ppn_vld(pfu_get_ppn_vld),
.io_pfu_gpfb_biu_pe_req(pfu_gpfb_biu_pe_req),
.io_pfu_gpfb_biu_pe_req_grnt(pfu_gpfb_biu_pe_req_grnt),
.io_pfu_gpfb_biu_pe_req_src(pfu_gpfb_biu_pe_req_src),
.io_pfu_gpfb_from_lfb_dcache_hit(pfu_gpfb_from_lfb_dcache_hit),
.io_pfu_gpfb_from_lfb_dcache_miss(pfu_gpfb_from_lfb_dcache_miss),
.io_pfu_gpfb_l1_page_sec(pfu_gpfb_l1_page_sec),
.io_pfu_gpfb_l1_page_share(pfu_gpfb_l1_page_share),
.io_pfu_gpfb_l1_pf_addr(pfu_gpfb_l1_pf_addr),
.io_pfu_gpfb_l1_vpn(pfu_gpfb_l1_vpn),
.io_pfu_gpfb_l2_page_sec(pfu_gpfb_l2_page_sec),
.io_pfu_gpfb_l2_page_share(pfu_gpfb_l2_page_share),
.io_pfu_gpfb_l2_pf_addr(pfu_gpfb_l2_pf_addr),
.io_pfu_gpfb_l2_vpn(pfu_gpfb_l2_vpn),
.io_pfu_gpfb_mmu_pe_req(pfu_gpfb_mmu_pe_req),
.io_pfu_gpfb_mmu_pe_req_grnt(pfu_gpfb_mmu_pe_req_grnt),
.io_pfu_gpfb_mmu_pe_req_src(pfu_gpfb_mmu_pe_req_src),
.io_pfu_gpfb_priv_mode(pfu_gpfb_priv_mode),
.io_pfu_gpfb_vld(pfu_gpfb_vld),
.io_pfu_gsdb_gpfb_create_vld(pfu_gsdb_gpfb_create_vld),
.io_pfu_gsdb_gpfb_pop_req(pfu_gsdb_gpfb_pop_req),
.io_pfu_gsdb_stride(pfu_gsdb_stride),
.io_pfu_gsdb_stride_neg(pfu_gsdb_stride_neg),
.io_pfu_gsdb_strideh_6to0(pfu_gsdb_strideh_6to0),
.io_pfu_l2_pref_en(pfu_l2_pref_en),
.io_pfu_mmu_pe_req_sel_l1(pfu_mmu_pe_req_sel_l1),
.io_pfu_pop_all_vld(pfu_pop_all_vld)
);



endmodule
