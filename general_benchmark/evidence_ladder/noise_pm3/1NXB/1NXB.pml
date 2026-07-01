# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.226095281958176

load 1NXB.pdb, 1NXB
bg_color white
hide everything, 1NXB
show cartoon, 1NXB
color grey80, 1NXB
set cartoon_transparency, 0.1

select worst_residues, 1NXB and resi 7+8+15+17+18+19+31+34+36+37
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1NXB and resi 12+29+40+119+257+448
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1NXB and resi 14 and name CA, 1NXB and resi 52 and name CA  # target=11.006655276059162 current=19.059196702472057
color yellow, pair_00
distance pair_01, 1NXB and resi 3 and name CA, 1NXB and resi 13 and name CA  # target=11.407002376336525 current=3.9417402755142628
color yellow, pair_01
distance pair_02, 1NXB and resi 23 and name CA, 1NXB and resi 56 and name CA  # target=12.813880933250617 current=5.450754271506562
color yellow, pair_02
distance pair_03, 1NXB and resi 45 and name CA, 1NXB and resi 56 and name CA  # target=23.636326225987766 current=16.395086065482772
color yellow, pair_03
distance pair_04, 1NXB and resi 4 and name CA, 1NXB and resi 18 and name CA  # target=20.31993772465036 current=13.228226030049466
color yellow, pair_04
distance pair_05, 1NXB and resi 29 and name CA, 1NXB and resi 60 and name CA  # target=9.297161380209076 current=16.363554251660016
color yellow, pair_05
distance pair_06, 1NXB and resi 26 and name CA, 1NXB and resi 35 and name CA  # target=14.036804151834284 current=7.174108662989418
color yellow, pair_06
distance pair_07, 1NXB and resi 19 and name CA, 1NXB and resi 59 and name CA  # target=9.921068355185172 current=16.775307492820808
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
