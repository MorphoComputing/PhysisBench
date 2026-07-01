# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.189570532781296

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+6+7+9+11+12+13+14+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1HPH and resi 11 and name CA, 1HPH and resi 30 and name CA  # target=27.00510694570994 current=22.282381694523245
color yellow, pair_00
distance pair_01, 1HPH and resi 11 and name CA, 1HPH and resi 29 and name CA  # target=26.061304972896977 current=21.920371149775267
color yellow, pair_01
distance pair_02, 1HPH and resi 11 and name CA, 1HPH and resi 33 and name CA  # target=27.46550560017355 current=24.073859637518844
color yellow, pair_02
distance pair_03, 1HPH and resi 10 and name CA, 1HPH and resi 30 and name CA  # target=27.3149777026673 current=24.017180572642296
color yellow, pair_03
distance pair_04, 1HPH and resi 10 and name CA, 1HPH and resi 29 and name CA  # target=26.909630143940948 current=23.711560618491806
color yellow, pair_04
distance pair_05, 1HPH and resi 11 and name CA, 1HPH and resi 35 and name CA  # target=27.494034211482816 current=24.588365733243116
color yellow, pair_05
distance pair_06, 1HPH and resi 11 and name CA, 1HPH and resi 34 and name CA  # target=27.489204954091246 current=24.649991069979432
color yellow, pair_06
distance pair_07, 1HPH and resi 4 and name CA, 1HPH and resi 31 and name CA  # target=27.49971223387516 current=30.31440577459105
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
