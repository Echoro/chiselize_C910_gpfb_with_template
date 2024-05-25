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
class l1sm_test extends FreeSpec with ChiselScalatestTester {
  "Gcd should calculate proper greatest common denominator" in {

    val PA_WIDTH: Int = 4

    test(new l1sm(PA_WIDTH))
      .withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

        /*
                val testInputsA  = Seq.tabulate(math.pow(2, 4).toInt) { i =>
                  Seq.tabulate(n) { j =>
                    ((i >> j) & 1).U(1.W)
                  }
                }
                val testInputsB = testInputsA

                val testInputC = Seq(0.U,1.U)



                // 对所有可能的输入进行测试
                for (inputC <- testInputC;i <- 0 until n ) {
                  for (inputA <- testInputsA) {
                    for (inputB <- testInputsB) {

                      dut.io.inputC.poke(inputC)
                      for (i <- inputA.indices) {
                        dut.io.inputA(i).poke(inputA(i))
                      }
                      dut.io.inputB.zip(inputB).foreach { case (b, inB) =>
                        b.poke(inB)
                      }

                      //               激活时钟周期
                      dut.clock.step()


                    }
                  }
                }*/
      }
  }
}*/

class SC007GTV extends AnyFreeSpec with ChiselScalatestTester {

  val PA_WIDTH: Int = 32

  (new chisel3.stage.ChiselStage).execute(
    Array("-X", "verilog"),
    Seq(ChiselGeneratorAnnotation(() => new l1sm(PA_WIDTH)), TargetDirAnnotation("Verilog"))
  )
}
