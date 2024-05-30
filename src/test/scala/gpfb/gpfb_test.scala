package gpfbTOP


import chisel3._
import chisel3.stage.{ChiselGeneratorAnnotation, ChiselStage}
import chisel3.tester.ChiselScalatestTester
import chiseltest._
import firrtl.CustomDefaultRegisterEmission
import firrtl.options.TargetDirAnnotation
import org.scalatest.FreeSpec
import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.freespec.AnyFreeSpec



class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {

  val PA_WIDTH: Int = 32

  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new gpfb(PA_WIDTH)), TargetDirAnnotation("Verilog"))
  )
}


/*object FullAdderGen extends App {
  (new chisel3.stage.ChiselStage).emitVerilog(new gpfb(32))
}*/
/*
new ChiselStage().execute(
  Array("-X", "mverilog", "-o", s"${name}.v"),
  Seq(
    ChiselGeneratorAnnotation(new gpfb(PA_WIDTH)),
    CustomDefaultRegisterEmission(
      useInitAsPreset = false,
      disableRandomization = true
    )
  )
)*/