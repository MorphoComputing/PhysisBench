# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.41189617685785346

load 4PTI.pdb, 4PTI
bg_color white
hide everything, 4PTI
show cartoon, 4PTI
color grey80, 4PTI
set cartoon_transparency, 0.1

select worst_residues, 4PTI and resi 9+14+16+26+28+33+35+39+47+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 4PTI and resi 3 and name CA, 4PTI and resi 15 and name CA  # target=22.90565030638112 current=23.67608718535619
color yellow, pair_00
distance pair_01, 4PTI and resi 27 and name CA, 4PTI and resi 38 and name CA  # target=24.352533515864163 current=24.900543211894945
color yellow, pair_01
distance pair_02, 4PTI and resi 11 and name CA, 4PTI and resi 35 and name CA  # target=5.7027151459697105 current=6.245113053420854
color yellow, pair_02
distance pair_03, 4PTI and resi 9 and name CA, 4PTI and resi 19 and name CA  # target=10.463944828630416 current=9.922182152494132
color yellow, pair_03
distance pair_04, 4PTI and resi 2 and name CA, 4PTI and resi 37 and name CA  # target=21.24333035272544 current=21.756433287475847
color yellow, pair_04
distance pair_05, 4PTI and resi 1 and name CA, 4PTI and resi 11 and name CA  # target=20.853593901594845 current=21.356285408332617
color yellow, pair_05
distance pair_06, 4PTI and resi 12 and name CA, 4PTI and resi 35 and name CA  # target=6.547759300724578 current=7.0411971457036
color yellow, pair_06
distance pair_07, 4PTI and resi 28 and name CA, 4PTI and resi 40 and name CA  # target=17.608264348583077 current=18.09507729559354
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
