# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.482389712790935

load 2HIU.pdb, 2HIU
bg_color white
hide everything, 2HIU
show cartoon, 2HIU
color grey80, 2HIU
set cartoon_transparency, 0.1

select worst_residues, 2HIU and resi 8+12+17+20+21+22+23+40+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 2HIU and resi 6 and name CA, 2HIU and resi 25 and name CA  # target=5.526827568351721 current=4.0896350696612505
color yellow, pair_00
distance pair_01, 2HIU and resi 19 and name CA, 2HIU and resi 37 and name CA  # target=5.526827568351721 current=6.702397520101957
color yellow, pair_01

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
