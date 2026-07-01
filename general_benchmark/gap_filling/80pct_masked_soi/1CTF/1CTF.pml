# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4961580184219701

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+2+3+4+9+10+39+46+51+66
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CTF and resi 4 and name CA, 1CTF and resi 40 and name CA  # target=4.417934392855695 current=5.654792153435405
color yellow, pair_00
distance pair_01, 1CTF and resi 1 and name CA, 1CTF and resi 66 and name CA  # target=7.788984928013154 current=6.758774483216587
color yellow, pair_01
distance pair_02, 1CTF and resi 3 and name CA, 1CTF and resi 52 and name CA  # target=10.197498564797304 current=9.340767822054998
color yellow, pair_02
distance pair_03, 1CTF and resi 2 and name CA, 1CTF and resi 39 and name CA  # target=10.31910830162712 current=11.136709294092679
color yellow, pair_03
distance pair_04, 1CTF and resi 4 and name CA, 1CTF and resi 35 and name CA  # target=13.276313542796819 current=14.014861340694337
color yellow, pair_04
distance pair_05, 1CTF and resi 12 and name CA, 1CTF and resi 48 and name CA  # target=24.033315189397335 current=24.751002602700726
color yellow, pair_05
distance pair_06, 1CTF and resi 1 and name CA, 1CTF and resi 12 and name CA  # target=23.270124282821957 current=23.915204121961203
color yellow, pair_06
distance pair_07, 1CTF and resi 23 and name CA, 1CTF and resi 44 and name CA  # target=13.826823778323384 current=14.469966819514934
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
