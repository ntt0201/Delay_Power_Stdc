v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 140 -490 140 -480 {
lab=in1}
N 140 -480 140 -470 {
lab=in1}
N 140 -470 140 -460 {
lab=in1}
N 30 -500 30 -470 {
lab=VDD}
N 30 -410 30 -400 {
lab=GND}
N 30 -400 30 -390 {
lab=GND}
N 140 -400 140 -390 {
lab=GND}
N 140 -390 140 -380 {
lab=GND}
N 450 -590 500 -590 {
lab=in1}
N 490 -550 500 -550 {
lab=in2}
N 480 -550 490 -550 {
lab=in2}
N 470 -550 480 -550 {
lab=in2}
N 460 -550 470 -550 {
lab=in2}
N 450 -550 460 -550 {
lab=in2}
N 490 -510 500 -510 {
lab=in3}
N 480 -510 490 -510 {
lab=in3}
N 470 -510 480 -510 {
lab=in3}
N 460 -510 470 -510 {
lab=in3}
N 450 -510 460 -510 {
lab=in3}
N 620 -550 630 -550 {
lab=out}
N 630 -550 640 -550 {
lab=out}
N 140 -310 140 -300 {
lab=in2}
N 140 -300 140 -290 {
lab=in2}
N 140 -290 140 -280 {
lab=in2}
N 140 -220 140 -210 {
lab=GND}
N 140 -210 140 -200 {
lab=GND}
N 120 -700 120 -690 {
lab=in3}
N 120 -690 120 -680 {
lab=in3}
N 120 -680 120 -670 {
lab=in3}
N 120 -610 120 -600 {
lab=GND}
N 120 -600 120 -590 {
lab=GND}
C {devices/code_shown.sym} 680 -320 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 5ps 0.5us 
 meas tran delay_r1 trig v(in1) val =0.4 rise =2 targ v(out) val=0.4 fall =2
 meas tran delay_f1 trig v(in1) val =0.4 fall =1 targ v(out) val=0.4 rise =1
 meas tran delay_r2 trig v(in2) val =0.4 rise =1 targ v(out) val=0.4 fall =1
 meas tran delay_f2 trig v(in2) val =0.4 fall =1 targ v(out) val=0.4 rise =2
 meas tran curr_integ integ v2#branch from=0ns to=80ns
 let E=curr_integ *0.8
 let Pavg=E/80n
 meas tran curr_avg avg V2#branch from=0ns to=80ns
 let Pavg1=curr_avg*0.8
let delay_avg_in1=(delay_r1+delay_f1)/2
  print delay_avg_in1
  let delay_avg_in2=(delay_r2+delay_f2)/2
  print delay_avg_in2
plot in1
.endc
"
}
C {devices/vsource.sym} 30 -440 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} 140 -380 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} 30 -390 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} 30 -500 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} 140 -430 0 0 {name=Vin value="pulse( 0 0.8 5ns 0.3ns .3ns 20ns 40ns)"
}
C {devices/lab_pin.sym} 140 -490 1 0 {name=p3 sig_type=std_logic lab=in1}
C {sky130_fd_pr/corner.sym} 900 -780 0 0 {name=CORNER only_toplevel=false corner=tt}
C {sky130_stdcells/nand3_1.sym} 560 -550 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 450 -590 0 0 {name=p1 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 450 -550 0 0 {name=p4 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 450 -510 0 0 {name=p5 sig_type=std_logic lab=in3
}
C {devices/lab_pin.sym} 630 -550 3 0 {name=p2 sig_type=std_logic lab=out}
C {devices/gnd.sym} 140 -200 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 140 -250 0 0 {name=Vin1 value="pulse( 0 0.8 .0001ns .3ns .3ns 40ns 80ns)"
}
C {devices/lab_pin.sym} 140 -310 1 0 {name=p7 sig_type=std_logic lab=in2}
C {devices/gnd.sym} 120 -590 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 120 -640 0 0 {name=Vin2 value="pulse( 0 0.8 10ns 0.3ns .3ns 80ns 160ns)"
}
C {devices/lab_pin.sym} 120 -700 1 0 {name=p8 sig_type=std_logic lab=in3}
