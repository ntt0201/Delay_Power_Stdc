v {xschem version=3.4.1 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 190 -10 200 -10 {
lab=out}
N 200 -10 210 -10 {
lab=out}
N 60 -10 110 -10 {
lab=in}
N -180 10 -180 20 {
lab=in}
N -180 20 -180 30 {
lab=in}
N -180 30 -180 40 {
lab=in}
N -230 10 -230 40 {
lab=VDD}
N -230 100 -230 110 {
lab=GND}
N -230 110 -230 120 {
lab=GND}
N -180 100 -180 110 {
lab=GND}
N -180 110 -180 120 {
lab=GND}
N 290 -10 320 -10 {
lab=out2}
C {sky130_stdcells/inv_1.sym} 150 -10 0 0 {name=x1 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/vsource.sym} -230 70 0 0 {name=V2 value=0.8}
C {devices/gnd.sym} -180 120 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -230 120 0 0 {name=l2 lab=GND}
C {devices/vdd.sym} -230 10 0 0 {name=l5 lab=VDD}
C {devices/lab_pin.sym} 60 -10 0 0 {name=p2 sig_type=std_logic lab=in}
C {sky130_fd_pr/corner.sym} 420 -40 0 0 {name=CORNER only_toplevel=false corner=tt}
C {devices/vsource.sym} -180 70 0 0 {name=Vin value="pulse( 0 0.8 .3ns .3ns 0.3ns 40ns 80ns)"
}
C {devices/code_shown.sym} -90 160 0 0 {name=SPICE only_toplevel=false value="
.save all
.inc /home/thanhtung/eda/unic-cass/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice  
.control
 tran 10ps 1us 
 meas tran delay_r trig v(in) val=0.4 rise=3 targ v(out) val=0.4 fall=3
 meas tran delay_f trig v(in) val=0.4 fall =3 targ v(out) val =0.4 rise=3
 let delay_avg=(delay_r+delay_f)/2
 print delay_avg
 .endc
"
}
C {devices/lab_pin.sym} -180 10 1 0 {name=p3 sig_type=std_logic lab=in}
C {sky130_stdcells/inv_1.sym} 250 -10 0 0 {name=x2 VGND=GND VNB=GND VPB=VDD VPWR=VDD prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 200 -10 3 0 {name=p4 sig_type=std_logic lab=out}
C {devices/lab_pin.sym} 320 -10 3 0 {name=p6 sig_type=std_logic lab=out2}
