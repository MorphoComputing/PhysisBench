# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5025901525106474

load 2CI2.pdb, 2CI2
bg_color white
hide everything, 2CI2
show cartoon, 2CI2
color grey80, 2CI2
set cartoon_transparency, 0.1

select worst_residues, 2CI2 and resi 7+11+22+36+37+38+46+49+53+58
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2CI2 and resi 1 and name CA, 2CI2 and resi 63 and name CA  # target=10.989535201186607 current=10.219260556109345
color yellow, pair_00
distance pair_01, 2CI2 and resi 7 and name CA, 2CI2 and resi 42 and name CA  # target=22.396643014241015 current=22.9955237534468
color yellow, pair_01
distance pair_02, 2CI2 and resi 9 and name CA, 2CI2 and resi 60 and name CA  # target=5.73140904329772 current=6.2965341119043226
color yellow, pair_02
distance pair_03, 2CI2 and resi 1 and name CA, 2CI2 and resi 55 and name CA  # target=26.881016151929227 current=26.335502772717994
color yellow, pair_03
distance pair_04, 2CI2 and resi 5 and name CA, 2CI2 and resi 39 and name CA  # target=21.120069392463556 current=21.653627551638223
color yellow, pair_04
distance pair_05, 2CI2 and resi 25 and name CA, 2CI2 and resi 34 and name CA  # target=23.990056817498818 current=24.523147032092545
color yellow, pair_05
distance pair_06, 2CI2 and resi 25 and name CA, 2CI2 and resi 40 and name CA  # target=23.284895797278473 current=23.807953959758684
color yellow, pair_06
distance pair_07, 2CI2 and resi 14 and name CA, 2CI2 and resi 40 and name CA  # target=26.88492180161744 current=26.367017756551185
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
