# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 2.449227913148734

load 1R1F.pdb, 1R1F
bg_color white
hide everything, 1R1F
show cartoon, 1R1F
color grey80, 1R1F
set cartoon_transparency, 0.1

select worst_residues, 1R1F and resi 8+9+10+19+25+26+28+32+34+35
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1R1F and resi 8 and name CA, 1R1F and resi 26 and name CA  # target=13.558727089303996 current=9.730811816477466
color yellow, pair_00
distance pair_01, 1R1F and resi 8 and name CA, 1R1F and resi 27 and name CA  # target=10.77706324416511 current=7.696661268299085
color yellow, pair_01
distance pair_02, 1R1F and resi 7 and name CA, 1R1F and resi 26 and name CA  # target=9.768441885341014 current=7.345091023690921
color yellow, pair_02
distance pair_03, 1R1F and resi 10 and name CA, 1R1F and resi 26 and name CA  # target=12.110145899176901 current=10.127228674108327
color yellow, pair_03
distance pair_04, 1R1F and resi 9 and name CA, 1R1F and resi 26 and name CA  # target=14.218787199012118 current=12.340538534576668
color yellow, pair_04
distance pair_05, 1R1F and resi 6 and name CA, 1R1F and resi 26 and name CA  # target=9.952046828266331 current=8.341904137177785
color yellow, pair_05
distance pair_06, 1R1F and resi 7 and name CA, 1R1F and resi 27 and name CA  # target=7.125941286079359 current=5.517802469005638
color yellow, pair_06
distance pair_07, 1R1F and resi 8 and name CA, 1R1F and resi 25 and name CA  # target=13.983365599391828 current=12.49592500701989
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
