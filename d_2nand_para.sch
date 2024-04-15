v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -190 0 -190 10 {
lab=in1}
N -190 10 -190 20 {
lab=in1}
N -190 20 -190 30 {
lab=in1}
N -280 0 -280 30 {
lab=VDD}
N -280 90 -280 100 {
lab=GND}
N -280 100 -280 110 {
lab=GND}
N -190 90 -190 100 {
lab=GND}
N -190 100 -190 110 {
lab=GND}
N -30 -50 0 -50 {
lab=in1}
N -30 -10 0 -10 {
lab=in2}
N 120 -30 150 -30 {
lab=out}
N -160 190 -160 200 {
lab=in2}
N -160 200 -160 210 {
lab=in2}
N -160 210 -160 220 {
lab=in2}
N -160 280 -160 290 {
lab=GND}
N -160 290 -160 300 {
lab=GND}
C {sky130_stdcells/nand2_1.sym} 60 -30 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/code_shown.sym} 80 70 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 1ps 100ns 
 meas tran delay_r1 trig v(in1) val =0.4 rise =2 targ v(out) val=0.4 fall =2
 meas tran delay_f1 trig v(in1) val =0.4 fall =1 targ v(out) val=0.4 rise =1
 meas tran delay_r2 trig v(in2) val =0.4 rise =1 targ v(out) val=0.4 fall =1
 meas tran delay_f2 trig v(in2) val =0.4 fall =1 targ v(out) val=0.4 rise =2
meas tran curr_inte integ v2#branch from=0ns to=80ns 
 	let E=curr_inte * 0.8 
	 let Pavg = E/80n
 meas tran curr_avg avg v2#branch from=0ns to =80ns
 let Pavg1= curr_avg *0.8
  let delay_avg_in1=(delay_r1+delay_f1)/2
  print delay_avg_in1
  let delay_avg_in2=(delay_r2+delay_f2)/2
  print delay_avg_in2
.endc
"
}
C {sky130_fd_pr/corner.sym} 270 -150 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/vsource.sym} -280 60 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} -190 110 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -280 110 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -280 0 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 150 -30 2 0 {name=p2 sig_type=std_logic lab=out}
C {devices/vsource.sym} -190 60 0 0 {name=Vin value="pulse( 0 0.8 0.3ns .3ns .3ns 20ns 40ns)"
}
C {devices/lab_pin.sym} -190 0 1 0 {name=p3 sig_type=std_logic lab=in1}
C {devices/lab_pin.sym} -30 -50 0 0 {name=p1 sig_type=std_logic lab=in1
}
C {devices/lab_pin.sym} -30 -10 0 0 {name=p4 sig_type=std_logic lab=in2
}
C {devices/gnd.sym} -160 300 0 0 {name=l3 lab=GND}
C {devices/vsource.sym} -160 250 0 0 {name=Vin1 value="pulse( 0 0.8 9ns .3ns .3ns 40ns 80ns)"
}
C {devices/lab_pin.sym} -160 190 1 0 {name=p5 sig_type=std_logic lab=in2}
