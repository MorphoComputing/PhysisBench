# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.054936419600432065

load 1OMB.pdb, 1OMB
bg_color white
hide everything, 1OMB
show cartoon, 1OMB
color grey80, 1OMB
set cartoon_transparency, 0.1

select worst_residues, 1OMB and resi 3+16+17+18+21+24+25+26+27+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1OMB and resi 17 and name CA, 1OMB and resi 26 and name CA  # target=24.63678454519942 current=24.87863820912959
color yellow, pair_00
distance pair_01, 1OMB and resi 17 and name CA, 1OMB and resi 28 and name CA  # target=22.215283708075525 current=22.36686593775625
color yellow, pair_01
distance pair_02, 1OMB and resi 2 and name CA, 1OMB and resi 25 and name CA  # target=22.47167456200769 current=22.602402846347736
color yellow, pair_02
distance pair_03, 1OMB and resi 16 and name CA, 1OMB and resi 25 and name CA  # target=22.34999998846798 current=22.478443197260276
color yellow, pair_03
distance pair_04, 1OMB and resi 5 and name CA, 1OMB and resi 32 and name CA  # target=4.532210027252503 current=4.415647921014283
color yellow, pair_04
distance pair_05, 1OMB and resi 1 and name CA, 1OMB and resi 26 and name CA  # target=20.960234061981616 current=21.07221767177129
color yellow, pair_05
distance pair_06, 1OMB and resi 16 and name CA, 1OMB and resi 24 and name CA  # target=20.589582727973326 current=20.696380930848527
color yellow, pair_06
distance pair_07, 1OMB and resi 1 and name CA, 1OMB and resi 25 and name CA  # target=20.72951392069067 current=20.831544867536092
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
