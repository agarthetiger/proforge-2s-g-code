;--- Start Proforge 2S Start Marlin G-code ---
M301 P16.75 I0.91 D76.84 ;PID Autotune settings
M92 E87.50 ;Extruder calibration adjustment
M201 X900 Y900 Z50 E5000 ;Set max accelleration

M140 S{material_bed_temperature_layer_0} ;Set Bed Temp
G28 ;Home
G29 ;Autolevel Bed
M104 S{material_print_temperature_layer_0} T0; Heat up Hotend 1 (T0)
M109 S{material_print_temperature_layer_0} T0; Wait for Hotend 1 (T0)
G1 F8000 X10 Y3 ;Move hotend to bottom left corner
G1 Z3 ;Move Hotend to assumed Z Home

;--- Z-Offset, must come after G28/G29
G92 Z0.8 ; Z-Offset in 0.1mm increments (increase if first layer too high, decrease if too low)

G1 Z{layer_height_0} ;Set to first layer height
M82 ;absolute extrusion mode
G92 E0 ;Zero Extruder
G1 F1500 X290 E12 ;Prime Hotend