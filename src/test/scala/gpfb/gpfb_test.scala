package gpfb
import IOinst._

import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chiseltest._
import firrtl.options.TargetDirAnnotation
import org.scalatest.freespec.AnyFreeSpec



class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {
  val PA_WIDTH: Int = 40
  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new tsm(PA_WIDTH)), TargetDirAnnotation("verilog"))
  )
}

