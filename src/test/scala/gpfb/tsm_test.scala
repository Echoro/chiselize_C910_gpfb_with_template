package gpfb


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
    Seq(ChiselGeneratorAnnotation(() => new tsm(PA_WIDTH)), TargetDirAnnotation("Verilog"))
  )
}
*/