# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08850697347852798

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 10+11+20+34+35+36+38+53+54+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1CSP and resi 21 and name CA, 1CSP and resi 37 and name CA  # target=27.499047408239363 current=30.05611597576433
color yellow, pair_00
distance pair_01, 1CSP and resi 11 and name CA, 1CSP and resi 21 and name CA  # target=27.48942175141445 current=28.753411308574282
color yellow, pair_01
distance pair_02, 1CSP and resi 20 and name CA, 1CSP and resi 36 and name CA  # target=27.48862083568139 current=28.55506995284321
color yellow, pair_02
distance pair_03, 1CSP and resi 22 and name CA, 1CSP and resi 35 and name CA  # target=27.48281879578041 current=28.46569856138791
color yellow, pair_03
distance pair_04, 1CSP and resi 22 and name CA, 1CSP and resi 38 and name CA  # target=23.754476892345295 current=24.363799967524955
color yellow, pair_04
distance pair_05, 1CSP and resi 2 and name CA, 1CSP and resi 11 and name CA  # target=23.52850355577955 current=24.1270789564835
color yellow, pair_05
distance pair_06, 1CSP and resi 23 and name CA, 1CSP and resi 35 and name CA  # target=27.458859388947744 current=28.035683521871658
color yellow, pair_06
distance pair_07, 1CSP and resi 55 and name CA, 1CSP and resi 64 and name CA  # target=23.974094340569827 current=24.550800706151588
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
