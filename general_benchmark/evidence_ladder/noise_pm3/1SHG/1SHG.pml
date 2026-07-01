# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.2247666935974064

load 1SHG.pdb, 1SHG
bg_color white
hide everything, 1SHG
show cartoon, 1SHG
color grey80, 1SHG
set cartoon_transparency, 0.1

select worst_residues, 1SHG and resi 1+2+7+15+27+28+31+40+48+55
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SHG and resi 32+49+55+85+194+316
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SHG and resi 2 and name CA, 1SHG and resi 50 and name CA  # target=22.76614235930809 current=13.044169772345663
color yellow, pair_00
distance pair_01, 1SHG and resi 17 and name CA, 1SHG and resi 31 and name CA  # target=9.04533628238952 current=16.830931095493014
color yellow, pair_01
distance pair_02, 1SHG and resi 3 and name CA, 1SHG and resi 47 and name CA  # target=17.459779565334557 current=9.856319083761983
color yellow, pair_02
distance pair_03, 1SHG and resi 8 and name CA, 1SHG and resi 16 and name CA  # target=19.308320176902644 current=11.879275814753866
color yellow, pair_03
distance pair_04, 1SHG and resi 5 and name CA, 1SHG and resi 51 and name CA  # target=13.186370751283013 current=5.758176067906782
color yellow, pair_04
distance pair_05, 1SHG and resi 17 and name CA, 1SHG and resi 28 and name CA  # target=7.5199083937457845 current=14.795093584889916
color yellow, pair_05
distance pair_06, 1SHG and resi 17 and name CA, 1SHG and resi 47 and name CA  # target=13.438832414907248 current=6.26259373646009
color yellow, pair_06
distance pair_07, 1SHG and resi 2 and name CA, 1SHG and resi 10 and name CA  # target=11.670000077727757 current=18.81181360073148
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
