import chisel3._

val PA_WIDTH = 32

class l2smIO extends Bundle{



}
class l2sm (PA_WIDTH : Int) extends RawModule{
  val io = IO(new l2smIO)


}