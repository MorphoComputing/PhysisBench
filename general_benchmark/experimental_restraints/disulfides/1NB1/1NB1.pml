# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.935757789060539

load 1NB1.pdb, 1NB1
bg_color white
hide everything, 1NB1
show cartoon, 1NB1
color grey80, 1NB1
set cartoon_transparency, 0.1

select worst_residues, 1NB1 and resi 1+5+6+7+11+12+18+19+24+26
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1NB1 and resi 9 and name CA, 1NB1 and resi 21 and name CA  # target=5.526827568351721 current=7.52169670321305
color yellow, pair_00
distance pair_01, 1NB1 and resi 4 and name CA, 1NB1 and resi 16 and name CA  # target=5.526827568351721 current=5.331329279377938
color yellow, pair_01

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
