package gpfbTOP


import chisel3._
import chisel3.stage.ChiselGeneratorAnnotation
import chisel3.tester.ChiselScalatestTester
import chiseltest._
import firrtl.options.TargetDirAnnotation

import org.scalatest.FreeSpec
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.freespec.AnyFreeSpec


/*
class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {

  val PA_WIDTH: Int = 32

  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new l1sm(PA_WIDTH,1)), TargetDirAnnotation("Verilog"))
  )
}*/
/*
object FullAdderGen extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new l1sm(32))
}*/

