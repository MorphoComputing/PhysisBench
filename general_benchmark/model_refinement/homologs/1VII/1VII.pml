# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.990525572007713

load 1VII.pdb, 1VII
bg_color white
hide everything, 1VII
show cartoon, 1VII
color grey80, 1VII
set cartoon_transparency, 0.1

select worst_residues, 1VII and resi 1+4+7+14+15+23+28+29+30+33
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1VII and resi 6 and name CA, 1VII and resi 33 and name CA  # target=12.855958484270877 current=10.14194760610546
color yellow, pair_00
distance pair_01, 1VII and resi 2 and name CA, 1VII and resi 33 and name CA  # target=16.48249303426945 current=14.182810071307264
color yellow, pair_01
distance pair_02, 1VII and resi 5 and name CA, 1VII and resi 33 and name CA  # target=14.143242875894178 current=11.904836112053712
color yellow, pair_02
distance pair_03, 1VII and resi 9 and name CA, 1VII and resi 33 and name CA  # target=10.073250141502866 current=7.896398549024342
color yellow, pair_03
distance pair_04, 1VII and resi 3 and name CA, 1VII and resi 33 and name CA  # target=17.46902241953117 current=15.633167358561554
color yellow, pair_04
distance pair_05, 1VII and resi 4 and name CA, 1VII and resi 33 and name CA  # target=17.532524576205105 current=15.741410407761908
color yellow, pair_05
distance pair_06, 1VII and resi 8 and name CA, 1VII and resi 33 and name CA  # target=13.827013913266242 current=12.154979926427474
color yellow, pair_06
distance pair_07, 1VII and resi 7 and name CA, 1VII and resi 33 and name CA  # target=14.995598650343734 current=13.46684553883574
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
