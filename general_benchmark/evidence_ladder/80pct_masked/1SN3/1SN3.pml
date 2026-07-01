# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 7.382799870167267

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 1+2+8+9+22+27+30+32+41+42
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SN3 and resi 9+20+26+34+43
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SN3 and resi 31 and name CA, 1SN3 and resi 46 and name CA  # target=15.519545418282634 current=5.383376029718071
color yellow, pair_00
distance pair_01, 1SN3 and resi 32 and name CA, 1SN3 and resi 43 and name CA  # target=21.73239487628274 current=14.338785486147513
color yellow, pair_01
distance pair_02, 1SN3 and resi 14 and name CA, 1SN3 and resi 25 and name CA  # target=12.545929669577305 current=5.552000525456608
color yellow, pair_02
distance pair_03, 1SN3 and resi 26 and name CA, 1SN3 and resi 59 and name CA  # target=20.434643781028072 current=13.488581628260505
color yellow, pair_03
distance pair_04, 1SN3 and resi 32 and name CA, 1SN3 and resi 40 and name CA  # target=18.830249232304162 current=12.020836025383137
color yellow, pair_04
distance pair_05, 1SN3 and resi 30 and name CA, 1SN3 and resi 39 and name CA  # target=13.441601612442462 current=7.009941014429116
color yellow, pair_05
distance pair_06, 1SN3 and resi 6 and name CA, 1SN3 and resi 26 and name CA  # target=14.575897742664857 current=8.38294713806361
color yellow, pair_06
distance pair_07, 1SN3 and resi 14 and name CA, 1SN3 and resi 27 and name CA  # target=11.593066930617114 current=5.762201060142667
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
