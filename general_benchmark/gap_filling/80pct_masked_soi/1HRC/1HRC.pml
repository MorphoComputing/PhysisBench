# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 4.922076728381621

load 1HRC.pdb, 1HRC
bg_color white
hide everything, 1HRC
show cartoon, 1HRC
color grey80, 1HRC
set cartoon_transparency, 0.1

select worst_residues, 1HRC and resi 45+46+48+49+50+51+75+76+98+102
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HRC and resi 50+77+101+103
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HRC and resi 28 and name CA, 1HRC and resi 76 and name CA  # target=14.423685903081115 current=3.7999996847294604
color yellow, pair_00
distance pair_01, 1HRC and resi 29 and name CA, 1HRC and resi 76 and name CA  # target=16.26948662831572 current=5.820303042635258
color yellow, pair_01
distance pair_02, 1HRC and resi 43 and name CA, 1HRC and resi 53 and name CA  # target=15.023144369344477 current=4.6014759906957945
color yellow, pair_02
distance pair_03, 1HRC and resi 46 and name CA, 1HRC and resi 54 and name CA  # target=14.6047452063728 current=4.379295025841705
color yellow, pair_03
distance pair_04, 1HRC and resi 43 and name CA, 1HRC and resi 54 and name CA  # target=16.54654991336352 current=6.783667915360116
color yellow, pair_04
distance pair_05, 1HRC and resi 24 and name CA, 1HRC and resi 102 and name CA  # target=15.702237099665876 current=5.98416152555547
color yellow, pair_05
distance pair_06, 1HRC and resi 48 and name CA, 1HRC and resi 92 and name CA  # target=27.380422988457354 current=17.717847833752508
color yellow, pair_06
distance pair_07, 1HRC and resi 60 and name CA, 1HRC and resi 101 and name CA  # target=12.788026272841787 current=21.459478939561578
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
