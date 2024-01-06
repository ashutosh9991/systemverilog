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

module tb;

pkt p1;

initial begin
p1=new();

for(int i=0;i<16;i++) begin
if(p1.randomize())begin
$display("parity of mode=%0d",p1.parityM);
p1.display();
$display("parity of key=%0d",p1.parityK);
end
else begin
$display("randomization failed");
end
end
end
endmodule
