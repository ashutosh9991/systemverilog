class packet;

 rand logic[1:0] a;
 randc logic [1:0] b;

randc logic [2:0]s1,s2;

endclass


module top;
packet pkt;
int ok,state1,state2;
initial begin

pkt=new();

state1=pkt.a.rand_mode();

$display("state1=%0d",state1);
//$display("state=%0d",pkt.rand_mode());
//pkt.rand_mode(0);
//$display("state=%0d",pkt.rand_mode());
pkt.b.rand_mode(0);

 $display("state2=%0d",pkt.b.rand_mode());
//$display("state=%0d",pkt.rand_mode());

for(ok=0;ok<10;ok++) begin
if(pkt.randomize())
$display("a=%0d,b=%0d,s1",pkt.a,pkt.b);
else
$display("randomaization failed");
end
end

endmodule

