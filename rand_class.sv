class pkt;
rand logic [1:0] mode;
randc logic [2:0] key;

logic parityM,parityK;
constraint c_mode{mode<3;}
constraint c_key{key>2; key<6; }

function void pre_randomize();
parityM=^mode;
endfunction

function void post_randomize();
parityK=^key;
endfunction

function void display();
$display("mode=%0d , key=%0d" ,mode,key);
endfunction

endclass

class wrap_pkt;
rand logic[2:0] ack;
rand pkt packet;


function new();
packet=new();
endfunction


function void display();
$display("ack=%0d,mode=%0d,key=%0d",ack,packet.mode,packet.key);
$display("parityM=%0d,parityK=%0d",packet.parityM,packet.parityK);
endfunction

endclass


module tb;

wrap_pkt p1;
int ok;
initial begin
p1=new();

for(int i=0;i<10;i++) begin
if(p1.randomize())begin
//$display("parity of mode=%0d",p1.parityM);
p1.display();
//$display("parity of key=%0d",p1.parityK);
end
else begin
$display("randomization failed");
end
end

ok=p1.randomize();
$display("ok=%0d",ok);
end
endmodule
