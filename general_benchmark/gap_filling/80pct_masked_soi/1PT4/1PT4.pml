# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.5062028993962053

load 1PT4.pdb, 1PT4
bg_color white
hide everything, 1PT4
show cartoon, 1PT4
color grey80, 1PT4
set cartoon_transparency, 0.1

select worst_residues, 1PT4 and resi 1+2+8+11+19+20+21+23+24+26
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1PT4 and resi 1 and name CA, 1PT4 and resi 27 and name CA  # target=12.63514617561185 current=6.983509459009353
color yellow, pair_00
distance pair_01, 1PT4 and resi 2 and name CA, 1PT4 and resi 12 and name CA  # target=10.470555432950857 current=13.801752142554188
color yellow, pair_01
distance pair_02, 1PT4 and resi 1 and name CA, 1PT4 and resi 11 and name CA  # target=8.560274166295336 current=11.601633448155365
color yellow, pair_02
distance pair_03, 1PT4 and resi 1 and name CA, 1PT4 and resi 14 and name CA  # target=9.608660980275125 current=11.656770287807802
color yellow, pair_03
distance pair_04, 1PT4 and resi 10 and name CA, 1PT4 and resi 26 and name CA  # target=16.158229408319443 current=17.446445166451298
color yellow, pair_04
distance pair_05, 1PT4 and resi 4 and name CA, 1PT4 and resi 19 and name CA  # target=4.989346438333122 current=3.7554307220669347
color yellow, pair_05
distance pair_06, 1PT4 and resi 7 and name CA, 1PT4 and resi 25 and name CA  # target=15.511724163290442 current=16.74352435094554
color yellow, pair_06
distance pair_07, 1PT4 and resi 9 and name CA, 1PT4 and resi 19 and name CA  # target=10.100655934537862 current=8.932289833598071
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
