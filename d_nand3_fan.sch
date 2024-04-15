v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 70 -520 70 -510 {
lab=in1}
N 70 -510 70 -500 {
lab=in1}
N 70 -500 70 -490 {
lab=in1}
N -40 -530 -40 -500 {
lab=VDD}
N -40 -440 -40 -430 {
lab=GND}
N -40 -430 -40 -420 {
lab=GND}
N 70 -430 70 -420 {
lab=GND}
N 70 -420 70 -410 {
lab=GND}
N 380 -620 430 -620 {
lab=in1}
N 420 -580 430 -580 {
lab=in2}
N 410 -580 420 -580 {
lab=in2}
N 400 -580 410 -580 {
lab=in2}
N 390 -580 400 -580 {
lab=in2}
N 380 -580 390 -580 {
lab=in2}
N 420 -540 430 -540 {
lab=in3}
N 410 -540 420 -540 {
lab=in3}
N 400 -540 410 -540 {
lab=in3}
N 390 -540 400 -540 {
lab=in3}
N 380 -540 390 -540 {
lab=in3}
N 550 -580 560 -580 {
lab=out}
N 560 -580 570 -580 {
lab=out}
N 570 -580 580 -580 {
lab=out}
N 580 -580 590 -580 {
lab=out}
N 70 -340 70 -330 {
lab=in2}
N 70 -330 70 -320 {
lab=in2}
N 70 -320 70 -310 {
lab=in2}
N 70 -250 70 -240 {
lab=GND}
N 70 -240 70 -230 {
lab=GND}
N 50 -730 50 -720 {
lab=in3}
N 50 -720 50 -710 {
lab=in3}
N 50 -710 50 -700 {
lab=in3}
N 50 -640 50 -630 {
lab=GND}
N 50 -630 50 -620 {
lab=GND}
C {devices/code_shown.sym} 610 -350 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 5ps 0.5us 
 meas tran delay_r1 trig v(in1) val =0.4 rise =2 targ v(out) val=0.4 fall =2
 meas tran delay_f1 trig v(in1) val =0.4 fall =1 targ v(out) val=0.4 rise =1
 meas tran delay_r2 trig v(in2) val =0.4 rise =1 targ v(out) val=0.4 fall =1
 meas tran delay_f2 trig v(in2) val =0.4 fall =1 targ v(out) val=0.4 rise =2
  let delay_avg_in1=(delay_r1+delay_f1)/2
  print delay_avg_in1
  let delay_avg_in2=(delay_r2+delay_f2)/2
  print delay_avg_in2
plot in2+2 in1+1 in3+3 out
.endc
"
}
C {devices/vsource.sym} -40 -470 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} 70 -410 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -40 -420 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -40 -530 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} 70 -460 0 0 {name=Vin value="pulse( 0 0.8 5ns 0.3ns .n3s 20ns 40ns)"
}
C {devices/lab_pin.sym} 70 -520 1 0 {name=p3 sig_type=std_logic lab=in1}
C {sky130_fd_pr/corner.sym} 830 -810 0 0 {name=CORNER only_toplevel=false corner=tt}
C {sky130_stdcells/nand3_1.sym} 490 -580 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 380 -620 0 0 {name=p1 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} 380 -580 0 0 {name=p4 sig_type=std_logic lab=in2}
C {devices/lab_pin.sym} 380 -540 0 0 {name=p5 sig_type=std_logic lab=in3
}
C {devices/lab_pin.sym} 590 -580 3 0 {name=p2 sig_type=std_logic lab=out}
C {devices/gnd.sym} 70 -230 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} 70 -280 0 0 {name=Vin1 value="pulse( 0 0.8 .0001ns .3ns .3ns 40ns 80ns)"
}
C {devices/lab_pin.sym} 70 -340 1 0 {name=p7 sig_type=std_logic lab=in2}
C {devices/gnd.sym} 50 -620 0 0 {name=l4 lab=GND}
C {devices/vsource.sym} 50 -670 0 0 {name=Vin2 value="pulse( 0 0.8 10ns 0.3ns .3ns 80ns 160ns)"
}
C {devices/lab_pin.sym} 50 -730 1 0 {name=p8 sig_type=std_logic lab=in3}
