# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.033034257890048

load 1GB1.pdb, 1GB1
bg_color white
hide everything, 1GB1
show cartoon, 1GB1
color grey80, 1GB1
set cartoon_transparency, 0.1

select worst_residues, 1GB1 and resi 10+20+21+22+23+35+36+37+46+47
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1GB1 and resi 3+7+17+18
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1GB1 and resi 17 and name CA, 1GB1 and resi 28 and name CA  # target=5.713081305182573 current=9.188981130738288
color yellow, pair_00
distance pair_01, 1GB1 and resi 2 and name CA, 1GB1 and resi 17 and name CA  # target=4.028908588844348 current=7.234558411267147
color yellow, pair_01
distance pair_02, 1GB1 and resi 4 and name CA, 1GB1 and resi 32 and name CA  # target=5.972317811973412 current=9.145124976526779
color yellow, pair_02
distance pair_03, 1GB1 and resi 1 and name CA, 1GB1 and resi 18 and name CA  # target=3.6508476368543064 current=6.7814434955754415
color yellow, pair_03
distance pair_04, 1GB1 and resi 15 and name CA, 1GB1 and resi 32 and name CA  # target=7.0291754254254215 current=10.103505350435249
color yellow, pair_04
distance pair_05, 1GB1 and resi 3 and name CA, 1GB1 and resi 50 and name CA  # target=4.1974619454839 current=7.1748553149121586
color yellow, pair_05
distance pair_06, 1GB1 and resi 11 and name CA, 1GB1 and resi 36 and name CA  # target=5.353974409403234 current=8.282642088987451
color yellow, pair_06
distance pair_07, 1GB1 and resi 4 and name CA, 1GB1 and resi 53 and name CA  # target=5.1756846552692375 current=8.096351911205904
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
