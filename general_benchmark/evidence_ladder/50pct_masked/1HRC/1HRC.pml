# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.23350583698679064

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 1+2+3+4+5+7+46+49+96+99
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HRC and resi 3 and name CA, 1HRC and resi 49 and name CA  # target=27.499997945438643 current=32.76360210689238
color yellow, pair_00
distance pair_01, 1HRC and resi 3 and name CA, 1HRC and resi 53 and name CA  # target=27.49998626689004 current=32.10938281626332
color yellow, pair_01
distance pair_02, 1HRC and resi 4 and name CA, 1HRC and resi 49 and name CA  # target=27.49999288912608 current=32.08680711272073
color yellow, pair_02
distance pair_03, 1HRC and resi 4 and name CA, 1HRC and resi 53 and name CA  # target=27.499960152499842 current=31.570817406310525
color yellow, pair_03
distance pair_04, 1HRC and resi 3 and name CA, 1HRC and resi 76 and name CA  # target=27.499949099547923 current=31.556479864409358
color yellow, pair_04
distance pair_05, 1HRC and resi 1 and name CA, 1HRC and resi 46 and name CA  # target=27.499956269820235 current=31.40372272888871
color yellow, pair_05
distance pair_06, 1HRC and resi 43 and name CA, 1HRC and resi 86 and name CA  # target=27.499887342533768 current=31.251664825409158
color yellow, pair_06
distance pair_07, 1HRC and resi 3 and name CA, 1HRC and resi 48 and name CA  # target=27.49989092352664 current=31.05241693551266
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
