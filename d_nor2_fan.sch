v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -570 -260 -570 -250 {
lab=in1}
N -570 -250 -570 -240 {
lab=in1}
N -570 -240 -570 -230 {
lab=in1}
N -660 -260 -660 -230 {
lab=VDD}
N -660 -170 -660 -160 {
lab=GND}
N -660 -160 -660 -150 {
lab=GND}
N -570 -170 -570 -160 {
lab=GND}
N -570 -160 -570 -150 {
lab=GND}
N -410 -310 -380 -310 {
lab=in1}
N -410 -270 -380 -270 {
lab=in2}
N -260 -290 -230 -290 {
lab=out}
N -540 -70 -540 -60 {
lab=in2}
N -540 -60 -540 -50 {
lab=in2}
N -540 -50 -540 -40 {
lab=in2}
N -540 20 -540 30 {
lab=GND}
N -540 30 -540 40 {
lab=GND}
N -150 -290 -120 -290 {
lab=out1}
C {devices/code_shown.sym} -300 -190 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 5ps .5us 
 meas tran delay_r1 trig v(in1) val =0.4 rise =2 targ v(out) val=0.4 fall =2
 meas tran delay_f1 trig v(in1) val =0.4 fall  =4 targ v(out) val=0.4 rise =4
 meas tran delay_r2 trig v(in2) val =0.4 rise =2 targ v(out) val=0.4 fall =3
 meas tran delay_f2 trig v(in2) val =0.4 fall  =1 targ v(out) val=0.4 rise =1
meas tran curr_integ integ v2#branch from=0ns to=80ns
 let E=curr_integ *0.8
 let Pavg=E/80n
 meas tran curr_avg avg V2#branch from=0ns to=80ns
 let Pavg1=curr_avg*0.8
let delay_avg_in1=(delay_r1+delay_f1)/2
  print delay_avg_in1
  let delay_avg_in2=(delay_r2+delay_f2)/2
  print delay_avg_in2
plot in2+2 in1+1 out
.endc
"
}
C {sky130_fd_pr/corner.sym} 220 -440 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/vsource.sym} -660 -200 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} -570 -150 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -660 -150 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -660 -260 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} -230 -290 3 0 {name=p2 sig_type=std_logic lab=out}
C {devices/vsource.sym} -570 -200 0 0 {name=Vin value="pulse( 0 .8 10ns .3ns .3ns 20ns 40ns)"
}
C {devices/lab_pin.sym} -570 -260 1 0 {name=p3 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} -410 -310 0 0 {name=p1 sig_type=std_logic lab=in1
}
C {devices/lab_pin.sym} -410 -270 0 0 {name=p4 sig_type=std_logic lab=in2
}
C {devices/gnd.sym} -540 40 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -540 -10 0 0 {name=Vin1 value="pulse( 0 .8 1ns .3ns .3ns 40ns 80ns)"
}
C {devices/lab_pin.sym} -540 -70 1 0 {name=p5 sig_type=std_logic lab=in2}
C {sky130_stdcells/nor2_1.sym} -320 -290 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_1.sym} -190 -290 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} -120 -290 3 0 {name=p6 sig_type=std_logic lab=out1}
