# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.43997485396579783

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 3+13+15+18+22+26+35+41+42+60
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 4+8+12+51
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 18 and name CA, 1B3C and resi 41 and name CA  # target=12.811955220876422 current=8.514849900393434
color yellow, pair_00
distance pair_01, 1B3C and resi 4 and name CA, 1B3C and resi 26 and name CA  # target=11.472546360074679 current=7.929462517469838
color yellow, pair_01
distance pair_02, 1B3C and resi 32 and name CA, 1B3C and resi 51 and name CA  # target=15.559343622686372 current=12.427562546625033
color yellow, pair_02
distance pair_03, 1B3C and resi 23 and name CA, 1B3C and resi 58 and name CA  # target=14.373322522027493 current=17.371741695990213
color yellow, pair_03
distance pair_04, 1B3C and resi 12 and name CA, 1B3C and resi 52 and name CA  # target=16.44106945362731 current=19.321036672675355
color yellow, pair_04
distance pair_05, 1B3C and resi 19 and name CA, 1B3C and resi 62 and name CA  # target=24.087411270254517 current=26.87048487852825
color yellow, pair_05
distance pair_06, 1B3C and resi 14 and name CA, 1B3C and resi 51 and name CA  # target=19.540488857483513 current=22.31709860125493
color yellow, pair_06
distance pair_07, 1B3C and resi 20 and name CA, 1B3C and resi 40 and name CA  # target=11.993239845045427 current=9.241170857037446
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
