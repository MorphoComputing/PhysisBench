# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.767933125055467

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 6+22+24+26+36+44+48+49+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 5 and name CA, 1EGF and resi 19 and name CA  # target=5.526827568351721 current=6.693061425166942
color yellow, pair_00
distance pair_01, 1EGF and resi 32 and name CA, 1EGF and resi 41 and name CA  # target=5.526827568351721 current=5.060985437542547
color yellow, pair_01
distance pair_02, 1EGF and resi 13 and name CA, 1EGF and resi 30 and name CA  # target=5.526827568351721 current=5.357896633576767
color yellow, pair_02

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
