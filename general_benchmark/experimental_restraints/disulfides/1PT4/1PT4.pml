# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.407868958888566

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+2+5+7+8+11+12+13+14+24
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 9 and name CA, 1PT4 and resi 21 and name CA  # target=5.526827568351721 current=7.106728375309135
color yellow, pair_00
distance pair_01, 1PT4 and resi 4 and name CA, 1PT4 and resi 16 and name CA  # target=5.526827568351721 current=5.8298947827082035
color yellow, pair_01

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
