# Makertech Proforge 2S g-code

This repo contains my customised g-code, used with the Makertech customised (Ultimaker) Cura app, which runs before and after any g-code generated from Cura. I've found problems with the g-code as provided by Makertech and have added my own optimisations which suit my own setup. They may not suit yours so please check you are happy with what this code is doing before using this yourself.

## Modifications
### Heating the hotend after homing and autoleveling

I've had regular problems starting prints due to getting melted filament around the nozzle, which then acts like a mop when starting to print the first layer. What would happen with the stock g-code at the start of the print is the hotend would get up to temperature and start to ooze filament. When the homing and autoleveling runs the nozzle gets so close to the heated bed the molten filament gets squashed back onto the nozzle. This problem is worse with the aluminium heatbed vs the original steel one because the autoleveling sensor is an induction sensor and the steel bed could be detected further away than the aluminium bed. My z offset with the stock heat bed mat was 0.2mm.

To combat this I've moved the code which heats the hotend (M104 and M109) until after the homing (G28) and autoleveling (G29) codes are run. Right now as a beginner still struggling to reliably get the first layer printing well enough to allow the print to continue, I'll take an improved start up procedure over the shortest possible startup time, although over time I expect I will revisit this and try to optimise further. I've seen other printer and users tweaked startup code on forums where they preheat the hotend to 140 before autoleveling, which I will probably try once I'm happy with the other settings.

## To Do

* Understand the G1 E parameter better and extend the Prime Hotend code to print for longer and more of a brim pattern so I can check whether the nozzle will print a successful brim especially as it alters direction from X only to Y only to negative X only to negative Y only. A circular pattern would be very interesting to use if the G-Code is feasible.
* Pre-heat the nozzle to just below the glass transition point for the filament, based on the selected filament properties in Cura, to reduce the overall startup time.
* Investigate if it is possible to load the bed leveling settings via G-Code so I don't have to perform the bed levelling before every print. Running this every time may actually be recommended in case of ambient temperature changes or any other factors which might change the printer bed surface. When I start getting more successful first layers and prints first time the startup time on prints taking several hours will become less of a frustration.