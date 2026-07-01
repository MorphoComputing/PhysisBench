# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.2422924949160867

load 1POH.pdb, 1POH
bg_color white
hide everything, 1POH
show cartoon, 1POH
color grey80, 1POH
set cartoon_transparency, 0.1

select worst_residues, 1POH and resi 3+4+11+20+45+46+53+65+66+70
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1POH and resi 4+10+18+24
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1POH and resi 17 and name CA, 1POH and resi 70 and name CA  # target=21.707078203110505 current=15.031141164919276
color yellow, pair_00
distance pair_01, 1POH and resi 25 and name CA, 1POH and resi 66 and name CA  # target=12.734561874402727 current=6.471932884855182
color yellow, pair_01
distance pair_02, 1POH and resi 16 and name CA, 1POH and resi 65 and name CA  # target=26.539242208443554 current=20.549681961223005
color yellow, pair_02
distance pair_03, 1POH and resi 4 and name CA, 1POH and resi 61 and name CA  # target=4.494700148265353 current=10.45291248649029
color yellow, pair_03
distance pair_04, 1POH and resi 23 and name CA, 1POH and resi 65 and name CA  # target=17.85815946153184 current=12.194852979825509
color yellow, pair_04
distance pair_05, 1POH and resi 4 and name CA, 1POH and resi 39 and name CA  # target=14.084035542860518 current=19.710279500419713
color yellow, pair_05
distance pair_06, 1POH and resi 4 and name CA, 1POH and resi 58 and name CA  # target=10.198268664891739 current=15.800725046737584
color yellow, pair_06
distance pair_07, 1POH and resi 3 and name CA, 1POH and resi 11 and name CA  # target=21.767844179069854 current=16.281970547365017
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
