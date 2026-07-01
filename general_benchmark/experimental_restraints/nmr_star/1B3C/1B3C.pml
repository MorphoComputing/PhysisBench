# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 9.295106209820876

load 1B3C.pdb, 1B3C
bg_color white
hide everything, 1B3C
show cartoon, 1B3C
color grey80, 1B3C
set cartoon_transparency, 0.1

select worst_residues, 1B3C and resi 7+8+10+35+36+57+59+60+61+62
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1B3C and resi 4+9+25
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1B3C and resi 10 and name CA, 1B3C and resi 59 and name CA  # target=6.479226123880891 current=15.138817864415532
color yellow, pair_00
distance pair_01, 1B3C and resi 20 and name CA, 1B3C and resi 39 and name CA  # target=4.647636918307805 current=10.11879135390806
color yellow, pair_01
distance pair_02, 1B3C and resi 11 and name CA, 1B3C and resi 57 and name CA  # target=4.028908588844348 current=7.997792537806621
color yellow, pair_02
distance pair_03, 1B3C and resi 34 and name CA, 1B3C and resi 51 and name CA  # target=5.533144452470395 current=9.19956366188866
color yellow, pair_03
distance pair_04, 1B3C and resi 2 and name CA, 1B3C and resi 50 and name CA  # target=4.893392851656878 current=8.172922038773791
color yellow, pair_04
distance pair_05, 1B3C and resi 24 and name CA, 1B3C and resi 45 and name CA  # target=3.3610127334848605 current=6.585046503424821
color yellow, pair_05
distance pair_06, 1B3C and resi 19 and name CA, 1B3C and resi 39 and name CA  # target=6.114476574701069 current=9.298058414492028
color yellow, pair_06
distance pair_07, 1B3C and resi 36 and name CA, 1B3C and resi 49 and name CA  # target=4.893392851656878 current=8.012861686462282
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
