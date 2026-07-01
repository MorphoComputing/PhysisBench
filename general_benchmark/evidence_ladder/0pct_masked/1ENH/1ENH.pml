# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.02130149239970377

load 1ENH.pdb, 1ENH
bg_color white
hide everything, 1ENH
show cartoon, 1ENH
color grey80, 1ENH
set cartoon_transparency, 0.1

select worst_residues, 1ENH and resi 1+2+3+4+7+18+20+50+51+52
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1ENH and resi 1 and name CA, 1ENH and resi 20 and name CA  # target=23.779364778444844 current=24.417017219422952
color yellow, pair_00
distance pair_01, 1ENH and resi 1 and name CA, 1ENH and resi 18 and name CA  # target=23.737439094375652 current=24.372838427328706
color yellow, pair_01
distance pair_02, 1ENH and resi 30 and name CA, 1ENH and resi 52 and name CA  # target=23.68305261573007 current=24.307367758643743
color yellow, pair_02
distance pair_03, 1ENH and resi 36 and name CA, 1ENH and resi 52 and name CA  # target=23.623446506642086 current=24.235741581895784
color yellow, pair_03
distance pair_04, 1ENH and resi 34 and name CA, 1ENH and resi 51 and name CA  # target=24.05194015078448 current=24.636200239875848
color yellow, pair_04
distance pair_05, 1ENH and resi 26 and name CA, 1ENH and resi 52 and name CA  # target=23.50362158195231 current=24.079668313221983
color yellow, pair_05
distance pair_06, 1ENH and resi 36 and name CA, 1ENH and resi 51 and name CA  # target=23.444265251155066 current=23.998212890388995
color yellow, pair_06
distance pair_07, 1ENH and resi 7 and name CA, 1ENH and resi 25 and name CA  # target=23.28085434756635 current=23.79309967966128
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
