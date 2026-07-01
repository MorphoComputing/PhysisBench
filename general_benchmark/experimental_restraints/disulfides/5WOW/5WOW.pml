# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.274256593233744

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+6+11+13+14+18+26+33+36
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 3 and name CA, 5WOW and resi 20 and name CA  # target=5.526827568351721 current=6.876925814087534
color yellow, pair_00
distance pair_01, 5WOW and resi 10 and name CA, 5WOW and resi 22 and name CA  # target=5.526827568351721 current=6.31699585462059
color yellow, pair_01
distance pair_02, 5WOW and resi 16 and name CA, 5WOW and resi 28 and name CA  # target=5.526827568351721 current=6.033127006968965
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
