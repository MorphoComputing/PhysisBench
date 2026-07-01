# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS | CA RMSD: 0.0698282304239379

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+13+18+20+21+22+28+38+44+49
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CTF and resi 10 and name CA, 1CTF and resi 44 and name CA  # target=27.476318564756276 current=28.28635117099885
color yellow, pair_00
distance pair_01, 1CTF and resi 14 and name CA, 1CTF and resi 44 and name CA  # target=23.91145886896314 current=24.52194121181294
color yellow, pair_01
distance pair_02, 1CTF and resi 12 and name CA, 1CTF and resi 48 and name CA  # target=24.033315189397335 current=24.626146841482306
color yellow, pair_02
distance pair_03, 1CTF and resi 14 and name CA, 1CTF and resi 47 and name CA  # target=23.42944195060405 current=24.01271228560126
color yellow, pair_03
distance pair_04, 1CTF and resi 27 and name CA, 1CTF and resi 66 and name CA  # target=23.421050603182074 current=24.000126944260586
color yellow, pair_04
distance pair_05, 1CTF and resi 1 and name CA, 1CTF and resi 11 and name CA  # target=23.818341269066657 current=24.3840222824005
color yellow, pair_05
distance pair_06, 1CTF and resi 27 and name CA, 1CTF and resi 51 and name CA  # target=23.45032164789289 current=24.00556485395903
color yellow, pair_06
distance pair_07, 1CTF and resi 9 and name CA, 1CTF and resi 49 and name CA  # target=23.38266649395514 current=23.923870015490266
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
