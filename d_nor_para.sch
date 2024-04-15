v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -100 -190 -70 -190 {
lab=out}
N -280 -210 -220 -210 {
lab=in}
N -280 -170 -220 -170 {
lab=in}
N -530 -120 -530 -110 {
lab=in}
N -530 -110 -530 -100 {
lab=in}
N -530 -100 -530 -90 {
lab=in}
N -580 -120 -580 -90 {
lab=VDD}
N -580 -30 -580 -20 {
lab=GND}
N -580 -20 -580 -10 {
lab=GND}
N -530 -30 -530 -20 {
lab=GND}
N -530 -20 -530 -10 {
lab=GND}
C {devices/code_shown.sym} -140 -90 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 10ps 1us 
 meas tran delay trig v(in) val =0.4 rise =2 targ v(out) val=0.4 fall =2
 meas tran curr_integ integ v2#branch from=0ns to=80ns
 let E=curr_integ *0.8
 let P=E/80ns
 meas tran curr_avg avg v2#branch from=0ns to=80ns
 let P1=curr_avg *0.8
 echo "delay="
 print delay
.endc
"
}
C {devices/lab_pin.sym} -70 -190 2 0 {name=p2 sig_type=std_logic lab=out}
C {sky130_stdcells/nor2_1.sym} -160 -190 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} -280 -210 0 0 {name=p1 sig_type=std_logic lab=in}
C {devices/lab_pin.sym} -280 -170 0 0 {name=p3 sig_type=std_logic lab=in}
C {devices/vsource.sym} -580 -60 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} -530 -10 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -580 -10 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -580 -120 0 0 {name=l5 lab=VDD}
C {devices/vsource.sym} -530 -60 0 0 {name=Vin value="pulse( 0 .8 10ns 10ns 10ns 40ns 100ns)"
}
C {devices/lab_pin.sym} -530 -120 1 0 {name=p4 sig_type=std_logic lab=in}
C {sky130_fd_pr/corner.sym} 190 -330 0 0 {name=CORNER only_toplevel=false corner=tt}
