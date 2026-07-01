# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.561252804981474

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 13+14+16+23+26+28+48+49+50+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SHG and resi 7+12+24+31+39+104
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SHG and resi 14 and name CA, 1SHG and resi 26 and name CA  # target=19.086061510262077 current=4.120014552750987
color yellow, pair_00
distance pair_01, 1SHG and resi 11 and name CA, 1SHG and resi 28 and name CA  # target=16.992001985374866 current=4.923121936749595
color yellow, pair_01
distance pair_02, 1SHG and resi 14 and name CA, 1SHG and resi 33 and name CA  # target=19.065311069396483 current=7.020324011639166
color yellow, pair_02
distance pair_03, 1SHG and resi 13 and name CA, 1SHG and resi 23 and name CA  # target=19.84585011354542 current=7.804687731093065
color yellow, pair_03
distance pair_04, 1SHG and resi 2 and name CA, 1SHG and resi 14 and name CA  # target=22.5143123034001 current=11.451548903193288
color yellow, pair_04
distance pair_05, 1SHG and resi 7 and name CA, 1SHG and resi 28 and name CA  # target=18.639680416678917 current=7.627627729632112
color yellow, pair_05
distance pair_06, 1SHG and resi 24 and name CA, 1SHG and resi 45 and name CA  # target=14.335310262050655 current=3.459981347279486
color yellow, pair_06
distance pair_07, 1SHG and resi 42 and name CA, 1SHG and resi 50 and name CA  # target=21.291915365523543 current=10.566469954511838
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
