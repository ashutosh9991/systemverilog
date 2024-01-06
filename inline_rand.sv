class packet;
rand logic [1:0]a;
randc bit [2:0]b;

logic [1:0]c;

constraint cc{c<2;}
function void display();
$display("a=%0d,b=%0d,c=%0d",a,b,c);
endfunction

endclass


module tb;

packet pkt;
int ok;
initial begin 
pkt=new();

//ok=pkt.randomize(b,c);
for(ok=0;ok<5;ok++) begin
if(pkt.randomize(b,c))
pkt.display();
else
$display("randomization failed");
end

end

endmodule
