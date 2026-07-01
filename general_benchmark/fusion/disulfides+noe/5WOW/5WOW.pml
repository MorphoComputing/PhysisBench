# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 5.059978735015948

load 5WOW.pdb, 5WOW
bg_color white
hide everything, 5WOW
show cartoon, 5WOW
color grey80, 5WOW
set cartoon_transparency, 0.1

select worst_residues, 5WOW and resi 1+2+5+14+16+18+19+32+34+36
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 5WOW and resi 3 and name CA, 5WOW and resi 30 and name CA  # target=3.807615173945761 current=8.900159880235071
color yellow, pair_00
distance pair_01, 5WOW and resi 20 and name CA, 5WOW and resi 29 and name CA  # target=4.863533156445691 current=8.7560430549448
color yellow, pair_01
distance pair_02, 5WOW and resi 10 and name CA, 5WOW and resi 27 and name CA  # target=4.186866660519927 current=6.739398810065731
color yellow, pair_02
distance pair_03, 5WOW and resi 8 and name CA, 5WOW and resi 16 and name CA  # target=5.725908191055621 current=3.380920522720233
color yellow, pair_03
distance pair_04, 5WOW and resi 21 and name CA, 5WOW and resi 29 and name CA  # target=5.790717228239924 current=8.081687406400913
color yellow, pair_04
distance pair_05, 5WOW and resi 9 and name CA, 5WOW and resi 27 and name CA  # target=4.1298718554000935 current=6.033110484323612
color yellow, pair_05
distance pair_06, 5WOW and resi 8 and name CA, 5WOW and resi 28 and name CA  # target=3.807615173945761 current=5.578682092388734
color yellow, pair_06
distance pair_07, 5WOW and resi 13 and name CA, 5WOW and resi 22 and name CA  # target=4.140074046378043 current=5.878205463354156
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
